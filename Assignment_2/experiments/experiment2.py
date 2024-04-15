"""
Vector-based Models (Total 5, 1 for report). Imple-
ment nnn, ntn, and ntc notations
"""

import math
import numpy as np

# TBD: Implement vector-based models

def vector_model(self, docs, query, notation):
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    n = len(docs)
    dfq = {term: 0 for term in query_terms}
    norm = 1

    for term in query_terms:
        for doc in docs:
            doc_terms = doc.split()
            if term in doc_terms:
                dfq[term] += 1


    for doc in docs:
        doc_terms = doc.split()
        doc_vector = np.zeros(len(query_terms))
        for term in query_terms:
            tfd = doc_terms.count(term)
            
            