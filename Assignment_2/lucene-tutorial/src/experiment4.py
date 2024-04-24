"""
Probabilistic Retrieval (Total 5, 1 for report). Imple-
ment Language Model and BM-25 ranking models
"""
import math
from py4j.java_gateway import JavaGateway 


def language_model(query, field, lmbda=0.5):
    print(query+" "+field+" "+str(lmbda))
    gateway = JavaGateway() 
    java_object = gateway.entry_point
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    scores = {}
    coln_len = java_object.getCollectionLen("Assignment_2/index", field) #total no of terms in collection
    # print("Collection Length = " + str(coln_len))
    cf_query_terms = {term: 0 for term in query_terms}
    num_docs = java_object.numDocs("Assignment_2/index") #total no of documents in collection

    # finding out collection frequency of each query term and collection length
    for term in query_terms:
        cf_query_terms[term] = java_object.getCollectionFreq("Assignment_2/index", field, term)

    for i in range (num_docs):
        doc_score = 1

        for term in query_terms:
            tfd = java_object.getTermFreq("Assignment_2/index", field, term, i)
            # print("Term Freq = " + str(tfd))
            tfq = dup_query_terms.count(term)
            # print("Query Term Freq = " + str(tfq))
            doc_len = java_object.getDocumentLen("Assignment_2/index", field, i)
            if doc_len == 0:
                doc_len = 1
            dm_score = (tfd/doc_len)
            # print("Doc Model Score = " + str(dm_score))
            cm_score = (cf_query_terms[term] / coln_len)
            # print("Collection Model Score = " + str(cm_score))
            doc_score *= (lmbda * dm_score + (1-lmbda) * cm_score) ** tfq
            # print("Doc Score = " + str(doc_score))
            
        scores[i] = doc_score

    result = 0
    for i in range(num_docs):
        result += scores[i]
    print(str(sum(scores)==result) + " and " + str(len(scores)==num_docs))
    print(str(sum(scores)) + " " + str(result))
    result /= num_docs
    return result

    
def okapi_bm25(query, field, k1=1.5, k3=1.5, b=0.75):
    print(query+" "+field+" "+str(k1)+" "+str(k3)+" "+str(b))
    gateway = JavaGateway() 
    java_object = gateway.entry_point
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    scores = {}
    coln_len = java_object.getCollectionLen("Assignment_2/index", field) #total no of terms in collection
    # print("Collection Length = " + str(coln_len))
    df_query_terms = {term: 0 for term in query_terms}
    num_docs = java_object.numDocs("Assignment_2/index") #total no of documents in collection

    for term in query_terms:
        df = java_object.getDocFreq("Assignment_2/index", field, term)
        df_query_terms[term] = df
        # print("Doc Freq = " + str(df))

    l_avg = java_object.getAvgDocLen("Assignment_2/index", field)
    # print("Average Document Length = " + str(l_avg))

    for i in range(num_docs):
        doc_score = 0
        ld = java_object.getDocumentLen("Assignment_2/index", field, i)
        # print("Document Length = " + str(ld))

        for term in query_terms:
            idf = math.log((num_docs + 1e-8) / (df_query_terms[term] + 1e-8))
            # print("IDF = " + str(idf))
            tfd = java_object.getTermFreq("Assignment_2/index", field, term, i)
            # print("Term Freq = " + str(tfd))
            tfq = dup_query_terms.count(term)
            # print("Query Term Freq = " + str(tfq))

            num1 = tfd + k1 * tfd
            # print("num1 = " + str(num1))
            den1 = tfd + k1 * ((1 - b) + b * (ld / l_avg))
            # print("den1 = " + str(den1))
            num2 = tfq + k3 * tfq
            # print("num2 = " + str(num2))
            den2 = tfq + k3
            # print("den2 = " + str(den2))

            doc_score += idf * (num1 / den1) * (num2 / den2)
            # print("Doc Score = " + str(doc_score))
            
        scores[i] = doc_score
    
    result = 0
    for i in range(num_docs):
        result += scores[i]
    print(str(sum(scores)==result) + " and " + str(len(scores)==num_docs))
    print(str(sum(scores)) + " " + str(result))

    result /= num_docs
    return result

s1 = language_model("birth", "abstract")
print("Language Model Score = " + str(s1))
s2 = okapi_bm25("birth", "abstract")
print("Okapi BM25 Score = " + str(s2))

