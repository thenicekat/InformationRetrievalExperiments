# Memory profile

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    18     37.3 MiB     37.3 MiB           1   @memory_profile
    19                                         def boolean_retrieval_memory_profile():
    20     37.3 MiB      0.0 MiB           2       with open('s2/s2_query.json') as f:
    21     37.3 MiB      0.0 MiB         103           queries = [i['query'] for i in json.load(f)['queries']]
    22                                         
    23     65.9 MiB  -4042.1 MiB         101       for q in queries:
    24     65.9 MiB   -274.6 MiB         100           try:
    25    136.3 MiB   -176.4 MiB         100               and_query(q.split(' '), 's2/')
    26    136.3 MiB      0.0 MiB           1           except KeyError:
    27     62.3 MiB    -74.0 MiB           1               print(f'Error with query: {q}')

# Time profile

         181866456 function calls in 42.175 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000   42.175   42.175 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 __init__.py:274(load)
        1    0.000    0.000    0.000    0.000 __init__.py:299(loads)
      101    0.000    0.000    0.000    0.000 codecs.py:260(__init__)
      101    0.000    0.000    0.000    0.000 codecs.py:309(__init__)
   426601    0.169    0.000    0.658    0.000 codecs.py:319(decode)
        1    0.000    0.000    0.000    0.000 decoder.py:332(decode)
        1    0.000    0.000    0.000    0.000 decoder.py:343(raw_decode)
        1    1.521    1.521   42.175   42.175 experiment1.py:29(boolean_retrieval_time_profile)
        1    0.000    0.000    0.000    0.000 experiment1.py:31(<listcomp>)
      100   24.419    0.244   40.609    0.406 main.py:133(load_index_in_memory)
      128    0.030    0.000    0.039    0.000 main.py:155(intersection)
      100    0.005    0.000   40.653    0.407 main.py:173(and_query)
      228    0.000    0.000    0.000    0.000 main.py:193(<lambda>)
   426601    0.489    0.000    0.489    0.000 {built-in method _codecs.utf_8_decode}
        1    0.000    0.000   42.175   42.175 {built-in method builtins.exec}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.isinstance}
  7572225    0.370    0.000    0.370    0.000 {built-in method builtins.len}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
       99    0.000    0.000    0.000    0.000 {built-in method builtins.sorted}
      101    0.005    0.000    0.005    0.000 {built-in method io.open}
        1    0.000    0.000    0.000    0.000 {method '__exit__' of '_io._IOBase' objects}
 83035554    3.708    0.000    3.708    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        2    0.000    0.000    0.000    0.000 {method 'end' of 're.Match' objects}
       99    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}
        2    0.000    0.000    0.000    0.000 {method 'match' of 're.Pattern' objects}
        1    0.000    0.000    0.000    0.000 {method 'read' of '_io.TextIOWrapper' objects}
  7376000    7.915    0.000    7.915    0.000 {method 'split' of 'str' objects}
        1    0.000    0.000    0.000    0.000 {method 'startswith' of 'str' objects}
 83028400    3.543    0.000    3.543    0.000 {method 'strip' of 'str' objects}