Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment5.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
     8    114.1 MiB    114.1 MiB           1   @memory_profile
     9                                         def tolerant_retrieval():
    10    114.1 MiB      0.0 MiB           1       tolerant_profile = time_profile.Profile()
    11                                         
    12                                             # Open the file and search for the term
    13    114.1 MiB      0.0 MiB           2       with open("./s2/s2_wildcard_boolean.json") as f:
    14    114.1 MiB      0.0 MiB           1           queries = json.load(f)
    15                                         
    16    211.8 MiB     97.7 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
    17    211.8 MiB      0.0 MiB           1       threshold = 2
    18                                         
    19    340.7 MiB    128.9 MiB           1       start_trie, end_trie = generate_trie_indices(term_freq=term_freq)
    20                                         
    21    340.7 MiB      0.0 MiB           1       initial_time = 0
    22    340.7 MiB      0.0 MiB           1       times = []
    23                                         
    24    358.2 MiB    -73.7 MiB          31       for query_ in tqdm(queries["queries"]):
    25    358.2 MiB    -70.0 MiB          30           logging.info(f"Query: {query_}")
    26                                         
    27    358.2 MiB    -70.0 MiB          30           tolerant_profile.enable()
    28                                         
    29    358.2 MiB    -70.0 MiB          30           words = query_["query"].split()
    30    358.2 MiB    -70.0 MiB          30           final_doc_list = list()
    31                                         
    32    359.8 MiB   -235.0 MiB          95           for w in words:
    33    359.8 MiB   -170.0 MiB          65               if "*" in w:
    34    359.8 MiB   -112.0 MiB          42                   logging.info(f"::> Wildcard Term: {w}")
    35                                                         # Split the term at the *
    36    359.8 MiB   -112.0 MiB          42                   first_half = w.split("*")[0]
    37    359.8 MiB   -112.0 MiB          42                   second_half = w.split("*")[1]
    38                                                         # This will return all the words that start with the first half
    39    359.8 MiB   -109.9 MiB          42                   first_half_results = start_trie.starts_with(first_half)
    40                                                         # This will return reverse of all the words that end with the second half
    41    356.9 MiB   -150.1 MiB          42                   second_half_results = end_trie.starts_with(second_half[::-1])
    42                                                         # reverse all the words in the second half results
    43    359.7 MiB -1454308.6 MiB      788551                   second_half_results = [i[::-1] for i in second_half_results]
    44                                         
    45    359.8 MiB   -211.2 MiB          84                   wildcard_words = list(
    46    359.8 MiB   -102.3 MiB          42                       set(first_half_results).intersection(set(second_half_results))
    47                                                         )
    48    359.8 MiB   -112.4 MiB          42                   wildcard_docs = set()
    49    359.8 MiB -18966.0 MiB       13762                   for word in wildcard_words:
    50    359.8 MiB -18853.6 MiB       13720                       wildcard_docs = wildcard_docs.union(set(postings[word]))
    51                                                         # logging.info(f"::> Docs: {wildcard_docs}")
    52    359.8 MiB   -112.4 MiB          42                   final_doc_list.append(wildcard_docs)
    53                                         
    54                                                     else:
    55    359.8 MiB    -58.1 MiB          23                   logging.info(f"::> Non Wildcard Term: {w}")
    56    359.8 MiB    -52.2 MiB          23                   docs = set()
    57    359.8 MiB -3947860.4 MiB     1696480                   for term in postings:
    58                                                             if (
    59    359.8 MiB -3947844.9 MiB     1696457                           edit_distance(w, term) <= threshold
    60    359.8 MiB  -1743.9 MiB         755                           and abs(len(w) - len(term)) <= 1
    61                                                             ):
    62    359.8 MiB  -2050.9 MiB         912                           logging.info(
    63    359.8 MiB  -1020.9 MiB         456                               f"::> Non Wildcard Term that's closer to this: {term}"
    64                                                                 )
    65                                                                 # logging.info(f"::> Docs: {postings[term][0]}")
    66    359.8 MiB  -1020.9 MiB         456                           docs = docs.union(set(postings[term]))
    67                                                         # logging.info(f"::> Docs: {docs}")
    68    359.8 MiB    -52.5 MiB          23                   final_doc_list.append(docs)
    69                                         
    70    358.2 MiB    -93.4 MiB          30           result = set(final_doc_list[0])
    71    358.2 MiB   -159.7 MiB          65           for i in range(1, len(final_doc_list)):
    72    358.2 MiB    -85.8 MiB          35               result = result.intersection(final_doc_list[i])
    73                                         
    74    358.2 MiB    -73.9 MiB          30           result = list(result)
    75                                         
    76    358.2 MiB    -73.9 MiB          30           tolerant_profile.disable()
    77                                         
    78    358.2 MiB    -73.9 MiB          30           stats = pstats.Stats(tolerant_profile)
    79    358.2 MiB    -73.9 MiB          30           current_iteration = stats.total_tt - initial_time
    80    358.2 MiB    -73.9 MiB          30           initial_time = stats.total_tt
    81                                         
    82    358.2 MiB    -73.9 MiB          30           times.append([query_, current_iteration])
    83                                         
    84    358.2 MiB   -147.8 MiB          60           logging.info(
    85    358.2 MiB    -73.9 MiB          30               f"Profiled {current_iteration} seconds at {index} for {tree_based_search.__name__}"
    86                                                 )
    87                                         
    88    354.8 MiB     -3.4 MiB           1       pd.DataFrame(times).to_csv("experiment5.csv", index=False, header=["Query", "Time"])


