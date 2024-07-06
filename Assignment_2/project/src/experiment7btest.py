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

model = NeuralNet(n_features=input_size, output_size=2)
criterion = torch.nn.CrossEntropyLoss()
optimizer = torch.optim.Adam(model.parameters(), lr=0.01)

model.load_state_dict(torch.load('./ltr_models/7b.pth'))

query_document_id_map = {}
for i in tqdm(range(0, 1000)):
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
        
outputs = {}
for query_id in tqdm(query_document_id_map): 
    # we need to create dataset as query, document, docuemnt, relevance
    for i in range(0, len(query_document_id_map[query_id]), 2):
        if i + 1 < len(query_document_id_map[query_id]):
            # Get the features for each query-document-document pair
            relevance1 = query_document_id_map[query_id][i]['relevance']
            relevance2 = query_document_id_map[query_id][i + 1]['relevance']
            
            # Get the features
            score = model(torch.tensor(indexer.getTermVector(queries[query_id], postings, doc_freq, doc_ids, query_term_id_mapping), dtype=torch.float32) + torch.tensor(indexer.getDocumentVector(query_document_id_map[query_id][i]['document_id'], postings, doc_freq, doc_ids, query_term_id_mapping), dtype=torch.float32) + torch.tensor(indexer.getDocumentVector(query_document_id_map[query_id][i + 1]['document_id'], postings, doc_freq, doc_ids, query_term_id_mapping), dtype=torch.float32))
            
            # Get the output
            output = torch.argmax(score, -1).item()

            # push them into the outputs
            if query_id not in outputs:
                outputs[query_id] = []
            outputs[query_id].append({
                "query_id": query_id,
                "document_id1": query_document_id_map[query_id][i]['document_id'],
                "document_id2": query_document_id_map[query_id][i + 1]['document_id'],
                "relevance1": relevance1,
                "relevance2": relevance2,
                "output": output
            })

# Sort them per query id on the basis of output
for query_id in outputs:
    outputs[query_id] = sorted(outputs[query_id], key=lambda x: x['output'])
    # based on output, give them relevance scores
    # We use relevance1 as the first document and relevance2 as the second document
    # we use relevance1 and predict relevance 2 using output
    for i in range(0, len(outputs[query_id])):
        if outputs[query_id][i]['output'] == 0:
            outputs[query_id][i]['predicted_relevance'] = outputs[query_id][i]['relevance1']
        else:
            outputs[query_id][i]['predicted_relevance'] = outputs[query_id][i]['relevance1'] + 1
        print(f"{outputs[query_id][i]['query_id']} Q0 {outputs[query_id][i]['document_id1']} {i + 1} {outputs[query_id][i]['predicted_relevance']} STANDARD")
    
