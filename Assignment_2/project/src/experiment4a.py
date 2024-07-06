"""
Probabilistic Retrieval (Total 5, 1 for report). Imple-
ment Language Model and BM-25 ranking models
"""
import math
from py4j.java_gateway import JavaGateway 
from tqdm import tqdm


def language_model(query, field, lmbda=0.5):
    #print(query+" "+field+" "+str(lmbda))
    gateway = JavaGateway() 
    java_object = gateway.entry_point
    dup_query_terms = query.split()
    query_terms = set(list(query.split()))
    #print(query_terms)
    coln_len = java_object.getCollectionLen("Assignment_2/index", field) #total no of terms in collection
    #print("Collection Length = " + str(coln_len))
    cf_query_terms = {term: 0 for term in query_terms}
    num_docs =  java_object.numDocs("Assignment_2/index") #total no of documents in collection
    print("Number of Documents = " + str(num_docs))
    scores = [0] * num_docs

    # finding out collection frequency of each query term and collection length
    for term in query_terms:
        cf_query_terms[term] = java_object.getCollectionFreq("Assignment_2/index", field, term)
    # print("Collection Freq = ")
    # print(cf_query_terms)

    for i in range (num_docs):
        doc_score = 1

        for term in query_terms:
            tfd = java_object.getTermFreq("Assignment_2/index", field, term, i)
            #print("Term Freq = " + str(tfd))
            tfq = dup_query_terms.count(term)
            #print("Query Term Freq = " + str(tfq))
            doc_len = java_object.getDocumentLen("Assignment_2/index", field, i)
            if doc_len == 0 and tfd == 0:
                doc_len = 1
            dm_score = (tfd/doc_len)
            #print("Doc Model Score = " + str(dm_score))
            cm_score = (cf_query_terms[term] / coln_len)
            #print("Collection Model Score = " + str(cm_score))
            doc_score *= (lmbda * dm_score + (1-lmbda) * cm_score) ** tfq
            # if(dm_score != 0):
            #     print("Doc Score = " + str(doc_score))
        
        docid = java_object.getDocId("Assignment_2/index", i)
        scores[i] = (math.log(doc_score+1e-10), docid)


    #indexed_arr = [(elem, idx) for idx, elem in enumerate(scores)]
    
    scores.sort(reverse = True)
    # # Sort the list of tuples based on the elements
    # sorted_indexed_arr = sorted(indexed_arr, key=lambda x: x[0])
    
    # # Extract the sorted elements and their original indices
    # sorted_elems = [tup[0] for tup in sorted_indexed_arr]
    # original_indices = [tup[1] for tup in sorted_indexed_arr]
    i = 0
    print("LM Scores")
    while(i<10):
        print(scores[i][0])
        i += 1

    result = 0
    for i in range(num_docs):
        result += scores[i][0]
    #print(str(sum(scores)) + " " + str(result))

    # result /= num_docs
    # return result
    return scores


input_file_path = "Assignment_2/nfcorpus/test.vid-desc.queries"
output_file_path = "Assignment_2/nfcorpus/output_lm_abs.txt"
with open(input_file_path, 'r') as input_file:
            # Open output file for writing
    with open(output_file_path, 'w') as output_file:
        # Process each line in the input file
        for line in tqdm(input_file, total=102):
            # Split the line by whitespace
            words = line.split('\t')
            query = words[1]
            s1 = language_model(query, "abstract")

            for i in range(len(s1)):
                # Write the processed words to the output file
                result = words[0] + "\tQ0 " + "\t" + str(s1[i][1])+ "\t" + str(i) + "\t" + str(s1[i][0]) + "\tSTANDARD\n"
                output_file.write(result)

    print("Processing complete. Output written to", output_file_path)

