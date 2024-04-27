"""
Vector-based Models (Total 5, 1 for report). Imple-
ment nnn, ntn, and ntc notations
"""

import math
import numpy as np
from py4j.java_gateway import JavaGateway
import time 
#import indexer

gateway = JavaGateway() 
java_object = gateway.entry_point


# Function to calculate nnn (binary representation) vectors for documents and query
def calculate_nnn_vectors(query, field):
    query_terms = list(set(query.split()))
    vocab_set = java_object.buildVocabulary("Assignment_2/index", field) #vocabulary set
    n = java_object.numDocs("Assignment_2/index") #total no of documents in collection
    vocab_set = list(vocab_set)[0:10]
    
    doc_vector_matrix = []
    # Iterate over each term in the query
    for i in range(n):
        doc_vector = [0] * n
        for term in vocab_set:
            tfd = java_object.getTermFreq("Assignment_2/index", field, term, i)
            doc_vector.append(tfd)
        doc_vector_matrix.append(doc_vector)

    query_vector = [0] * n
    for term in vocab_set:
        tfq = query_terms.count(term)
        query_vector.append(tfq)

    similarities = []
    for i in range(n):
        score = sum([a * b for a, b in zip(query_vector, doc_vector_matrix[i])])
        similarities.append((i,score))
    
    similarities = sorted(similarities, key=lambda x: x[1], reverse=True)
    return similarities


# Function to calculate ntn (TF * IDF * 1) vectors for documents and query
def calculate_ntn_vectors(tokens, field, postings, num_documents, doc_freq):
    query_terms = set(tokens)
    document_vectors = []

    term_idf = {term: math.log(num_documents / doc_freq[term]) for term in query_terms}

    for term in query_terms:
        if term in postings:
            for posting in postings[term]:
                doc_id = posting["doc_id"]
                tf = posting["term_freq"]
                if not any(d["doc_id"] == doc_id for d in document_vectors):
                    document_vectors.append(
                        {"doc_id": doc_id, "vector": {term: tf * term_idf[term]}}
                    )

    query_tf = calculate_query_tf(tokens)
    query_vector = {term: query_tf[term] * term_idf[term] * 1 for term in query_terms}

    similarities = calculate_similarity(query_vector, document_vectors)
    return similarities


# Function to calculate ntc (TF * IDF) vectors for documents and query
def calculate_ntc_vectors(tokens, field, postings, num_documents, doc_freq):
    query_terms = set(tokens)
    document_vectors = []

    term_idf = {term: math.log(num_documents / doc_freq[term]) for term in query_terms}

    for term in query_terms:
        if term in postings:
            for posting in postings[term]:
                doc_id = posting["doc_id"]
                tf = posting["term_freq"]
                if not any(d["doc_id"] == doc_id for d in document_vectors):
                    document_vectors.append(
                        {"doc_id": doc_id, "vector": {term: tf * term_idf[term]}}
                    )

    query_tf = calculate_query_tf(tokens)
    query_vector = {term: query_tf[term] * term_idf[term] * 1 for term in query_terms}

    similarities = calculate_cos_similarity(query_vector, document_vectors)
    return similarities


def calculate_cos_similarity(query_vector, document_vectors):
    query_terms = set(query_vector.keys())

    # Calculate similarities between query vector and each document vector
    similarities = []
    for doc_entry in document_vectors:
        doc_id = doc_entry["doc_id"]
        doc_vector = doc_entry["vector"]

        # Calculate dot product (sum of products of corresponding entries in query and document vectors)
        dot_product = sum(
            query_vector[term] * doc_vector.get(term, 0) for term in query_terms
        )

        # Calculate norms (Euclidean lengths) of query vector and document vector
        query_norm = math.sqrt(sum(value**2 for value in query_vector.values()))
        doc_norm = math.sqrt(sum(value**2 for value in doc_vector.values()))

        # Calculate cosine similarity score
        if query_norm > 0 and doc_norm > 0:
            similarity_score = dot_product / (query_norm * doc_norm)
        else:
            similarity_score = 0.0  # Handle zero division case if norms are zero

        # Append document ID and similarity score to similarities list
        similarities.append((doc_id, float(similarity_score)))

    return similarities


