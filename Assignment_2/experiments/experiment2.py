"""
Vector-based Models (Total 5, 1 for report). Imple-
ment nnn, ntn, and ntc notations
"""

import math
import numpy as np


def vector_model(self, docs, query, notation):
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    vocab_set = set()
    n = len(docs)

    # creating vocabulary
    for doc in docs:
        doc_terms = doc.split()
        for term in doc_terms:
            vocab_set.add(term)

    # finding out doc freq for each term in vocab_set
    df = {term: 0 for term in vocab_set}
    for term in vocab_set:
        for doc in docs:
            doc_terms = doc.split()
            if term in doc_terms:
                df[term] += 1

    doc_vector_matrix = []
    query_vector = np.zeros(len(vocab_set))
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

    if(q_not[2]=='c'):
        sum_sq = math.sqrt(sum_sq)
        query_vector = query_vector / sum_sq

    for doc in docs:
        doc_vector = np.zeros(len(vocab_set))
        doc_terms = doc.split()
        sum_sq = 0
        i = 0
        for term in vocab_set:
            tfd = doc_terms.count(term)
            dfd = 1

            if(doc_not[1]=='t'):
                dfd = math.log((n + 1e-10) / (df[term] + 1e-10))

            doc_vector[i] = tfd * dfd
            sum_sq += (tfd * dfd) ** 2
            i += 1
            
        if(doc_not[2]=='c'):
            sum_sq = math.sqrt(sum_sq)
            doc_vector = doc_vector / sum_sq
        doc_vector_matrix.append(doc_vector)

    scores = np.dot(doc_vector_matrix, query_vector)
    return sum(scores)/len(scores)

    


            
            