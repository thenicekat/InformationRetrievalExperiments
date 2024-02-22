::> PART 3.3: Compare hash-based and tree-based implementation of dictionaries
Error with query: nsdi machine learning
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment3.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    69    105.8 MiB    105.8 MiB           1   @memory_profile
    70                                         def Compare_hash_based_and_tree_based_search():
    71    105.8 MiB      0.0 MiB           1       tree_profiler = time_profile.Profile()
    72    105.8 MiB      0.0 MiB           1       hash_profiler = time_profile.Profile()
    73                                         
    74    261.1 MiB    155.3 MiB           1       trie = generate_trie_indices()
    75                                         
    76                                             # Open the file and search for the term
    77    261.1 MiB      0.0 MiB           2       with open("./s2/s2_query.json") as f:
    78    261.1 MiB      0.0 MiB           1           queries = json.load(f)
    79                                         
    80    261.1 MiB      0.0 MiB           1       initial_tree_time = 0
    81    261.1 MiB      0.0 MiB           1       initial_hash_time = 0
    82                                         
    83    261.1 MiB      0.0 MiB           1       results = []
    84    324.3 MiB   -142.6 MiB         101       for term in tqdm(queries["queries"]):
    85    323.3 MiB   -142.6 MiB         100           logging.info(f"Query: {term['query']}")
    86                                         
    87    323.3 MiB   -142.6 MiB         100           tree_profiler.enable()
    88    323.3 MiB   -142.6 MiB         100           tree_result = trie.boolean_retrieval_multiple_words(term["query"])
    89    323.3 MiB   -142.6 MiB         100           tree_profiler.disable()
    90    323.3 MiB   -142.6 MiB         100           logging.info(f"Tree-based result: {len(tree_result)}")
    91                                         
    92    323.3 MiB   -142.6 MiB         100           tree_stats = pstats.Stats(tree_profiler)
    93    323.3 MiB   -142.6 MiB         100           tree_time = tree_stats.total_tt - initial_tree_time
    94    323.3 MiB   -142.6 MiB         100           initial_tree_time = tree_stats.total_tt
    95                                         
    96    323.3 MiB   -285.1 MiB         200           logging.info(
    97    323.3 MiB   -142.6 MiB         100               f"Profiled {tree_time} seconds at {index} for {trie.boolean_retrieval_multiple_words.__name__}"
    98                                                 )
    99                                         
   100    323.3 MiB   -142.6 MiB         100           hash_profiler.enable()
   101                                         
   102    323.3 MiB   -142.6 MiB         100           try:
   103    354.3 MiB    -20.3 MiB         100               output = and_query(term["query"].split(" "), "s2/")
   104    324.3 MiB  -2357.5 MiB          99               logging.info(f"Hash-based result: {len(output)}")
   105    354.3 MiB      0.0 MiB           1           except KeyError:
   106    295.2 MiB    -59.1 MiB           1               print(f"Error with query: {term['query']}")
   107                                         
   108    324.3 MiB   -140.9 MiB         100           hash_profiler.disable()
   109                                         
   110    324.3 MiB   -142.6 MiB         100           hash_stats = pstats.Stats(hash_profiler)
   111    324.3 MiB   -142.6 MiB         100           hash_time = hash_stats.total_tt - initial_hash_time
   112    324.3 MiB   -142.6 MiB         100           initial_hash_time = hash_stats.total_tt
   113                                         
   114    324.3 MiB   -285.1 MiB         200           logging.info(
   115    324.3 MiB   -142.6 MiB         100               f"Profiled {hash_time} seconds at {index} for {and_query.__name__}"
   116                                                 )
   117                                         
   118    324.3 MiB   -142.6 MiB         100           results.append([term["query"], tree_time, hash_time])
   119    324.3 MiB      0.0 MiB           1       df = pd.DataFrame(results, columns=["Query", "Tree_based", "Hash_based"])
   120    318.4 MiB     -6.0 MiB           1       df.to_csv("experiment3_combined.csv", index=False)


