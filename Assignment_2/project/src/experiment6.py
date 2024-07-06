"""
Query Expansion using Knowledge Graphs (Total 5, 1
for report). You should propose and implement an expansion technique
that also considers relations in the knowledge graph
"""

import csv
from tqdm import tqdm
import pickle
import re
from collections import defaultdict

entity_relations = defaultdict(list)

with open('../../gena_data_final_triples.csv', 'r') as file:
    reader = csv.reader(file)
    next(reader)
    for row in reader:
        subject, relation, object = row
        entity_relations[subject].append(object)

query = "stopping heart disease in childhood"

with open('index_only_entities.pkl', 'rb') as file:
    index = pickle.load(file)
main_entities = [entity for entity in index.keys() if re.search(r'\b' + re.escape(entity) + r'\b', query)]
main_entities.remove('')
print(f"Main entities: {main_entities}")
related_entities = set(main_entities)
for entity in tqdm(main_entities, desc="Expanding entities"):
    if entity in entity_relations:
        related_entities.update(entity_relations[entity])

print(f"Entities: {related_entities}")

expanded_query = ' '.join(related_entities)

with open('experiment6.output', 'w') as file:
    file.write(expanded_query)