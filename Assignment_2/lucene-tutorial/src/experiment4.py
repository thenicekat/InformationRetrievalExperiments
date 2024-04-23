"""
Probabilistic Retrieval (Total 5, 1 for report). Imple-
ment Language Model and BM-25 ranking models
"""
import math
from py4j.java_gateway import JavaGateway 


def language_model(query, field, lmbda=0.5):
    gateway = JavaGateway() 
    java_object = gateway.entry_point
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    scores = {}
    coln_len = java_object.getCollectionLen("Assignment_2/index", field) #total no of terms in collection
    cf_query_terms = {term: 0 for term in query_terms}
    num_docs = java_object.numDocs("Assignment_2/index") #total no of documents in collection

    # finding out collection frequency of each query term and collection length
    for term in query_terms:
        cf_query_terms[term] = java_object.getCollectionFreq("Assignment_2/index", field, term)

    for i in range (num_docs):
        doc_score = 1

        for term in query_terms:
            tfd = java_object.getTermFreq("Assignment_2/index", field, term, i)
            tfq = dup_query_terms.count(term)
            doc_len = java_object.getDocumentLen("Assignment_2/index", field, i)
            dm_score = (tfd/doc_len)
            cm_score = (cf_query_terms[term] / coln_len)
            doc_score *= (lmbda * dm_score + (1-lmbda) * cm_score) ** tfq
            
        scores[i] = doc_score

    return sum(scores)/len(scores)

    
def okapi_bm25(query, field, k1=1.5, k3=1.5, b=0.75):
    gateway = JavaGateway() 
    java_object = gateway.entry_point
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    scores = {}
    coln_len = java_object.getCollectionLen("Assignment_2/index", field) #total no of terms in collection
    df_query_terms = {term: 0 for term in query_terms}
    num_docs = java_object.numDocs("Assignment_2/index") #total no of documents in collection

    for term in query_terms:
        df = java_object.getDocFreq("Assignment_2/index", field, term)
        df_query_terms[term] = df

    l_avg = java_object.getAvgDocLen("Assignment_2/index", field)

    for i in range(num_docs):
        doc_score = 0
        ld = java_object.getDocumentLen("Assignment_2/index", field, i)

        for term in query_terms:
            idf = math.log((num_docs + 1e-8) / (df_query_terms[term] + 1e-8))
            tfd = java_object.getTermFreq("Assignment_2/index", field, term, i)
            tfq = dup_query_terms.count(term)

            num1 = tfd + k1 * tfd
            den1 = tfd + k1 * ((1 - b) + b * (ld / l_avg))
            num2 = tfq + k3 * tfq
            den2 = tfq + k3

            doc_score += idf * (num1 / den1) * (num2 / den2)
            
        scores[i] = doc_score

    return sum(scores)/len(scores)

s1 = language_model("deep learning", "abstract", 0.5)
print("Language Model Score = " + str(s1))
s2 = okapi_bm25("deep learning", "abstract", 1.5, 1.5, 0.75)
print("Okapi BM25 Score = " + str(s2))

