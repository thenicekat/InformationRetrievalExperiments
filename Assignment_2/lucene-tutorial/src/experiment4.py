"""
Probabilistic Retrieval (Total 5, 1 for report). Imple-
ment Language Model and BM-25 ranking models
"""
import math

def language_model(self, query, docs, lmbda=0.5):
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    scores = {}
    coln_len = 0 #total no of terms in collection
    cf_query_terms = {term: 0 for term in query_terms}

    # finding out collection frequency of each query term and collection length
    for doc in docs:
        doc_terms = doc.split()
        coln_len += len(doc_terms)

        for term in query_terms:
            tfd = doc_terms.count(term)
            cf_query_terms[term] += tfd


    for doc in docs:
        doc_terms = doc.split()
        doc_score = 1

        for term in query_terms:
            tfd = doc_terms.count(term)
            tfq = dup_query_terms.count(term)
            doc_len = len(doc_terms)
            dm_score = (tfd/doc_len)
            cm_score = (cf_query_terms[term] / coln_len)
            doc_score *= (lmbda * dm_score + (1-lmbda) * cm_score) ** tfq
            
        scores[doc] = doc_score

    return sum(scores)/len(scores)

    
def okapi_bm25(self, query, docs, k1=1.5, k3=1.5, b=0.75):
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    scores = {}
    coln_len = 0 #total no of terms in collection
    df_query_terms = {term: 0 for term in query_terms}
    n = len(docs)

    for term in query_terms:
        for doc in docs:
            doc_terms = doc.split()
            coln_len += len(doc_terms)
            if term in doc_terms:
                df_query_terms[term] += 1

    l_avg = coln_len / n

    for doc in docs:
        doc_score = 0
        doc_terms = doc.split()
        ld = len(doc_terms)

        for term in query_terms:
            idf = math.log((n + 1e-8) / (df_query_terms[term] + 1e-8))
            tfd = doc_terms.count(term)
            tfq = dup_query_terms.count(term)

            num1 = tfd + k1 * tfd
            den1 = tfd + k1 * ((1 - b) + b * (ld / l_avg))
            num2 = tfq + k3 * tfq
            den2 = tfq + k3

            doc_score += idf * (num1 / den1) * (num2 / den2)
            
        scores[doc] = doc_score

    return sum(scores)/len(scores)
