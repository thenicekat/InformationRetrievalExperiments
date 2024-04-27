"""
Experiment 8: Anything out-of-the-box that improves your NDCG scores
(Total 7, 1 for report)
"""
from datetime import datetime
import os
import pandas as pd
import json
import logging
import sklearn
import torch
import torch.nn as nn
import torch.nn.functional as F
from torch.utils.data import Dataset, DataLoader, random_split
import psutil
from tqdm import tqdm
import indexer

logging.basicConfig(
    level=logging.INFO,
    datefmt="%d-%b-%y %H:%M:%S",
    filename=f"./ltr_logs/{datetime.now().strftime('%d-%m-%Y_%H-%M-%S')}.log",
    filemode="w",
    format="%(asctime)s [%(levelname)s] %(message)s ",
)

device = torch.device("cuda:0" if torch.cuda.is_available() else "cpu")

SKIPGRAM_MODEL_LEAST_LOSS_SAVE_NAME = './ltr_logs/skipgram.pth'
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

postings, doc_freq, doc_ids, query_term_id_mapping = indexer.load_index_in_memory('../../nfcorpus/raw/')
input_size = len(indexer.getTermVector('deep', postings, doc_freq, doc_ids, query_term_id_mapping))

word_pairs = []
for x in queries:
    queries_split = queries[x].split(" ")
    # add them to the word pairs
    for i in range(0, len(queries_split)):
        for j in range(i + 1, len(queries_split)):
            word_pairs.append((queries_split[i], queries_split[j]))

# Create a skipgram
class CustomDataset(Dataset):
    def __init__(self):
        self.word_pairs = word_pairs

    def __len__(self):
        return len(self.word_pairs)

    def __getitem__(self, idx):
        return (
            int(query_term_id_mapping[self.word_pairs[idx][0]]),
            int(query_term_id_mapping[self.word_pairs[idx][1]]),
        )


customDataset = CustomDataset()
logging.info("Custom Dataset created")
logging.info(f"RAM Used (GB): {psutil.virtual_memory()[3] / 1000000000}")

# Custom Dataloader
dataLoader = DataLoader(customDataset, batch_size=1024, shuffle=True)
logging.info("Custom Dataloader created")
logging.info(f"RAM Used (GB): {psutil.virtual_memory()[3] / 1000000000}")


# Skip gram Model
class SkipgramModel(nn.Module):
    def __init__(self, vocab_size, embedding_dim):
        super(SkipgramModel, self).__init__()
        self.embedding = nn.Embedding(vocab_size, embedding_dim)
        self.linear = nn.Linear(embedding_dim, embedding_dim * 3)
        self.linear2 = nn.Linear(embedding_dim * 3, vocab_size)

    def forward(self, inputs__):
        embeds = self.embedding(inputs__)
        out = self.linear(embeds)
        out = self.linear2(out)
        log_probs = F.log_softmax(out, dim=1)
        return log_probs

    def prediction(self, inputs):
        embeds = self.embedding(inputs)
        return embeds

model = SkipgramModel(len(query_term_id_mapping), 512)
model.to(device)
logging.info(model)

# Loss functions and optimizer
loss_fn = nn.CrossEntropyLoss()
optimizer = torch.optim.SGD(model.parameters(), lr=0.001, weight_decay=5e-4)
logging.info("Loss function and optimizer created")


#  Training the model
def skipgram_train():
    model.train()

    total_loss = 0
    total_quantity = 0

    for batch_idx, (x, y) in enumerate(dataLoader):
        x = x.to(device)
        y = y.to(device)
        optimizer.zero_grad()
        out = model(x)
        loss = loss_fn(out, y)
        loss.backward()
        optimizer.step()
        total_loss += loss.item()
        total_quantity += len(x)

    return total_loss / total_quantity


previous_least_loss = 10000000
# Check if model already exists
if os.path.exists(SKIPGRAM_MODEL_LEAST_LOSS_SAVE_NAME):
    model.load_state_dict(
        torch.load(
            SKIPGRAM_MODEL_LEAST_LOSS_SAVE_NAME,
            map_location=torch.device(device),
        )
    )
    model.eval()
    logging.info("Model loaded from disk\n\n")
    # Save the least loss model
    previous_least_loss = skipgram_train()

for epoch in range(0, 5):
    logging.info(f"[Epoch: {epoch}] Starting the train")
    loss = skipgram_train()
    logging.info(f"[Epoch: {epoch}] Loss: {loss}")

    #  Saving the model
    if loss < previous_least_loss:
        previous_least_loss = loss
        torch.save(model.state_dict(), SKIPGRAM_MODEL_LEAST_LOSS_SAVE_NAME)


class LTRDataset(Dataset):
    def __init__(self):
        # Create an array of datasets
        self.dataset = []
        self.outputs = []
        
        # Now we need to get the features for each query-document pair
        logging.info("Getting features for each query-document pair")
        for i in tqdm(range(0, len(merged_qrel))):
            query_id = merged_qrel.iloc[i]['QUERY_ID']
            doc_id = merged_qrel.iloc[i]['DOC_ID']
            relevance = merged_qrel.iloc[i]['RELEVANCE']
            
            # Get the features for the query-document pair
            self.dataset.append({
                "vector":  model.prediction(torch.tensor([query_term_id_mapping[queries[query_id]]], dtype=torch.long))
            })
            # one hot encode the relevance
            self.outputs.append(relevance - 1)
    
    def __len__(self):
        return len(self.dataset)

    def __getitem__(self, index):
        return torch.tensor(self.dataset[index]["vector"], dtype=torch.float32), self.outputs[index]


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

neuralNet = NeuralNet(n_features=input_size, output_size=3)
criterion = torch.nn.CrossEntropyLoss()
optimizer = torch.optim.Adam(neuralNet.parameters(), lr=0.01)

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
    testing_ndcg = 0.0
    counter = 0
    
    with torch.inference_mode():
        # Iterate in batches over the testing dataset.
        for _, (x, y) in enumerate(loader):
            # Get output from model
            output = model(x)
            # Send target to device
            target = y
            # Calculate accuracy using torch sum and argmax
            acc = torch.sum(torch.argmax(output, -1) == target)
            # Add to testing accuracy
            testing_acc += acc.item()
            # Calculate loss
            loss = criterion(output, target)
            # Add to testing loss
            testing_loss += loss.item()
            # Add to testing ndcg
            testing_ndcg += sklearn.metrics.ndcg_score([y], [torch.argmax(output, -1)])
            counter += 1

    testing_loss /= float(len(loader.dataset))
    testing_acc /= float(len(loader.dataset))
    testing_ndcg /= counter

    return testing_loss, testing_acc, testing_ndcg

for i in range(10):
    training_loss, training_acc = train(neuralNet, train_loader)
    validation_loss, validation_acc = validate(neuralNet, val_loader)
    testing_loss, testing_acc, testing_ndcg = test(neuralNet, test_loader)
    logging.info(f"Epoch: {i} | Training Loss: {training_loss} | Training Accuracy: {training_acc}")
    logging.info(f"Epoch: {i} | Validation Loss: {validation_loss} | Validation Accuracy: {validation_acc}")
    logging.info(f"Epoch: {i} | Testing Loss: {testing_loss} | Testing Accuracy: {testing_acc} | Testing NDCG: {testing_ndcg}")
    logging.info("")
    # save the model
    torch.save(neuralNet.state_dict(), f"./ltr_models/8.pth")