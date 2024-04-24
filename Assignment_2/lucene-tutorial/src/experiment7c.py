"""
Learning to Rank models (Total 15, 3 for report).
You should experiment with at least 1 model for pointwise, pairwise, and
list wise approaches. You are free (but not restricted) to use the libraries
referred here for your experiments
"""

# This is where we shall code our list wise ltr model

from datetime import datetime
from tqdm import tqdm
import pandas as pd
from py4j.java_gateway import JavaGateway 
import torch
from torch.utils.data import random_split, DataLoader, Dataset  # type: ignore
import logging

logging.basicConfig(
    level=logging.INFO,
    datefmt="%d-%b-%y %H:%M:%S",
    filename=f"./ltr_logs/{datetime.now().strftime('%d-%m-%Y_%H-%M-%S')}.log",
    filemode="w",
    format="%(asctime)s [%(levelname)s] %(message)s ",
)

gateway = JavaGateway() 
luceneServer = gateway.entry_point

BATCH_SIZE = 128

# Read the merged qrel file and delete the column named 'ZERO'
merged_qrel = pd.read_csv('../../nfcorpus/merged.qrel', sep="\t")
del merged_qrel['ZERO']

# read queries
queries_dev = pd.read_csv('../../nfcorpus/dev.titles.queries', sep="	", names=['QUERY_ID', 'QUERY'])
queries_train = pd.read_csv('../../nfcorpus/train.titles.queries', sep="	", names=['QUERY_ID', 'QUERY'])
queries_test = pd.read_csv('../../nfcorpus/test.titles.queries', sep="	", names=['QUERY_ID', 'QUERY'])

# add them to a single mapping between query id and query
queries = pd.concat([queries_dev, queries_train, queries_test])
del queries_dev, queries_train, queries_test
# convert this into a dict
queries = dict(zip(queries['QUERY_ID'], queries['QUERY']))

class LTRDataset(Dataset):
    def __init__(self):
        # Create an array of datasets
        self.dataset = []
        self.outputs = []
        
        # Now we need to get the features for each query-document pair
        logging.info("Getting features for each query-document-document pair")
        query_document_id_map = {}
        for i in tqdm(range(0, len(merged_qrel))):
            query_id = merged_qrel.iloc[i]['QUERY_ID']
            doc_id = merged_qrel.iloc[i]['DOC_ID']
            relevance = merged_qrel.iloc[i]['RELEVANCE']
            
            if query_id not in query_document_id_map:
                query_document_id_map[query_id] = [{
                    "document_id": doc_id,
                    "relevance": relevance
                }]
            else:
                query_document_id_map[query_id].append({
                    "document_id": doc_id,
                    "relevance": relevance
                })
    
        # Now we process per query
        for query_id in tqdm(query_document_id_map): 
            # we need to create dataset as query, document, docuemnt, relevance
            logging.info(f"Processing query: {query_id}, with {len(query_document_id_map[query_id])} documents")
            # we need to create listwise db
            # we push all document vectors into a list
            document_vectors = []
            document_relevances = []
            
            for document in query_document_id_map[query_id]:
                document_vectors.append([1, 0, 0, 1])
                document_relevances.append(document["relevance"])
            
            self.dataset.append(document_vectors)
            self.outputs.append(document_relevances)

    def __len__(self):
        return len(self.dataset)

    def __getitem__(self, index):
        return torch.tensor(self.dataset[index], dtype=torch.float32), self.outputs[index]

def listMLE(y_pred, y_true, eps=1e-6, padded_value_indicator=-1):
    """
    ListMLE loss introduced in "Listwise Approach to Learning to Rank - Theory and Algorithm".
    :param y_pred: predictions from the model, shape [batch_size, slate_length]
    :param y_true: ground truth labels, shape [batch_size, slate_length]
    :param eps: epsilon value, used for numerical stability
    :param padded_value_indicator: an indicator of the y_true index containing a padded item, e.g. -1
    :return: loss value, a torch.Tensor
    """
    # shuffle for randomised tie resolution
    random_indices = torch.randperm(y_pred.shape[-1])
    y_pred_shuffled = y_pred[:, random_indices]
    y_true_shuffled = y_true[:, random_indices]

    y_true_sorted, indices = y_true_shuffled.sort(descending=True, dim=-1)

    mask = y_true_sorted == padded_value_indicator

    preds_sorted_by_true = torch.gather(y_pred_shuffled, dim=1, index=indices)
    preds_sorted_by_true[mask] = float("-inf")

    max_pred_values, _ = preds_sorted_by_true.max(dim=1, keepdim=True)

    preds_sorted_by_true_minus_max = preds_sorted_by_true - max_pred_values

    cumsums = torch.cumsum(preds_sorted_by_true_minus_max.exp().flip(dims=[1]), dim=1).flip(dims=[1])

    observation_loss = torch.log(cumsums + eps) - preds_sorted_by_true_minus_max

    observation_loss[mask] = 0.0

    return torch.mean(torch.sum(observation_loss, dim=1))

dataset = LTRDataset()
train_size = int(0.6 * len(dataset))
val_size = int(0.2 * len(dataset))
test_size = len(dataset) - train_size - val_size

train_dataset, test_val_dataset = random_split(
    dataset, [train_size, test_size + val_size]
)
test_dataset, val_dataset = random_split(test_val_dataset, [test_size, val_size])

