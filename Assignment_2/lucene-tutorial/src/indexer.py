# This is a sample Python script.

import shutil
import os
import json
import numpy as np
import sys

import pandas as pd


# reads s2 corpus in json and
# creates an intermediary file
# containing token and doc_id pairs.


def read_corpus(path):
    f = pd.read_csv(path + '/doc_dump.txt', sep="	", names=['id', 'url', 'title', 'abstract'])
    f2 = pd.read_csv(path + '/nfdump.txt', sep="	", names=['id', 'url', 'title', 'abstract', 'comments', 'topicstags', 'desc', 'doctorsnote', 'articlelinks', 'questionlinks', 'topiclinks', 'videolinks', 'metalinks'])
    
    if not os.path.exists(path + "/intermediate/"):
        os.mkdir(path + "/intermediate/")
    o = open(path + "/intermediate/output.tsv", "w", encoding="utf-8")
    
    for _, json_object in f.iterrows():
        doc_no = json_object["id"]
        title = json_object["title"]
        paper_abstract = json_object["abstract"]
        tokens = title.split(" ")
        for t in tokens:
            o.write(t.lower() + "\t" + str(doc_no) + "\n")
        tokens = paper_abstract.split(" ")
        for t in tokens:
            o.write(t.lower() + "\t" + str(doc_no) + "\n")
    
    for _, json_object in f2.iterrows():
        doc_no = json_object["id"]
        title = json_object["title"]
        paper_abstract = json_object["abstract"]
        tokens = title.split(" ")
        for t in tokens:
            o.write(t.lower() + "\t" + str(doc_no) + "\n")
        tokens = paper_abstract.split(" ")
        for t in tokens:
            o.write(t.lower() + "\t" + str(doc_no) + "\n")
    o.close()


# sorts (token, doc_id) pairs
# by token first and then doc_id
def sort(dir):
    f = open(dir + "/intermediate/output.tsv", encoding="utf-8")
    o = open(dir + "/intermediate/output_sorted.tsv", "w", encoding="utf-8")

    # initialize an empty list of pairs of
    # tokens and their doc_ids
    pairs = []

    for line in f:
        line = line[:-1]
        split_line = line.split("\t")
        if len(split_line) == 2:
            pair = (split_line[0], split_line[1])
            pairs.append(pair)

    # sort (token, doc_id) pairs by token first and then doc_id
    sorted_pairs = sorted(pairs, key=lambda x: (x[0], x[1]))

    # write sorted pairs to file
    for sp in sorted_pairs:
        o.write(sp[0] + "\t" + sp[1] + "\n")
    o.close()


# converts (token, doc_id) pairs
# into a dictionary of tokens
# and an adjacency list of doc_id
def construct_postings(dir):
    # open file to write postings
    o1 = open(dir + "/intermediate/postings.tsv", "w", encoding="utf-8")

    postings = {}  # initialize our dictionary of terms
    doc_freq = {}  # document frequency for each term

    # read the file containing the sorted pairs
    f = open(dir + "/intermediate/output_sorted.tsv", encoding="utf-8")

    # initialize sorted pairs
    sorted_pairs = []

    # read sorted pairs
    for line in f:
        line = line[:-1]
        split_line = line.split("\t")
        pairs = (split_line[0], split_line[1])
        sorted_pairs.append(pairs)

    # construct postings from sorted pairs
    for pairs in sorted_pairs:
        if pairs[0] not in postings:
            postings[pairs[0]] = {}
            if pairs[1] not in postings[pairs[0]]:
                postings[pairs[0]][pairs[1]] = 1
            else:
                postings[pairs[0]][pairs[1]] += 1
        else:
            if pairs[1] not in postings[pairs[0]]:
                postings[pairs[0]][pairs[1]] = 1
            else:
                postings[pairs[0]][pairs[1]] += 1

    # update doc_freq which is the size of postings list
    for token in postings:
        doc_freq[token] = len(postings[token])

    # print("postings: " + str(postings))
    # print("doc freq: " + str(doc_freq))
    print("Dictionary size before removing stop words: " + str(len(postings)))
    
    # open the stop words file
    stop_words = open(dir + "/stopwords.large", "r")
    for line in stop_words:
        if line.strip() in postings:
            del postings[line.strip()]
            del doc_freq[line.strip()]
            
    print("Dictionary size after removing stop words: " + str(len(postings)))
    
    # check if the term has any random symbosl
    # for token in list(postings.keys()):
    #     if not token.isalnum():
    #         del postings[token]
    #         del doc_freq[token]
            
    # print("Dictionary size after removing random symbols: " + str(len(postings)))

    # write postings and document frequency to file
    for token in postings:
        o1.write(token + "\t" + str(doc_freq[token]))
        for l in postings[token]:
            o1.write("\t" + l)
            o1.write("\t" + str(postings[token][l]))
        o1.write("\n")
    o1.close()


