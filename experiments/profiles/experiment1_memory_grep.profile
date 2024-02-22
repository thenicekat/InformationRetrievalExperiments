Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.3 MiB    102.3 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.3 MiB      0.0 MiB           1       try:
    41    102.3 MiB      0.0 MiB           1           doc_count = 0
    42    102.3 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.3 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.3 MiB      0.0 MiB           4               subprocess.run(
    45    102.3 MiB      0.0 MiB           2                   command,
    46    102.3 MiB      0.0 MiB           2                   shell=True,
    47    102.3 MiB      0.0 MiB           2                   check=True,
    48    102.3 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.3 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.3 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.3 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.3 MiB      0.0 MiB           2           subprocess.run(
    56    102.3 MiB      0.0 MiB           1               command,
    57    102.3 MiB      0.0 MiB           1               shell=True,
    58    102.3 MiB      0.0 MiB           1               check=True,
    59    102.3 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.3 MiB    102.3 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.3 MiB      0.0 MiB           1       try:
    41    102.3 MiB      0.0 MiB           1           doc_count = 0
    42    102.3 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.3 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.3 MiB      0.0 MiB           4               subprocess.run(
    45    102.3 MiB      0.0 MiB           2                   command,
    46    102.3 MiB      0.0 MiB           2                   shell=True,
    47    102.3 MiB      0.0 MiB           2                   check=True,
    48    102.3 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.3 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.3 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.3 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.3 MiB      0.0 MiB           2           subprocess.run(
    56    102.3 MiB      0.0 MiB           1               command,
    57    102.3 MiB      0.0 MiB           1               shell=True,
    58    102.3 MiB      0.0 MiB           1               check=True,
    59    102.3 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Error with query: penn treebank
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61    102.5 MiB      0.0 MiB           1       except subprocess.CalledProcessError:
    62    102.5 MiB      0.0 MiB           1           print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           2           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           1               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53    102.5 MiB      0.0 MiB           1               return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           2           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           1               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53    102.5 MiB      0.0 MiB           1               return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           2           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           1               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53    102.5 MiB      0.0 MiB           1               return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Error with query: lstm
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           1           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50                                                     doc_count += 1
    51                                         
    52                                                 if doc_count == 1:
    53                                                     return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61    102.5 MiB      0.0 MiB           1       except subprocess.CalledProcessError:
    62    102.5 MiB      0.0 MiB           1           print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           2           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           1               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53    102.5 MiB      0.0 MiB           1               return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           9           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           8               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB          16               subprocess.run(
    45    102.5 MiB      0.0 MiB           8                   command,
    46    102.5 MiB      0.0 MiB           8                   shell=True,
    47    102.5 MiB      0.0 MiB           8                   check=True,
    48    102.5 MiB      0.0 MiB           8                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           8               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB          19           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Error with query: gfdm
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           1           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50                                                     doc_count += 1
    51                                         
    52                                                 if doc_count == 1:
    53                                                     return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61    102.5 MiB      0.0 MiB           1       except subprocess.CalledProcessError:
    62    102.5 MiB      0.0 MiB           1           print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           5           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           4               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           8               subprocess.run(
    45    102.5 MiB      0.0 MiB           4                   command,
    46    102.5 MiB      0.0 MiB           4                   shell=True,
    47    102.5 MiB      0.0 MiB           4                   check=True,
    48    102.5 MiB      0.0 MiB           4                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           4               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB          11           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           2           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           1               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53    102.5 MiB      0.0 MiB           1               return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           2           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           1               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53    102.5 MiB      0.0 MiB           1               return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Error with query: wifi malware
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61    102.5 MiB      0.0 MiB           1       except subprocess.CalledProcessError:
    62    102.5 MiB      0.0 MiB           1           print(f"Error with query: {query}")


Error with query: nsdi machine learning
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           1           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50                                                     doc_count += 1
    51                                         
    52                                                 if doc_count == 1:
    53                                                     return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61    102.5 MiB      0.0 MiB           1       except subprocess.CalledProcessError:
    62    102.5 MiB      0.0 MiB           1           print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           5           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           4               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           8               subprocess.run(
    45    102.5 MiB      0.0 MiB           4                   command,
    46    102.5 MiB      0.0 MiB           4                   shell=True,
    47    102.5 MiB      0.0 MiB           4                   check=True,
    48    102.5 MiB      0.0 MiB           4                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           4               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB          11           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           6           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           5               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB          10               subprocess.run(
    45    102.5 MiB      0.0 MiB           5                   command,
    46    102.5 MiB      0.0 MiB           5                   shell=True,
    47    102.5 MiB      0.0 MiB           5                   check=True,
    48    102.5 MiB      0.0 MiB           5                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           5               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB          13           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           5           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           4               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           8               subprocess.run(
    45    102.5 MiB      0.0 MiB           4                   command,
    46    102.5 MiB      0.0 MiB           4                   shell=True,
    47    102.5 MiB      0.0 MiB           4                   check=True,
    48    102.5 MiB      0.0 MiB           4                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           4               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB          11           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           5           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           4               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           8               subprocess.run(
    45    102.5 MiB      0.0 MiB           4                   command,
    46    102.5 MiB      0.0 MiB           4                   shell=True,
    47    102.5 MiB      0.0 MiB           4                   check=True,
    48    102.5 MiB      0.0 MiB           4                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           4               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB          11           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           2           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           1               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53    102.5 MiB      0.0 MiB           1               return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           2           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           1               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53    102.5 MiB      0.0 MiB           1               return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           5           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           4               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           8               subprocess.run(
    45    102.5 MiB      0.0 MiB           4                   command,
    46    102.5 MiB      0.0 MiB           4                   shell=True,
    47    102.5 MiB      0.0 MiB           4                   check=True,
    48    102.5 MiB      0.0 MiB           4                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           4               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB          11           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           2           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           1               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53    102.5 MiB      0.0 MiB           1               return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           2           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           1               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53    102.5 MiB      0.0 MiB           1               return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           5           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           4               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           8               subprocess.run(
    45    102.5 MiB      0.0 MiB           4                   command,
    46    102.5 MiB      0.0 MiB           4                   shell=True,
    47    102.5 MiB      0.0 MiB           4                   check=True,
    48    102.5 MiB      0.0 MiB           4                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           4               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB          11           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Error with query: edx coursera
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           1           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50                                                     doc_count += 1
    51                                         
    52                                                 if doc_count == 1:
    53                                                     return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61    102.5 MiB      0.0 MiB           1       except subprocess.CalledProcessError:
    62    102.5 MiB      0.0 MiB           1           print(f"Error with query: {query}")


Error with query: fdir
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           1           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50                                                     doc_count += 1
    51                                         
    52                                                 if doc_count == 1:
    53                                                     return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61    102.5 MiB      0.0 MiB           1       except subprocess.CalledProcessError:
    62    102.5 MiB      0.0 MiB           1           print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           3           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           2               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           4               subprocess.run(
    45    102.5 MiB      0.0 MiB           2                   command,
    46    102.5 MiB      0.0 MiB           2                   shell=True,
    47    102.5 MiB      0.0 MiB           2                   check=True,
    48    102.5 MiB      0.0 MiB           2                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           2               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           7           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           2           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           1               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           2               subprocess.run(
    45    102.5 MiB      0.0 MiB           1                   command,
    46    102.5 MiB      0.0 MiB           1                   shell=True,
    47    102.5 MiB      0.0 MiB           1                   check=True,
    48    102.5 MiB      0.0 MiB           1                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           1               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53    102.5 MiB      0.0 MiB           1               return
    54                                                 command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55                                                 subprocess.run(
    56                                                     command,
    57                                                     shell=True,
    58                                                     check=True,
    59                                                     stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           4           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           3               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB           6               subprocess.run(
    45    102.5 MiB      0.0 MiB           3                   command,
    46    102.5 MiB      0.0 MiB           3                   shell=True,
    47    102.5 MiB      0.0 MiB           3                   check=True,
    48    102.5 MiB      0.0 MiB           3                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           3               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB           9           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment1.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    38    102.5 MiB    102.5 MiB           1   @memory_profile
    39                                         def grep_boolean_retrieval_single_query(query: str):
    40    102.5 MiB      0.0 MiB           1       try:
    41    102.5 MiB      0.0 MiB           1           doc_count = 0
    42    102.5 MiB      0.0 MiB           6           for keyword in query.split(" "):
    43    102.5 MiB      0.0 MiB           5               command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
    44    102.5 MiB      0.0 MiB          10               subprocess.run(
    45    102.5 MiB      0.0 MiB           5                   command,
    46    102.5 MiB      0.0 MiB           5                   shell=True,
    47    102.5 MiB      0.0 MiB           5                   check=True,
    48    102.5 MiB      0.0 MiB           5                   stdout=subprocess.PIPE,
    49                                                     )
    50    102.5 MiB      0.0 MiB           5               doc_count += 1
    51                                         
    52    102.5 MiB      0.0 MiB           1           if doc_count == 1:
    53                                                     return
    54    102.5 MiB      0.0 MiB          13           command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
    55    102.5 MiB      0.0 MiB           2           subprocess.run(
    56    102.5 MiB      0.0 MiB           1               command,
    57    102.5 MiB      0.0 MiB           1               shell=True,
    58    102.5 MiB      0.0 MiB           1               check=True,
    59    102.5 MiB      0.0 MiB           1               stdout=subprocess.PIPE,
    60                                                 )
    61                                             except subprocess.CalledProcessError:
    62                                                 print(f"Error with query: {query}")