# Function to calculate cosine similarity between query vector and document vectors
def calculate_similarity(query_vector, document_vectors):
    query_terms = query_vector.keys()
    similarities = []

    # Iterate over each document vector
    for doc_entry in document_vectors:
        doc_vector = doc_entry["vector"]

        # Calculate dot product (sum of products of corresponding entries in query and document vectors)
        dot_product = sum(
            query_vector[term] * doc_vector.get(term, 0) for term in query_terms
        )

        # Append document ID and similarity score (dot product) to similarities list
        similarities.append((doc_entry["doc_id"], float(dot_product)))

    return similarities



# Example usage
query_string = "birth weight"  # Input query string
notation_type = "nnn"  # Choose the notation type: 'nnn', 'ntn', or 'ntc'
sim = calculate_nnn_vectors(query_string, "title")
print(sim)


# old code for vector model
def vector_model(field, query, notation):
    start = time.time()
    gateway = JavaGateway() 
    java_object = gateway.entry_point
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    vocab_set = java_object.buildVocabulary("Assignment_2/index", field) #vocabulary set
    print(len(vocab_set))
    n = java_object.numDocs("Assignment_2/index") #total no of documents in collection

    # finding out doc freq for each term in vocab_set
    df = {term: 0 for term in vocab_set}
    j = 0
    vocab_set = list(vocab_set)[2000:2010]
    for term in vocab_set:
        df[term] = java_object.getDocFreq("Assignment_2/index", field, term)
        print(str(j) + " " + term + " " + str(df[term]))
        j += 1
    print("calculated doc freq for each term")

    doc_vector_matrix = []
    query_vector = [0] * len(vocab_set)
    q_not = notation[4:]
    doc_not = notation[0:3]

    i = 0
    sum_sq = 0
    for term in vocab_set:
        tfq = dup_query_terms.count(term)
        dfq = 1

        if(q_not[1]=='t'):
            dfq = math.log((n + 1e-10) / (df[term] + 1e-10))

        query_vector[i] = tfq * dfq
        i += 1
        sum_sq += (tfq * dfq) ** 2
        print(term, tfq, dfq)
    print("calculated query vector")

    if(q_not[2]=='c'):
        sum_sq = math.sqrt(sum_sq)
        query_vector = query_vector / sum_sq
        print("normalized query vector")

    print("calculating doc vectors")
    for i in range(10):
        doc_vector = [0] * 10
        
        sum_sq = 0
        for term in vocab_set:
            tfd = java_object.getTermFreq("Assignment_2/index", field, term, i)
            dfd = 1

            if(doc_not[1]=='t'):
                dfd = math.log((n + 1e-10) / (df[term] + 1e-10))

            doc_vector.append(tfd * dfd)
            sum_sq += (tfd * dfd) ** 2
            print(str(i)+" "+term)

            
        if(doc_not[2]=='c'):
            sum_sq = math.sqrt(sum_sq) + 1e-12
            for j in range(len(doc_vector)):
                doc_vector[j] = doc_vector[j] / sum_sq
        doc_vector_matrix.append(doc_vector)
        print("calculated doc vector for doc "+str(i))

    scores = []
    for i in range(len(doc_vector_matrix)):
        print(query_vector)
        print(doc_vector_matrix[i])
        score = np.dot(query_vector, doc_vector_matrix[i])
        print(score)
        scores.append(score)
    scores = list(scores)
    print(len(scores))
    end = time.time()
    print("Time taken: "+str(end-start))
    return sum(scores)/10

s = vector_model("title", "birth weight", "ntc.nnn")
print(s)

    


            
            