Which experiment do you want to do (1-5): 
::> PART 3.1: Compare hash-based boolean retrieval with grep-based boolean retrieval

Error with query: penn treebank
Error with query: lstm
Error with query: gfdm
Error with query: wifi malware
Error with query: nsdi machine learning
Error with query: nsdi machine learning
Error with query: edx coursera
Error with query: fdir
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    83    109.2 MiB    109.2 MiB           1   @memory_profile
    84                                         def compare_grep_non_grep():
    85    206.9 MiB     97.7 MiB           1       postings, doc_freq = load_index_in_memory("s2/")
    86                                         
    87    206.9 MiB      0.0 MiB           2       with open("s2/s2_query.json") as f:
    88    206.9 MiB      0.0 MiB         103           queries = [i["query"] for i in json.load(f)["queries"]]
    89                                         
    90                                             # Temporary directory for storing the output of grep
    91    206.9 MiB      0.0 MiB           1       os.makedirs("experiments/experiment1_temp", exist_ok=True)
    92                                         
    93    206.9 MiB      0.0 MiB           1       grep_profiler = time_profile.Profile()
    94    206.9 MiB      0.0 MiB           1       non_grep_profiler = time_profile.Profile()
    95                                         
    96    206.9 MiB      0.0 MiB           1       grep_time = 0
    97    206.9 MiB      0.0 MiB           1       non_grep_time = 0
    98                                         
    99    206.9 MiB      0.0 MiB           1       results = []
   100                                         
   101    207.2 MiB      0.2 MiB         101       for query in tqdm(queries):
   102    207.2 MiB      0.0 MiB         100           logging.info(f"Query: {query}")
   103                                         
   104    207.2 MiB      0.0 MiB         100           non_grep_profiler.enable()
   105    207.2 MiB      0.0 MiB         100           non_grep_boolean_retrieval_single_query(query, postings, doc_freq)
   106    207.2 MiB      0.0 MiB         100           non_grep_profiler.disable()
   107    207.2 MiB      0.0 MiB         100           stats = pstats.Stats(non_grep_profiler)
   108    207.2 MiB      0.0 MiB         100           non_grep_current_iteration = stats.total_tt - non_grep_time
   109    207.2 MiB      0.0 MiB         100           non_grep_time = stats.total_tt
   110                                         
   111    207.2 MiB      0.0 MiB         200           logging.info(
   112    207.2 MiB      0.0 MiB         100               f"Profiled {non_grep_current_iteration} seconds at {index} for {non_grep_boolean_retrieval_single_query.__name__}"
   113                                                 )
   114                                         
   115    207.2 MiB      0.0 MiB         100           grep_profiler.enable()
   116    207.2 MiB      0.0 MiB         100           grep_boolean_retrieval_single_query(query)
   117    207.2 MiB      0.0 MiB         100           grep_profiler.disable()
   118    207.2 MiB      0.0 MiB         100           stats = pstats.Stats(grep_profiler)
   119    207.2 MiB      0.0 MiB         100           grep_current_iteration = stats.total_tt - grep_time
   120    207.2 MiB      0.0 MiB         100           grep_time = stats.total_tt
   121                                         
   122    207.2 MiB      0.0 MiB         200           logging.info(
   123    207.2 MiB      0.0 MiB         100               f"Profiled {grep_current_iteration} seconds at {index} for {grep_boolean_retrieval_single_query.__name__}"
   124                                                 )
   125                                         
   126    207.2 MiB      0.0 MiB         100           results.append([query, non_grep_current_iteration, grep_current_iteration])
   127    207.6 MiB      0.4 MiB           2       pd.DataFrame(results).to_csv(
   128    207.6 MiB      0.0 MiB           1           "experiments/profiles/experiment1_combined.csv",
   129    207.6 MiB      0.0 MiB           1           index=False,
   130    207.6 MiB      0.0 MiB           1           header=["Query", "Non-Grep Time", "Grep Time"],
   131                                             )


Dictionary size: 73759
