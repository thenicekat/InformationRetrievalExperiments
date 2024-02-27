Which experiment do you want to do (1-5): 
::> PART 3.3: Compare hash-based and tree-based implementation of dictionaries

Error with query: nsdi machine learning
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment3.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   105    101.8 MiB    101.8 MiB           1   @memory_profile
   106                                         def Compare_hash_based_and_tree_based_search():
   107    199.5 MiB     97.7 MiB           1       postings, doc_freq = load_index_in_memory("s2/")
   108                                         
   109    199.5 MiB      0.0 MiB           1       tree_profiler = time_profile.Profile()
   110    199.5 MiB      0.0 MiB           1       hash_profiler = time_profile.Profile()
   111                                         
   112    354.6 MiB    155.1 MiB           1       trie = generate_trie_indices()
   113                                         
   114                                             # Open the file and search for the term
   115    354.6 MiB      0.0 MiB           2       with open("./s2/s2_query.json") as f:
   116    354.6 MiB      0.0 MiB           1           queries = json.load(f)
   117                                         
   118    354.6 MiB      0.0 MiB           1       initial_tree_time = 0
   119    354.6 MiB      0.0 MiB           1       initial_hash_time = 0
   120                                         
   121    354.6 MiB      0.0 MiB           1       results = []
   122    354.6 MiB      0.0 MiB         101       for term in tqdm(queries["queries"]):
   123    354.6 MiB      0.0 MiB         100           logging.info(f"Query: {term['query']}")
   124                                         
   125    354.6 MiB      0.0 MiB         100           tree_profiler.enable()
   126    354.6 MiB      0.0 MiB         100           tree_result = trie.boolean_retrieval_multiple_words(term["query"])
   127    354.6 MiB      0.0 MiB         100           tree_profiler.disable()
   128    354.6 MiB      0.0 MiB         100           logging.info(f"Tree-based result: {len(tree_result)}")
   129                                         
   130    354.6 MiB      0.0 MiB         100           tree_stats = pstats.Stats(tree_profiler)
   131    354.6 MiB      0.0 MiB         100           tree_time = tree_stats.total_tt - initial_tree_time
   132    354.6 MiB      0.0 MiB         100           initial_tree_time = tree_stats.total_tt
   133                                         
   134    354.6 MiB      0.0 MiB         200           logging.info(
   135    354.6 MiB      0.0 MiB         100               f"Profiled {tree_time} seconds at {index} for {trie.boolean_retrieval_multiple_words.__name__}"
   136                                                 )
   137                                         
   138    354.6 MiB      0.0 MiB         100           hash_profiler.enable()
   139    354.6 MiB      0.0 MiB         100           try:
   140    354.6 MiB      0.0 MiB         100               output = custom_and_query(term["query"].split(" "), postings, doc_freq)
   141    354.6 MiB      0.0 MiB          99               logging.info(f"Hash-based result: {len(output)}")
   142    354.6 MiB      0.0 MiB           1           except KeyError:
   143    354.6 MiB      0.0 MiB           1               print(f"Error with query: {term['query']}")
   144    354.6 MiB      0.0 MiB         100           hash_profiler.disable()
   145                                         
   146    354.6 MiB      0.0 MiB         100           hash_stats = pstats.Stats(hash_profiler)
   147    354.6 MiB      0.0 MiB         100           hash_time = hash_stats.total_tt - initial_hash_time
   148    354.6 MiB      0.0 MiB         100           initial_hash_time = hash_stats.total_tt
   149                                         
   150    354.6 MiB      0.0 MiB         200           logging.info(
   151    354.6 MiB      0.0 MiB         100               f"Profiled {hash_time} seconds at {index} for {and_query.__name__}"
   152                                                 )
   153                                         
   154    354.6 MiB      0.0 MiB         100           results.append([term["query"], tree_time, hash_time])
   155    354.6 MiB      0.0 MiB           1       df = pd.DataFrame(results, columns=["Query", "Tree_based", "Hash_based"])
   156    355.2 MiB      0.6 MiB           1       df.to_csv("experiments/profiles/experiment3_combined.csv", index=False)


Dictionary size: 73759
