::> PART 3.4.1: PERMUTERM INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   135     97.9 MiB     97.9 MiB           1   @memory_profile
   136                                         def permuterm_trial():
   137     97.9 MiB      0.0 MiB           1       permuterm_profiler = time_profile.Profile()
   138                                         
   139    195.6 MiB     97.7 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   140                                             # Here postings is the inverted index
   141                                             # term_freq is the term frequency of each term in the collection
   142    273.7 MiB     78.1 MiB           1       permuterm_index = generate_permuterm_indices(term_freq=term_freq)
   143                                         
   144                                             # Open the file and search for the term
   145    273.7 MiB      0.0 MiB           2       with open("./s2/s2_wildcard.json") as f:
   146    273.7 MiB      0.0 MiB           1           queries = json.load(f)
   147                                         
   148    273.7 MiB      0.0 MiB           1       initial_time = 0
   149    273.7 MiB      0.0 MiB           1       times = []
   150    273.9 MiB      0.2 MiB          31       for term in tqdm(queries["queries"]):
   151    273.9 MiB      0.0 MiB          30           logging.info(f"Permuterm Search: Query Term is: {term}")
   152                                         
   153    273.9 MiB      0.0 MiB          30           permuterm_profiler.enable()
   154    273.9 MiB      0.0 MiB          60           results_per_query = permuterm_search_on_one_term(
   155    273.9 MiB      0.0 MiB          30               permuterm_index=permuterm_index,
   156    273.9 MiB      0.0 MiB          30               postings=postings,
   157    273.9 MiB      0.0 MiB          30               query=term["query"],
   158                                                 )
   159    273.9 MiB      0.0 MiB          30           permuterm_profiler.disable()
   160                                         
   161    273.9 MiB      0.0 MiB          30           stats = pstats.Stats(permuterm_profiler)
   162    273.9 MiB      0.0 MiB          30           current_iteration = stats.total_tt - initial_time
   163    273.9 MiB      0.0 MiB          30           initial_time = stats.total_tt
   164                                         
   165    273.9 MiB      0.0 MiB          30           times.append(current_iteration)
   166                                         
   167    273.9 MiB      0.0 MiB          60           logging.info(
   168    273.9 MiB      0.0 MiB          30               f"Profiled {current_iteration} seconds at {index} for {permuterm_search_on_one_term.__name__}"
   169                                                 )
   170    273.9 MiB      0.0 MiB          30           logging.info(f"Permuterm Search: Result Term is: {len(results_per_query)}")
   171                                                 # logging.info(f"Permuterm Search: Result Term is: {results_per_query}")
   172                                         
   173    274.5 MiB      0.6 MiB           1       pd.DataFrame(times).to_csv("permuterm_times.csv")


::> PART 3.4.2: TREE BASED INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   176    115.7 MiB    115.7 MiB           1   @memory_profile
   177                                         def trie_trial():
   178    115.7 MiB      0.0 MiB           1       tree_profiler = time_profile.Profile()
   179    197.7 MiB     82.0 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   180                                             # Here postings is the inverted index
   181                                             # term_freq is the term frequency of each term in the collection
   182                                         
   183                                             # Create the trie
   184    326.6 MiB    128.9 MiB           2       trieBasedIndexFromStart, trieBasedIndexFromEnd = generate_trie_indices(
   185    197.7 MiB      0.0 MiB           1           term_freq=term_freq
   186                                             )
   187                                         
   188                                             # Open the file and search for the term
   189    326.6 MiB      0.0 MiB           2       with open("./s2/s2_wildcard.json") as f:
   190    326.6 MiB      0.0 MiB           1           queries = json.load(f)
   191                                         
   192    326.6 MiB      0.0 MiB           1       initial_time = 0
   193    326.6 MiB      0.0 MiB           1       times = []
   194    331.2 MiB      0.0 MiB          31       for term in tqdm(queries["queries"]):
   195    331.2 MiB      0.0 MiB          30           tree_profiler.enable()
   196                                         
   197    331.2 MiB      4.6 MiB          60           tree_based_search(
   198    331.2 MiB      0.0 MiB          30               start_trie=trieBasedIndexFromStart,
   199    331.2 MiB      0.0 MiB          30               end_trie=trieBasedIndexFromEnd,
   200    331.2 MiB      0.0 MiB          30               postings=postings,
   201    331.2 MiB      0.0 MiB          30               term=term,
   202                                                 )
   203                                         
   204    331.2 MiB      0.0 MiB          30           tree_profiler.disable()
   205                                         
   206    331.2 MiB      0.0 MiB          30           stats = pstats.Stats(tree_profiler)
   207    331.2 MiB      0.0 MiB          30           current_iteration = stats.total_tt - initial_time
   208    331.2 MiB      0.0 MiB          30           initial_time = stats.total_tt
   209                                         
   210    331.2 MiB      0.0 MiB          30           times.append(current_iteration)
   211                                         
   212    331.2 MiB      0.0 MiB          60           logging.info(
   213    331.2 MiB      0.0 MiB          30               f"Profiled {current_iteration} seconds at {index} for {tree_based_search.__name__}"
   214                                                 )
   215                                         
   216    331.2 MiB      0.0 MiB           1       pd.DataFrame(times).to_csv("trie_times.csv")