logging.info(f"Dataset size: {len(dataset)}")
logging.info(f"Training Size: {train_size}")
logging.info(f"Validation Size: {val_size}")
logging.info(f"Testing Size: {test_size}")
logging.info("")

train_loader = DataLoader(train_dataset, batch_size=BATCH_SIZE, shuffle=True)
val_loader = DataLoader(val_dataset, batch_size=BATCH_SIZE, shuffle=True)
test_loader = DataLoader(test_dataset, batch_size=BATCH_SIZE, shuffle=True)

class NeuralNet(torch.nn.Module):
    def __init__(self, n_features, output_size):
        super(NeuralNet, self).__init__()
        self.fc1 = torch.nn.Linear(n_features, 300)
        self.fc2 = torch.nn.Linear(300, 150)
        self.fc3 = torch.nn.Linear(150, output_size)
        self.relu = torch.nn.ReLU()
        self.softmax = torch.nn.Softmax(dim=-1)

    def forward(self, x):
        x = self.relu(self.fc1(x))
        x = self.relu(self.fc2(x))
        x = self.relu(self.fc3(x))
        # logging.info(f"The final vector is: \n{x}")
        x = self.softmax(x)
        # logging.info(f"The output vector is: \n{x}")
        return x

model = NeuralNet(n_features=4, output_size=2)
criterion = listMLE
optimizer = torch.optim.Adam(model.parameters(), lr=0.01)

# Train function
def train(model, train_loader):
    training_loss = 0.0
    training_acc = 0.0

    # Training Loop
    model.train()
    for _, (x, y) in enumerate(train_loader):
        # Perform a single forward pass and get output
        output = model(x)
        # Send target to device
        target = y
        # Calculate accuracy using torch sum and argmax
        acc = torch.sum(torch.argmax(output, -1) == target)
        # Add to training accuracy
        training_acc += acc.item()
        # Zero gradients
        optimizer.zero_grad()
        # Calculate loss
        loss = criterion(output, target)
        # Add to training loss
        training_loss += loss.item()
        # Backpropagate the lost
        loss.backward()
        # Update parameters of the optimizer
        optimizer.step()

    training_loss /= float(len(train_loader.dataset))
    training_acc /= float(len(train_loader.dataset))

    return training_loss, training_acc


def validate(model, val_loader):
    validation_loss = 0.0
    validation_acc = 0.0

    # Validation Loop
    if val_loader is not None:
        with torch.no_grad():
            model.eval()
            for _, (x, y) in enumerate(val_loader):
                output = model(x)
                target = y
                loss = criterion(output, target)
                validation_loss += loss.item()
                acc = torch.sum(torch.argmax(output, -1) == target)
                validation_acc += acc.item()

        validation_loss /= float(len(val_loader.dataset))
        validation_acc /= float(len(val_loader.dataset))

    return validation_loss, validation_acc


# Test function
def test(model, loader):
    model.eval()

    testing_loss = 0.0
    testing_acc = 0.0
    
    with torch.inference_mode():
        true_positives = 0
        false_positives = 0
        false_negatives = 0
        true_negatives = 0
        
        # Iterate in batches over the training/test dataset.
        for _, (x, y) in enumerate(loader):
            # Get output from model
            output = model(x)
            # Send target to device
            target = y
            # Calculate accuracy using torch sum and argmax
            acc = torch.sum(torch.argmax(output, -1) == target)
            # Add to training accuracy
            testing_acc += acc.item()
            # Calculate loss
            loss = criterion(output, target)
            # Add to training loss
            testing_loss += loss.item()
            
            output_array = torch.argmax(output, -1)
            for i in range(len(output_array)):
                if output_array[i] == 1 and target[i] == 1:
                    true_positives += 1
                elif output_array[i] == 1 and target[i] == 0:
                    false_positives += 1
                elif output_array[i] == 0 and target[i] == 1:
                    false_negatives += 1
                else:
                    true_negatives += 1

    testing_loss /= float(len(loader.dataset))
    testing_acc /= float(len(loader.dataset))

    if true_positives + false_positives == 0:
        testing_prec = 0
    else:
        testing_prec = true_positives / (true_positives + false_positives)
    
    if true_positives + false_negatives == 0:
        testing_rec = 0
    else:
        testing_rec = true_positives / (true_positives + false_negatives)
    
    if testing_prec + testing_rec == 0:
        testing_f1 = 0
    else: 
        testing_f1 = 2 * (testing_prec * testing_rec) / (testing_prec + testing_rec)

    return testing_loss, testing_acc, testing_prec, testing_rec, testing_f1

for i in range(100):
    training_loss, training_acc = train(model, train_loader)
    validation_loss, validation_acc = validate(model, val_loader)
    testing_loss, testing_acc, testing_prec, testing_rec, testing_f1 = test(model, test_loader)
    logging.info(f"Epoch: {i} | Training Loss: {training_loss} | Training Accuracy: {training_acc}")
    logging.info(f"Epoch: {i} | Validation Loss: {validation_loss} | Validation Accuracy: {validation_acc}")
    logging.info(f"Epoch: {i} | Testing Loss: {testing_loss} | Testing Accuracy: {testing_acc}")
    logging.info("")