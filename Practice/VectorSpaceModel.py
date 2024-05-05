# We write code for calculating tf-idf based on different weights
# We also write code for calculating cosine similarity between two documents

import math


def initializeVocabVector(vocab):
    vocab_vector = {}
    for word in vocab:
        vocab_vector[word] = 0
    return vocab_vector

# take input of the method in DDD.QQQ format
METHOD = "LTC.NNN"
QUERY_METHOD = METHOD.split(".")[1]
DOCUMENT_METHOD = METHOD.split(".")[0]

# First take query input
query = "new york taxi"

documents = [
    "I live in new york",
    "new advancements in york city",
    "flight from india to new york"
]

vocab = set()
for doc in documents:
    vocab.update(doc.split())
vocab = list(vocab)

# find query vector
query_vector = initializeVocabVector(vocab)

query_term_freq = initializeVocabVector(vocab)
for word in query.split():
    if word in query_term_freq:
        query_term_freq[word] += 1

for word in query.split():
    if word in query_vector:
        if QUERY_METHOD[0] == "N":
            query_vector[word] = query_term_freq[word]
        elif QUERY_METHOD[0] == "L":
            query_vector[word] = 1 + math.log(query_term_freq[word] + 1)
        elif QUERY_METHOD[0] == "A":
            query_vector[word] = 0.5 + 0.5 * query_term_freq[word] / max(query_term_freq.values())

print()
print("Query Vector: ")
print(query_vector)

# Similarly find document vectors
document_vectors = []
for id, doc in enumerate(documents):
    doc_vector = initializeVocabVector(vocab)
    doc_freq = {}
    for word in doc.split():
        if word in doc_freq:
            if id in doc_freq[word]:
                doc_freq[word][id] += 1
            else:
                doc_freq[word][id] = 1
        else:
            doc_freq[word] = {
                id: 1
            }

    for word in doc.split():
        if word in doc_vector:
            if DOCUMENT_METHOD[0] == "N":
                doc_vector[word] = 1
            elif DOCUMENT_METHOD[0] == "L":
                doc_vector[word] = math.log(len(documents) / len(doc_freq[word]))

    document_vectors.append(doc_vector)

print()
print("Document Vectors: ")
for i, doc_vector in enumerate(document_vectors):
    print("Document ", i, ":", doc_vector)
    
print()
print("Cosine Similarity: ")
for i, doc_vector in enumerate(document_vectors):
    dot_product = 0
    for word in query_vector:
        dot_product += query_vector[word] * doc_vector[word]
    query_magnitude = 0
    for word in query_vector:
        query_magnitude += query_vector[word] ** 2
    query_magnitude = math.sqrt(query_magnitude)
    doc_magnitude = 0
    for word in doc_vector:
        doc_magnitude += doc_vector[word] ** 2
    doc_magnitude = math.sqrt(doc_magnitude)
    
    if QUERY_METHOD[2] == "N":
        query_magnitude = 1
    
    if DOCUMENT_METHOD[2] == "N":
        doc_magnitude = 1
    
    print("Document ", i, ":", dot_product / (query_magnitude * doc_magnitude))