::> PART 3.4.1: PERMUTERM INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   135    109.5 MiB    109.5 MiB           1   @memory_profile
   136                                         def permuterm_trial():
   137    109.5 MiB      0.0 MiB           1       permuterm_profiler = time_profile.Profile()
   138                                         
   139    207.2 MiB     97.7 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   140                                             # Here postings is the inverted index
   141                                             # term_freq is the term frequency of each term in the collection
   142    285.3 MiB     78.1 MiB           1       permuterm_index = generate_permuterm_indices(term_freq=term_freq)
   143                                         
   144                                             # Open the file and search for the term
   145    285.3 MiB      0.0 MiB           2       with open("./s2/s2_wildcard.json") as f:
   146    285.3 MiB      0.0 MiB           1           queries = json.load(f)
   147                                         
   148    285.3 MiB      0.0 MiB           1       initial_time = 0
   149    285.3 MiB      0.0 MiB           1       times = []
   150    285.5 MiB      0.2 MiB          31       for term in tqdm(queries["queries"]):
   151    285.5 MiB      0.0 MiB          30           logging.info(f"Permuterm Search: Query Term is: {term}")
   152                                         
   153    285.5 MiB      0.0 MiB          30           permuterm_profiler.enable()
   154    285.5 MiB      0.0 MiB          60           results_per_query = permuterm_search_on_one_term(
   155    285.5 MiB      0.0 MiB          30               permuterm_index=permuterm_index,
   156    285.5 MiB      0.0 MiB          30               postings=postings,
   157    285.5 MiB      0.0 MiB          30               query=term["query"],
   158                                                 )
   159    285.5 MiB      0.0 MiB          30           permuterm_profiler.disable()
   160                                         
   161    285.5 MiB      0.0 MiB          30           stats = pstats.Stats(permuterm_profiler)
   162    285.5 MiB      0.0 MiB          30           current_iteration = stats.total_tt - initial_time
   163    285.5 MiB      0.0 MiB          30           initial_time = stats.total_tt
   164                                         
   165    285.5 MiB      0.0 MiB          30           times.append([term["query"], current_iteration])
   166                                         
   167    285.5 MiB      0.0 MiB          60           logging.info(
   168    285.5 MiB      0.0 MiB          30               f"Profiled {current_iteration} seconds at {index} for {permuterm_search_on_one_term.__name__}"
   169                                                 )
   170    285.5 MiB      0.0 MiB          30           logging.info(f"Permuterm Search: Result Term is: {len(results_per_query)}")
   171                                                 # logging.info(f"Permuterm Search: Result Term is: {results_per_query}")
   172                                         
   173    286.2 MiB      0.7 MiB           2       pd.DataFrame(times).to_csv(
   174    285.5 MiB      0.0 MiB           1           "experiment4_permuterm_times.csv", index=False, header=["Query", "Time"]
   175                                             )


::> PART 3.4.2: TREE BASED INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   178    126.4 MiB    126.4 MiB           1   @memory_profile
   179                                         def trie_trial():
   180    126.4 MiB      0.0 MiB           1       tree_profiler = time_profile.Profile()
   181    210.2 MiB     83.8 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   182                                             # Here postings is the inverted index
   183                                             # term_freq is the term frequency of each term in the collection
   184                                         
   185                                             # Create the trie
   186    339.1 MiB    128.9 MiB           2       trieBasedIndexFromStart, trieBasedIndexFromEnd = generate_trie_indices(
   187    210.2 MiB      0.0 MiB           1           term_freq=term_freq
   188                                             )
   189                                         
   190                                             # Open the file and search for the term
   191    339.1 MiB      0.0 MiB           2       with open("./s2/s2_wildcard.json") as f:
   192    339.1 MiB      0.0 MiB           1           queries = json.load(f)
   193                                         
   194    339.1 MiB      0.0 MiB           1       initial_time = 0
   195    339.1 MiB      0.0 MiB           1       times = []
   196    343.5 MiB     -0.4 MiB          31       for term in tqdm(queries["queries"]):
   197    343.5 MiB     -0.4 MiB          30           tree_profiler.enable()
   198                                         
   199    343.5 MiB      3.6 MiB          60           tree_based_search(
   200    343.5 MiB     -0.4 MiB          30               start_trie=trieBasedIndexFromStart,
   201    343.5 MiB     -0.4 MiB          30               end_trie=trieBasedIndexFromEnd,
   202    343.5 MiB     -0.4 MiB          30               postings=postings,
   203    343.5 MiB     -0.4 MiB          30               term=term,
   204                                                 )
   205                                         
   206    343.5 MiB     -0.4 MiB          30           tree_profiler.disable()
   207                                         
   208    343.5 MiB     -0.4 MiB          30           stats = pstats.Stats(tree_profiler)
   209    343.5 MiB     -0.4 MiB          30           current_iteration = stats.total_tt - initial_time
   210    343.5 MiB     -0.4 MiB          30           initial_time = stats.total_tt
   211                                         
   212    343.5 MiB     -0.4 MiB          30           times.append([term["query"], current_iteration])
   213                                         
   214    343.5 MiB     -0.7 MiB          60           logging.info(
   215    343.5 MiB     -0.4 MiB          30               f"Profiled {current_iteration} seconds at {index} for {tree_based_search.__name__}"
   216                                                 )
   217                                         
   218    343.5 MiB      0.0 MiB           2       pd.DataFrame(times).to_csv(
   219    343.5 MiB      0.0 MiB           1           "experiment4_trie_times.csv", index=False, header=["Query", "Time"]
   220                                             )


