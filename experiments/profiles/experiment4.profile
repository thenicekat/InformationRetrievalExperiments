Which experiment do you want to do (1-5): ::> PART 3.4.1: PERMUTERM INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   152    101.6 MiB    101.6 MiB           1   @memory_profile
   153                                         def permuterm_trial():
   154    101.6 MiB      0.0 MiB           1       permuterm_profiler = time_profile.Profile()
   155                                         
   156    199.3 MiB     97.7 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   157                                             # Here postings is the inverted index
   158                                             # term_freq is the term frequency of each term in the collection
   159    277.4 MiB     78.1 MiB           1       permuterm_index = generate_permuterm_indices(term_freq=term_freq, postings=postings)
   160                                         
   161                                             # Open the file and search for the term
   162    277.4 MiB      0.0 MiB           2       with open("./s2/s2_wildcard.json") as f:
   163    277.4 MiB      0.0 MiB           1           queries = json.load(f)
   164                                         
   165    277.4 MiB      0.0 MiB           1       initial_time = 0
   166    277.4 MiB      0.0 MiB           1       times = []
   167    277.6 MiB      0.2 MiB          31       for term in tqdm(queries["queries"]):
   168    277.6 MiB      0.0 MiB          30           logging.info(f"Permuterm Search: Query Term is: {term}")
   169                                         
   170    277.6 MiB      0.0 MiB          30           permuterm_profiler.enable()
   171    277.6 MiB      0.0 MiB          60           results_per_query = permuterm_search_on_one_term(
   172    277.6 MiB      0.0 MiB          30               permuterm_index=permuterm_index,
   173    277.6 MiB      0.0 MiB          30               query=term["query"],
   174                                                 )
   175    277.6 MiB      0.0 MiB          30           permuterm_profiler.disable()
   176                                         
   177    277.6 MiB      0.0 MiB          30           stats = pstats.Stats(permuterm_profiler)
   178    277.6 MiB      0.0 MiB          30           current_iteration = stats.total_tt - initial_time
   179    277.6 MiB      0.0 MiB          30           initial_time = stats.total_tt
   180                                         
   181    277.6 MiB      0.0 MiB          30           times.append([term["query"], current_iteration])
   182                                         
   183    277.6 MiB      0.0 MiB          60           logging.info(
   184    277.6 MiB      0.0 MiB          30               f"Profiled {current_iteration} seconds at {index} for {permuterm_search_on_one_term.__name__}"
   185                                                 )
   186    277.6 MiB      0.0 MiB          30           logging.info(f"Permuterm Search: Result Term is: {len(results_per_query)}")
   187                                                 # logging.info(f"Permuterm Search: Result Term is: {results_per_query}")
   188                                         
   189    277.6 MiB      0.0 MiB           1       return times


::> PART 3.4.2: TREE BASED INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   192    117.5 MiB    117.5 MiB           1   @memory_profile
   193                                         def trie_trial():
   194    117.5 MiB      0.0 MiB           1       tree_profiler = time_profile.Profile()
   195    200.2 MiB     82.8 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   196                                             # Here postings is the inverted index
   197                                             # term_freq is the term frequency of each term in the collection
   198                                         
   199                                             # Create the trie
   200    337.1 MiB    136.9 MiB           2       trieBasedIndexFromStart, trieBasedIndexFromEnd = generate_trie_indices(
   201    200.2 MiB      0.0 MiB           1           term_freq=term_freq, postings=postings
   202                                             )
   203                                         
   204                                             # Open the file and search for the term
   205    337.1 MiB      0.0 MiB           2       with open("./s2/s2_wildcard.json") as f:
   206    337.1 MiB      0.0 MiB           1           queries = json.load(f)
   207                                         
   208    337.1 MiB      0.0 MiB           1       initial_time = 0
   209    337.1 MiB      0.0 MiB           1       times = []
   210    342.0 MiB     -0.9 MiB          31       for term in tqdm(queries["queries"]):
   211    342.0 MiB     -0.9 MiB          30           tree_profiler.enable()
   212                                         
   213    342.0 MiB      3.0 MiB          60           tree_based_search(
   214    342.0 MiB     -0.9 MiB          30               start_trie=trieBasedIndexFromStart,
   215    342.0 MiB     -0.9 MiB          30               end_trie=trieBasedIndexFromEnd,
   216    342.0 MiB     -0.9 MiB          30               postings=postings,
   217    342.0 MiB     -0.9 MiB          30               term=term,
   218                                                 )
   219                                         
   220    342.0 MiB     -0.9 MiB          30           tree_profiler.disable()
   221                                         
   222    342.0 MiB     -0.9 MiB          30           stats = pstats.Stats(tree_profiler)
   223    342.0 MiB     -0.9 MiB          30           current_iteration = stats.total_tt - initial_time
   224    342.0 MiB     -0.9 MiB          30           initial_time = stats.total_tt
   225                                         
   226    342.0 MiB     -0.9 MiB          30           times.append([term["query"], current_iteration])
   227                                         
   228    342.0 MiB     -1.8 MiB          60           logging.info(
   229    342.0 MiB     -0.9 MiB          30               f"Profiled {current_iteration} seconds at {index} for {tree_based_search.__name__}"
   230                                                 )
   231                                         
   232    342.0 MiB      0.0 MiB           1       return times


Dictionary size: 73759
