Which experiment do you want to do (1-5): ::> PART 3.4.1: PERMUTERM INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   151     97.3 MiB     97.3 MiB           1   @memory_profile
   152                                         def permuterm_trial():
   153     97.3 MiB      0.0 MiB           1       permuterm_profiler = time_profile.Profile()
   154                                         
   155    195.1 MiB     97.7 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   156                                             # Here postings is the inverted index
   157                                             # term_freq is the term frequency of each term in the collection
   158   1286.1 MiB   1091.1 MiB           1       permuterm_index = generate_permuterm_indices(term_freq=term_freq, postings=postings)
   159                                         
   160                                             # Open the file and search for the term
   161   1286.1 MiB      0.0 MiB           2       with open("./s2/s2_wildcard.json") as f:
   162   1286.1 MiB      0.0 MiB           1           queries = json.load(f)
   163                                         
   164   1286.1 MiB      0.0 MiB           1       initial_time = 0
   165   1286.1 MiB      0.0 MiB           1       times = []
   166   1287.2 MiB      0.2 MiB          31       for term in tqdm(queries["queries"]):
   167   1287.2 MiB      0.0 MiB          30           logging.info(f"Permuterm Search: Query Term is: {term}")
   168                                         
   169   1287.2 MiB      0.0 MiB          30           permuterm_profiler.enable()
   170   1287.2 MiB      0.8 MiB          60           results_per_query = permuterm_search_on_one_term(
   171   1287.2 MiB      0.0 MiB          30               permuterm_index=permuterm_index,
   172   1287.2 MiB      0.0 MiB          30               postings=postings,
   173   1287.2 MiB      0.0 MiB          30               query=term["query"],
   174                                                 )
   175   1287.2 MiB      0.0 MiB          30           permuterm_profiler.disable()
   176                                         
   177   1287.2 MiB      0.0 MiB          30           stats = pstats.Stats(permuterm_profiler)
   178   1287.2 MiB      0.0 MiB          30           current_iteration = stats.total_tt - initial_time
   179   1287.2 MiB      0.0 MiB          30           initial_time = stats.total_tt
   180                                         
   181   1287.2 MiB      0.0 MiB          30           times.append([term["query"], current_iteration])
   182                                         
   183   1287.2 MiB      0.0 MiB          60           logging.info(
   184   1287.2 MiB      0.0 MiB          30               f"Profiled {current_iteration} seconds at {index} for {permuterm_search_on_one_term.__name__}"
   185                                                 )
   186   1287.2 MiB      0.0 MiB          60           logging.info(
   187   1287.2 MiB      0.0 MiB          30               f"Permuterm Search: Length of Results is: {len(results_per_query)}"
   188                                                 )
   189                                                 # logging.info(f"Permuterm Search: Result Term is: {results_per_query}")
   190                                         
   191   1287.2 MiB      0.0 MiB           1       return times


::> PART 3.4.2: TREE BASED INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   194    128.0 MiB    128.0 MiB           1   @memory_profile
   195                                         def trie_trial():
   196    128.0 MiB      0.0 MiB           1       tree_profiler = time_profile.Profile()
   197    198.1 MiB     70.1 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   198                                             # Here postings is the inverted index
   199                                             # term_freq is the term frequency of each term in the collection
   200                                         
   201                                             # Create the trie
   202    335.0 MiB    136.9 MiB           2       trieBasedIndexFromStart, trieBasedIndexFromEnd = generate_trie_indices(
   203    198.1 MiB      0.0 MiB           1           term_freq=term_freq, postings=postings
   204                                             )
   205                                         
   206                                             # Open the file and search for the term
   207    335.0 MiB      0.0 MiB           2       with open("./s2/s2_wildcard.json") as f:
   208    335.0 MiB      0.0 MiB           1           queries = json.load(f)
   209                                         
   210    335.0 MiB      0.0 MiB           1       initial_time = 0
   211    335.0 MiB      0.0 MiB           1       times = []
   212    342.7 MiB     -0.9 MiB          31       for term in tqdm(queries["queries"]):
   213    342.7 MiB     -0.9 MiB          30           tree_profiler.enable()
   214                                         
   215    342.7 MiB      5.9 MiB          60           tree_based_search(
   216    342.7 MiB     -0.9 MiB          30               start_trie=trieBasedIndexFromStart,
   217    342.7 MiB     -0.9 MiB          30               end_trie=trieBasedIndexFromEnd,
   218    342.7 MiB     -0.9 MiB          30               postings=postings,
   219    342.7 MiB     -0.9 MiB          30               term=term,
   220                                                 )
   221                                         
   222    342.7 MiB     -0.9 MiB          30           tree_profiler.disable()
   223                                         
   224    342.7 MiB     -0.9 MiB          30           stats = pstats.Stats(tree_profiler)
   225    342.7 MiB     -0.9 MiB          30           current_iteration = stats.total_tt - initial_time
   226    342.7 MiB     -0.9 MiB          30           initial_time = stats.total_tt
   227                                         
   228    342.7 MiB     -0.9 MiB          30           times.append([term["query"], current_iteration])
   229                                         
   230    342.7 MiB     -1.8 MiB          60           logging.info(
   231    342.7 MiB     -0.9 MiB          30               f"Profiled {current_iteration} seconds at {index} for {tree_based_search.__name__}"
   232                                                 )
   233                                         
   234    342.7 MiB      0.0 MiB           1       return times


Dictionary size: 73759
