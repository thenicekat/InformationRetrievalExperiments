"""
Entity-based retrieval models (Total 5, 1 for report).
Knowledge Graph is GENA"""

import csv

class EntityRetrievalModel:
    def __init__(self):
        self.graph = {}

    def load_data_from_csv(self, file_path):
        with open(file_path, 'r', newline='') as csvfile:
            reader = csv.reader(csvfile)
            for row in reader:
                subject, relation, obj = row
                if subject not in self.graph:
                    self.graph[subject] = {}
                if relation not in self.graph[subject]:
                    self.graph[subject][relation] = []
                self.graph[subject][relation].append(obj)

    def retrieve_entities(self, query_subject):
        if query_subject in self.graph:
            return self.graph[query_subject]
        else:
            return None

# Create an instance of EntityRetrievalModel
retrieval_model = EntityRetrievalModel()

# Path to the CSV file containing the GENA data
file_path = "../gena_data_final_triples.csv"

# Load data from the CSV file
retrieval_model.load_data_from_csv(file_path)

# Example of retrieving entities for a given subject
query_subject = "Flibanserin"
entities = retrieval_model.retrieve_entities(query_subject)
if entities:
    print(f"Entities for {query_subject}:")
    for relation, values in entities.items():
        print(f"{relation}: {values}\n")
else:
    print(f"No entities found for {query_subject}")