# starting the indexing process
def index(dir):
    # reads the corpus and
    # creates an intermediary file
    # containing token and doc_id pairs.
    # read_corpus(dir)
    read_corpus(dir)

    # sorts (token, doc_id) pairs
    # by token first and then doc_id
    sort(dir)

    # converts (token, doc_id) pairs
    # into a dictionary of tokens
    # and an adjacency list of doc_id
    # modified to give term frequency in each doc also
    construct_postings(dir)


def load_index_in_memory(dir):
    f = open(dir + "intermediate/postings.tsv", encoding="utf-8")
    postings = {}
    doc_freq = {}
    doc_ids = {}

    for line in f:
        splitline = line.split("\t")

        token = splitline[0]
        freq = int(splitline[1])

        doc_freq[token] = freq

        item_list = []

        for item in range(2, len(splitline), 2):
            item_list.append({
                "doc_id": splitline[item],
                "term_freq": int(splitline[item + 1])
            })
            if splitline[item] not in doc_ids:
                doc_ids[splitline[item]] = len(doc_ids)
        postings[token] = item_list

    return postings, doc_freq, doc_ids

def getTFIDFVector(query, postings, doc_freq, doc_ids):
    number_of_docs = len(doc_ids)
    tf_vector = np.zeros(number_of_docs)
    for token in query.split(" "):
        if token in doc_freq:
            idf = np.log(number_of_docs / doc_freq[token])
            # create a vector of term frequencies for documents
            for i in range(len(postings[token])):
                # print(doc_ids[postings[token][i]["doc_id"]], postings[token][i]["term_freq"])
                tf_vector[doc_ids[postings[token][i]["doc_id"]]] += idf * postings[token][i]["term_freq"]
    tf_vector = np.log(1 + tf_vector)
    return tf_vector    

def intersection(l1, l2):
    count1 = 0
    count2 = 0
    intersection_list = []

    while count1 < len(l1) and count2 < len(l2):
        if l1[count1] == l2[count2]:
            intersection_list.append(l1[count1])
            count1 = count1 + 1
            count2 = count2 + 1
        elif l1[count1] < l2[count2]:
            count1 = count1 + 1
        elif l1[count1] > l2[count2]:
            count2 = count2 + 1

    return intersection_list

def get_term_freq(token, doc_id, corpus):
    # load postings in memory
    postings, doc_freq = load_index_in_memory(corpus)

    # get the postings list for the token
    postings_list = postings[token]

    # check if the doc_id is in the postings list
    if doc_id in postings_list:
        return 1
    else:
        return 0

def and_query(query_terms, corpus):
    # load postings in memory
    postings, doc_freq = load_index_in_memory(corpus)

    # postings for only the query terms
    postings_for_keywords = {}
    doc_freq_for_keywords = {}

    for q in query_terms:
        postings_for_keywords[q] = postings[q]

    # store doc frequency for query token in
    # dictionary

    for q in query_terms:
        doc_freq_for_keywords[q] = doc_freq[q]

    # sort tokens in increasing order of their
    # frequencies

    sorted_tokens = sorted(doc_freq_for_keywords.items(), key=lambda x: x[1])

    # initialize result to postings list of the
    # token with minimum doc frequency

    result = postings_for_keywords[sorted_tokens[0][0]]

    # iterate over the remaining postings list and
    # intersect them with result, and updating it
    # in every step

    for i in range(1, len(postings_for_keywords)):
        result = intersection(result, postings_for_keywords[sorted_tokens[i][0]])
        if len(result) == 0:
            return result

    return result


# Code starts here
if __name__ == "__main__":
    import platform
    import subprocess

    if sys.version_info.major < 3:
        raise Exception("Python version is less than 3")


    index("../../nfcorpus/raw")
# See PyCharm help at https://www.jetbrains.com/help/pycharm/
