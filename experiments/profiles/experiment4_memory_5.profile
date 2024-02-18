::> PART 3.4.1: PERMUTERM INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   148     74.6 MiB     74.6 MiB           1   @memory_profile
   149                                         def permuterm_trial():
   150    162.3 MiB     87.8 MiB           1       permuterm_index = generate_permuterm_indices()
   151    162.3 MiB      0.0 MiB           1       permuterm_search_on_all_terms(permuterm_index)


::> PART 3.4.2: TREE BASED INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   154     88.8 MiB     88.8 MiB           1   @memory_profile
   155                                         def trie_trial():
   156    225.0 MiB    136.2 MiB           1       trieBasedIndexFromStart, trieBasedIndexFromEnd = generate_trie_indices()
   157    225.7 MiB      0.8 MiB           2       tree_based_search(
   158    225.0 MiB      0.0 MiB           1           start_trie=trieBasedIndexFromStart, end_trie=trieBasedIndexFromEnd
   159                                             )


