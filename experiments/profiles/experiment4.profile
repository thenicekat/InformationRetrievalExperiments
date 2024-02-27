Which experiment do you want to do (1-5): ::> PART 3.4.1: PERMUTERM INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   151    102.0 MiB    102.0 MiB           1   @memory_profile
   152                                         def permuterm_trial():
   153    102.0 MiB      0.0 MiB           1       permuterm_profiler = time_profile.Profile()
   154                                         
   155    199.7 MiB     97.7 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   156                                             # Here postings is the inverted index
   157                                             # term_freq is the term frequency of each term in the collection
   158    277.8 MiB     78.1 MiB           1       permuterm_index = generate_permuterm_indices(term_freq=term_freq)
   159                                         
   160                                             # Open the file and search for the term
   161    277.8 MiB      0.0 MiB           2       with open("./s2/s2_wildcard.json") as f:
   162    277.8 MiB      0.0 MiB           1           queries = json.load(f)
   163                                         
   164    277.8 MiB      0.0 MiB           1       initial_time = 0
   165    277.8 MiB      0.0 MiB           1       times = []
   166    278.0 MiB      0.2 MiB          31       for term in tqdm(queries["queries"]):
   167    278.0 MiB      0.0 MiB          30           logging.info(f"Permuterm Search: Query Term is: {term}")
   168                                         
   169    278.0 MiB      0.0 MiB          30           permuterm_profiler.enable()
   170    278.0 MiB      0.0 MiB          60           results_per_query = permuterm_search_on_one_term(
   171    278.0 MiB      0.0 MiB          30               permuterm_index=permuterm_index,
   172    278.0 MiB      0.0 MiB          30               postings=postings,
   173    278.0 MiB      0.0 MiB          30               query=term["query"],
   174                                                 )
   175    278.0 MiB      0.0 MiB          30           permuterm_profiler.disable()
   176                                         
   177    278.0 MiB      0.0 MiB          30           stats = pstats.Stats(permuterm_profiler)
   178    278.0 MiB      0.0 MiB          30           current_iteration = stats.total_tt - initial_time
   179    278.0 MiB      0.0 MiB          30           initial_time = stats.total_tt
   180                                         
   181    278.0 MiB      0.0 MiB          30           times.append([term["query"], current_iteration])
   182                                         
   183    278.0 MiB      0.0 MiB          60           logging.info(
   184    278.0 MiB      0.0 MiB          30               f"Profiled {current_iteration} seconds at {index} for {permuterm_search_on_one_term.__name__}"
   185                                                 )
   186    278.0 MiB      0.0 MiB          30           logging.info(f"Permuterm Search: Result Term is: {len(results_per_query)}")
   187                                                 # logging.info(f"Permuterm Search: Result Term is: {results_per_query}")
   188                                         
   189    278.0 MiB      0.0 MiB           1       return times


::> PART 3.4.2: TREE BASED INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   192    119.8 MiB    119.8 MiB           1   @memory_profile
   193                                         def trie_trial():
   194    119.8 MiB      0.0 MiB           1       tree_profiler = time_profile.Profile()
   195    201.5 MiB     81.7 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   196                                             # Here postings is the inverted index
   197                                             # term_freq is the term frequency of each term in the collection
   198                                         
   199                                             # Create the trie
   200    338.4 MiB    136.9 MiB           2       trieBasedIndexFromStart, trieBasedIndexFromEnd = generate_trie_indices(
   201    201.5 MiB      0.0 MiB           1           term_freq=term_freq, postings=postings
   202                                             )
   203                                         
   204                                             # Open the file and search for the term
   205    338.4 MiB      0.0 MiB           2       with open("./s2/s2_wildcard.json") as f:
   206    338.4 MiB      0.0 MiB           1           queries = json.load(f)
   207                                         
   208    338.4 MiB      0.0 MiB           1       initial_time = 0
   209    338.4 MiB      0.0 MiB           1       times = []
   210    342.9 MiB     -0.7 MiB          31       for term in tqdm(queries["queries"]):
   211    342.9 MiB     -0.7 MiB          30           tree_profiler.enable()
   212                                         
   213    342.9 MiB      3.1 MiB          60           tree_based_search(
   214    342.9 MiB     -0.7 MiB          30               start_trie=trieBasedIndexFromStart,
   215    342.9 MiB     -0.7 MiB          30               end_trie=trieBasedIndexFromEnd,
   216    342.9 MiB     -0.7 MiB          30               postings=postings,
   217    342.9 MiB     -0.7 MiB          30               term=term,
   218                                                 )
   219                                         
   220    342.9 MiB     -0.7 MiB          30           tree_profiler.disable()
   221                                         
   222    342.9 MiB     -0.7 MiB          30           stats = pstats.Stats(tree_profiler)
   223    342.9 MiB     -0.7 MiB          30           current_iteration = stats.total_tt - initial_time
   224    342.9 MiB     -0.7 MiB          30           initial_time = stats.total_tt
   225                                         
   226    342.9 MiB     -0.7 MiB          30           times.append([term["query"], current_iteration])
   227                                         
   228    342.9 MiB     -1.4 MiB          60           logging.info(
   229    342.9 MiB     -0.7 MiB          30               f"Profiled {current_iteration} seconds at {index} for {tree_based_search.__name__}"
   230                                                 )
   231                                         
   232    342.9 MiB      0.0 MiB           1       return times


Dictionary size: 73759
