Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment5.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
     8    103.9 MiB    103.9 MiB           1   @memory_profile
     9                                         def tolerant_retrieval():
    10    103.9 MiB      0.0 MiB           1       tolerant_profile = time_profile.Profile()
    11                                         
    12                                             # Open the file and search for the term
    13    103.9 MiB      0.0 MiB           2       with open("./s2/s2_wildcard_boolean.json") as f:
    14    103.9 MiB      0.0 MiB           1           queries = json.load(f)
    15                                         
    16    201.6 MiB     97.7 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
    17    201.6 MiB      0.0 MiB           1       threshold = 2
    18                                         
    19    330.5 MiB    128.9 MiB           1       start_trie, end_trie = generate_trie_indices(term_freq=term_freq)
    20                                         
    21    330.5 MiB      0.0 MiB           1       initial_time = 0
    22    330.5 MiB      0.0 MiB           1       times = []
    23                                         
    24    344.6 MiB    -83.9 MiB          31       for query_ in tqdm(queries["queries"]):
    25    344.6 MiB    -78.3 MiB          30           logging.info(f"Query: {query_}")
    26                                         
    27    344.6 MiB    -78.3 MiB          30           tolerant_profile.enable()
    28                                         
    29    344.6 MiB    -78.3 MiB          30           words = query_["query"].split()
    30    344.6 MiB    -78.3 MiB          30           final_doc_list = list()
    31                                         
    32    344.6 MiB   -233.9 MiB          95           for w in words:
    33    344.6 MiB   -158.3 MiB          65               if "*" in w:
    34    344.6 MiB   -104.7 MiB          42                   logging.info(f"::> Wildcard Term: {w}")
    35                                                         # Split the term at the *
    36    344.6 MiB   -104.7 MiB          42                   first_half = w.split("*")[0]
    37    344.6 MiB   -104.7 MiB          42                   second_half = w.split("*")[1]
    38                                                         # This will return all the words that start with the first half
    39    344.6 MiB   -101.2 MiB          42                   first_half_results = start_trie.starts_with(first_half)
    40                                                         # This will return reverse of all the words that end with the second half
    41    343.9 MiB   -138.5 MiB          42                   second_half_results = end_trie.starts_with(second_half[::-1])
    42                                                         # reverse all the words in the second half results
    43    344.4 MiB -1760959.2 MiB      788551                   second_half_results = [i[::-1] for i in second_half_results]
    44                                         
    45    344.6 MiB   -207.0 MiB          84                   wildcard_words = list(
    46    344.6 MiB    -99.9 MiB          42                       set(first_half_results).intersection(set(second_half_results))
    47                                                         )
    48    344.6 MiB   -110.5 MiB          42                   wildcard_docs = set()
    49    344.6 MiB -21790.0 MiB       13762                   for word in wildcard_words:
    50    344.6 MiB -21679.4 MiB       13720                       wildcard_docs = wildcard_docs.union(set(postings[word]))
    51                                                         # logging.info(f"::> Docs: {wildcard_docs}")
    52    344.6 MiB   -110.5 MiB          42                   final_doc_list.append(wildcard_docs)
    53                                         
    54                                                     else:
    55    344.2 MiB    -53.5 MiB          23                   logging.info(f"::> Non Wildcard Term: {w}")
    56    344.2 MiB    -45.0 MiB          23                   docs = set()
    57    344.2 MiB -3322657.5 MiB     1696480                   for term in postings:
    58                                                             if (
    59    344.2 MiB -3322612.5 MiB     1696457                           edit_distance(w, term) <= threshold
    60    344.2 MiB  -1329.6 MiB         755                           and abs(len(w) - len(term)) <= 1
    61                                                             ):
    62    344.2 MiB  -1569.6 MiB         912                           logging.info(
    63    344.2 MiB   -784.8 MiB         456                               f"::> Non Wildcard Term that's closer to this: {term}"
    64                                                                 )
    65                                                                 # logging.info(f"::> Docs: {postings[term][0]}")
    66    344.2 MiB   -784.8 MiB         456                           docs = docs.union(set(postings[term]))
    67                                                         # logging.info(f"::> Docs: {docs}")
    68    344.2 MiB    -45.0 MiB          23                   final_doc_list.append(docs)
    69                                         
    70    344.6 MiB    -88.1 MiB          30           result = set(final_doc_list[0])
    71    344.6 MiB   -186.1 MiB          65           for i in range(1, len(final_doc_list)):
    72    344.6 MiB   -102.0 MiB          35               result = result.intersection(final_doc_list[i])
    73                                         
    74    344.6 MiB    -84.1 MiB          30           result = list(result)
    75                                         
    76    344.6 MiB    -84.1 MiB          30           tolerant_profile.disable()
    77                                         
    78    344.6 MiB    -84.1 MiB          30           stats = pstats.Stats(tolerant_profile)
    79    344.6 MiB    -84.1 MiB          30           current_iteration = stats.total_tt - initial_time
    80    344.6 MiB    -84.1 MiB          30           initial_time = stats.total_tt
    81                                         
    82    344.6 MiB    -84.1 MiB          30           times.append([query_, current_iteration])
    83                                         
    84    344.6 MiB   -168.2 MiB          60           logging.info(
    85    344.6 MiB    -84.1 MiB          30               f"Profiled {current_iteration} seconds at {index} for {tree_based_search.__name__}"
    86                                                 )
    87                                         
    88    339.3 MiB     -5.3 MiB           1       pd.DataFrame(times).to_csv("experiment5.csv", index=False, header=["Query", "Time"])


