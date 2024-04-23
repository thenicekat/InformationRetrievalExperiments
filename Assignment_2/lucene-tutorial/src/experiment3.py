"""
Rocchio Feedback Algorithm for Query Expansion using
Pseudo-Relevance Feedback (Total 5, 1 for report)
"""
import math
import numpy as np


def rocchio_relevance_model(self, docs, query, relevant_docs, non_relevant_docs, alpha=1, beta=0.75, gamma=0.15):
    dup_query_terms = query.split()
    vocab_set = set()

    # creating vocabulary
    for doc in docs:
        doc_terms = doc.split()
        for term in doc_terms:
            vocab_set.add(term)


    rel_doc_vector_matrix = []
    non_rel_doc_vector_matrix = []
    query_vector = np.zeros(len(vocab_set))

    i = 0
    sum_sq = 0
    for term in vocab_set:
        tfq = dup_query_terms.count(term)
        query_vector[i] = tfq
        i += 1


    for doc in relevant_docs:
        doc_vector = np.zeros(len(vocab_set))
        doc_terms = doc.split()
        sum_sq = 0
        i = 0

        for term in vocab_set:
            tfd = doc_terms.count(term)
            doc_vector[i] = tfd
            sum_sq += (tfd) ** 2
            i += 1
        
        rel_doc_vector_matrix.append(doc_vector)

    for doc in non_relevant_docs:
        doc_vector = np.zeros(len(vocab_set))
        doc_terms = doc.split()
        sum_sq = 0
        i = 0

        for term in vocab_set:
            tfd = doc_terms.count(term)
            doc_vector[i] = tfd
            sum_sq += (tfd) ** 2
            i += 1
        
        non_rel_doc_vector_matrix.append(doc_vector)

    query_vector = alpha * query_vector
    num_rel = len(relevant_docs)
    num_non_rel = len(non_relevant_docs)
    rel_doc_vector_matrix = beta * np.sum(rel_doc_vector_matrix, axis=0) / num_rel
    non_rel_doc_vector_matrix = gamma * np.sum(non_rel_doc_vector_matrix, axis=0) / num_non_rel

    opt_query_vector = query_vector + rel_doc_vector_matrix - non_rel_doc_vector_matrix
    return opt_query_vector


    