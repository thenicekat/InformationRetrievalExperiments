"""
Probabilistic Retrieval (Total 5, 1 for report). Imple-
ment Language Model and BM-25 ranking models
"""
import math
from py4j.java_gateway import JavaGateway 
from tqdm import tqdm

    
def okapi_bm25(query, field, k1=1.5, k3=1.5, b=0.75):
    #print(query+" "+field+" "+str(k1)+" "+str(k3)+" "+str(b))
    gateway = JavaGateway() 
    java_object = gateway.entry_point
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    coln_len = java_object.getCollectionLen("Assignment_2/index", field) #total no of terms in collection
    #print("Collection Length = " + str(coln_len))
    df_query_terms = {term: 0 for term in query_terms}
    num_docs =  java_object.numDocs("Assignment_2/index") #total no of documents in collection
    print("Number of Documents = " + str(num_docs))
    scores = [0] * num_docs

    for term in query_terms:
        df = java_object.getDocFreq("Assignment_2/index", field, term)
        df_query_terms[term] = df
        #print("Doc Freq = " + str(df))

    l_avg = java_object.getAvgDocLen("Assignment_2/index", field)
    #print("Average Document Length = " + str(l_avg))

    for i in range(num_docs):
        doc_score = 0
        ld = java_object.getDocumentLen("Assignment_2/index", field, i)
        #print("Document Length = " + str(ld))

        for term in query_terms:
            idf = math.log((num_docs + 1e-8) / (df_query_terms[term] + 1e-8))
            #print("IDF = " + str(idf))
            tfd = java_object.getTermFreq("Assignment_2/index", field, term, i)
            #print("Term Freq = " + str(tfd))
            tfq = dup_query_terms.count(term)
            #print("Query Term Freq = " + str(tfq))

            num1 = tfd + k1 * tfd
            #print("num1 = " + str(num1))
            den1 = tfd + k1 * ((1 - b) + b * (ld / l_avg))
            #print("den1 = " + str(den1))
            num2 = tfq + k3 * tfq
            #print("num2 = " + str(num2))
            den2 = tfq + k3
            #print("den2 = " + str(den2))

            doc_score += idf * (num1 / den1) * (num2 / den2)
            # if(doc_score != 0):
            #      print("Doc Score = " + str(doc_score))
        
        docid = java_object.getDocId("Assignment_2/index", i)
        scores[i] = (doc_score, docid)
    
    print("Okapi BM 25 Scores")
    scores.sort(reverse = True)

    i = 0
    # while(i<10):
    #     print(scores[i][0])
    #     i += 1
    result = 0


    for i in range(num_docs):
        result += scores[i][0]
    #print(str(sum(scores)) + " " + str(result))

    # result /= num_docs
    # return result
    return scores


input_file_path = "Assignment_2/nfcorpus/test.vid-desc.queries"
output_file_path = "Assignment_2/nfcorpus/output_bm_content.txt"
with open(input_file_path, 'r') as input_file:
            # Open output file for writing
    with open(output_file_path, 'w') as output_file:
        # Process each line in the input file
        for line in tqdm(input_file, total = 102):
            # Split the line by whitespace
            words = line.split('\t')
            query = words[1]
            # Write the processed words to the output file
            s1 = okapi_bm25(query, "abstract")

            for i in range(len(s1)):

                result = words[0] + "\tQ0 " + "\t" + str(s1[i][1])+ "\t" + str(i) + "\t" + str(s1[i][0]) + "\tSTANDARD\n"
                output_file.write(result)

    print("Processing complete. Output written to", output_file_path)

