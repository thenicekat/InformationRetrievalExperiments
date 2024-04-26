from tqdm import tqdm
import pandas as pd
import torch
import indexer

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

model = NeuralNet(n_features=input_size, output_size=3)
criterion = torch.nn.CrossEntropyLoss()
optimizer = torch.optim.Adam(model.parameters(), lr=0.01)

model.load_state_dict(torch.load('./ltr_models/7a.pth'))


# print into this format query-id Q0 document-id rank score STANDARD
for i in (range(0, 6000)):
    query_id = merged_qrel.iloc[i]['QUERY_ID']
    doc_id = merged_qrel.iloc[i]['DOC_ID']
    relevance = merged_qrel.iloc[i]['RELEVANCE']
    
    score = model(torch.tensor(indexer.getTermVector(queries[query_id], postings, doc_freq, doc_ids, query_term_id_mapping), dtype=torch.float32 + torch.tensor(indexer.getDocumentVector(doc_id, postings, doc_freq, doc_ids, query_term_id_mapping), dtype=torch.float32)))
    print(f"{query_id} Q0 {doc_id} {100} {torch.argmax(score, -1)} STANDARD")
