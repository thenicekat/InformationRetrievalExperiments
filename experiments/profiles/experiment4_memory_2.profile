::> PART 3.4.1: PERMUTERM INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   148     80.9 MiB     80.9 MiB           1   @memory_profile
   149                                         def permuterm_trial():
   150    168.6 MiB     87.7 MiB           1       permuterm_index = generate_permuterm_indices()
   151    168.6 MiB      0.0 MiB           1       permuterm_search_on_all_terms(permuterm_index)


::> PART 3.4.2: TREE BASED INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   154     95.0 MiB     95.0 MiB           1   @memory_profile
   155                                         def trie_trial():
   156    231.8 MiB    136.8 MiB           1       trieBasedIndexFromStart, trieBasedIndexFromEnd = generate_trie_indices()
   157    232.3 MiB      0.5 MiB           2       tree_based_search(
   158    231.8 MiB      0.0 MiB           1           start_trie=trieBasedIndexFromStart, end_trie=trieBasedIndexFromEnd
   159                                             )


