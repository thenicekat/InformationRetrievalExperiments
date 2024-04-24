"""
Vector-based Models (Total 5, 1 for report). Imple-
ment nnn, ntn, and ntc notations
"""

import math
import numpy as np
import math
from py4j.java_gateway import JavaGateway 


def vector_model(field, query, notation):
    gateway = JavaGateway() 
    java_object = gateway.entry_point
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    vocab_set = java_object.buildVocabulary("Assignment_2/index", field) #vocabulary set
    n = java_object.numDocs("Assignment_2/index") #total no of documents in collection

    # finding out doc freq for each term in vocab_set
    df = {term: 0 for term in vocab_set}
    for term in vocab_set:
        df[term] = java_object.getDocFreq("Assignment_2/index", field, term)

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

    for i in range(n):
        doc_vector = np.zeros(len(vocab_set))
        sum_sq = 0
        i = 0
        for term in vocab_set:
            tfd = java_object.getTermFreq("Assignment_2/index", field, term, i)
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

s = vector_model("title", "birth weight", "ntc")
print(s)

    


            
            