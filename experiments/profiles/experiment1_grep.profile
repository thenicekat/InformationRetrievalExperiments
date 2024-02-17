# Memory Profile

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    61     36.8 MiB     36.8 MiB           1   @memory_profile
    62                                         def grep_boolean_retrieval_memory():
    63     36.9 MiB      0.0 MiB           2       with open("s2/s2_query.json") as f:
    64     36.9 MiB      0.1 MiB         103           queries = [i["query"] for i in json.load(f)["queries"]]
    65                                             
    66     36.9 MiB      0.0 MiB           1       os.makedirs("experiments/experiment1_temp", exist_ok=True)
    67                                         
    68     36.9 MiB      0.0 MiB         101       for q in queries:
    69     36.9 MiB      0.0 MiB         100           try:
    70     36.9 MiB      0.0 MiB         100               doc_count = 0
    71     36.9 MiB      0.0 MiB         328               for keyword in q.split(" "):
    72     36.9 MiB      0.0 MiB         458                   subprocess.run(
    73     36.9 MiB      0.0 MiB         229                       f"grep '^{keyword}\s' s2/intermediate/postings.tsv > experiments/experiment1_temp/output{doc_count}.txt",
    74     36.9 MiB      0.0 MiB         229                       shell=True,
    75     36.9 MiB      0.0 MiB         229                       check=True,
    76     36.9 MiB      0.0 MiB         229                       stdout=subprocess.PIPE,
    77                                                         )
    78     36.9 MiB      0.0 MiB         228                   doc_count += 1
    79     36.9 MiB      0.0 MiB         198               subprocess.run(
    80     36.9 MiB      0.0 MiB         753                   f"cat {' '.join(f'experiments/experiment1_temp/output{i}.txt' for i in range(doc_count))} | grep -Eo '[[:alnum:]]+' | sort | uniq -c | sort -rn | sed 1q > experiments/experiment1_temp/common.txt",
    81     36.9 MiB      0.0 MiB          99                   shell=True,
    82     36.9 MiB      0.0 MiB          99                   check=True,
    83     36.9 MiB      0.0 MiB          99                   stdout=subprocess.PIPE,
    84                                                     )
    85     36.9 MiB      0.0 MiB           1           except subprocess.CalledProcessError:
    86     36.9 MiB      0.0 MiB           1               print(f"Error with query: {q}")


# Time Profile

         24508 function calls in 3.397 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    3.397    3.397 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 __init__.py:274(load)
        1    0.000    0.000    0.000    0.000 __init__.py:299(loads)
        1    0.000    0.000    0.000    0.000 codecs.py:260(__init__)
        1    0.000    0.000    0.000    0.000 codecs.py:309(__init__)
        1    0.000    0.000    0.000    0.000 codecs.py:319(decode)
      328    0.000    0.000    0.000    0.000 contextlib.py:446(_create_cb_wrapper)
      328    0.000    0.000    0.000    0.000 contextlib.py:448(_exit_wrapper)
      328    0.000    0.000    0.000    0.000 contextlib.py:452(__init__)
      328    0.001    0.000    0.001    0.000 contextlib.py:496(callback)
      328    0.000    0.000    0.000    0.000 contextlib.py:514(_push_exit_callback)
      328    0.000    0.000    0.000    0.000 contextlib.py:530(__enter__)
      328    0.001    0.000    0.001    0.000 contextlib.py:533(__exit__)
        1    0.000    0.000    0.000    0.000 decoder.py:332(decode)
        1    0.000    0.000    0.000    0.000 decoder.py:343(raw_decode)
        1    0.003    0.003    3.397    3.397 experiment1.py:35(grep_boolean_retrieval_time)
        1    0.000    0.000    0.000    0.000 experiment1.py:37(<listcomp>)
      327    0.000    0.000    0.000    0.000 experiment1.py:53(<genexpr>)
        1    0.000    0.000    0.000    0.000 genericpath.py:16(exists)
        1    0.000    0.000    0.000    0.000 genericpath.py:39(isdir)
        1    0.000    0.000    0.000    0.000 os.py:200(makedirs)
      328    0.000    0.000    0.001    0.000 os.py:805(fsencode)
        1    0.000    0.000    0.000    0.000 posixpath.py:100(split)
      656    0.002    0.000    0.004    0.000 posixpath.py:150(dirname)
      657    0.000    0.000    0.000    0.000 posixpath.py:41(_get_sep)
      328    0.000    0.000    0.000    0.000 subprocess.py:1034(__enter__)
      328    0.001    0.000    0.001    0.000 subprocess.py:1037(__exit__)
      328    0.000    0.000    0.000    0.000 subprocess.py:1065(__del__)
        1    0.000    0.000    0.000    0.000 subprocess.py:111(__init__)
      328    0.002    0.000    3.314    0.010 subprocess.py:1110(communicate)
      328    0.000    0.000    0.000    0.000 subprocess.py:1178(poll)
      656    0.001    0.000    0.009    0.000 subprocess.py:1204(wait)
      328    0.002    0.000    0.005    0.000 subprocess.py:1227(_close_pipe_fds)
      328    0.001    0.000    0.002    0.000 subprocess.py:1604(_get_handles)
      328    0.005    0.000    0.064    0.000 subprocess.py:1703(_execute_child)
      328    0.000    0.000    0.001    0.000 subprocess.py:1867(_handle_exitstatus)
      656    0.000    0.000    0.000    0.000 subprocess.py:1879(_internal_poll)
      328    0.001    0.000    0.005    0.000 subprocess.py:1914(_try_wait)
      656    0.002    0.000    0.008    0.000 subprocess.py:1927(_wait)
      328    0.000    0.000    0.000    0.000 subprocess.py:246(_cleanup)
      327    0.000    0.000    0.000    0.000 subprocess.py:436(__init__)
      328    0.002    0.000    3.393    0.010 subprocess.py:461(run)
      328    0.003    0.000    0.074    0.000 subprocess.py:758(__init__)
        1    0.000    0.000    0.000    0.000 {built-in method _codecs.utf_8_decode}
      328    0.044    0.000    0.044    0.000 {built-in method _posixsubprocess.fork_exec}
        1    0.000    0.000    0.000    0.000 {built-in method _stat.S_ISDIR}
      328    0.000    0.000    0.000    0.000 {built-in method _thread.allocate_lock}
        1    0.000    0.000    3.397    3.397 {built-in method builtins.exec}
      328    0.000    0.000    0.000    0.000 {built-in method builtins.getattr}
      328    0.001    0.000    0.001    0.000 {built-in method builtins.hasattr}
     1970    0.000    0.000    0.000    0.000 {built-in method builtins.isinstance}
      658    0.000    0.000    0.000    0.000 {built-in method builtins.len}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.print}
      328    0.001    0.000    0.001    0.000 {built-in method builtins.sorted}
      329    0.004    0.000    0.004    0.000 {built-in method io.open}
      328    0.000    0.000    0.000    0.000 {built-in method posix.WIFSTOPPED}
      984    0.001    0.000    0.001    0.000 {built-in method posix.close}
      985    0.000    0.000    0.000    0.000 {built-in method posix.fspath}
        1    0.000    0.000    0.000    0.000 {built-in method posix.mkdir}
      656    0.002    0.000    0.002    0.000 {built-in method posix.pipe}
      328    0.001    0.000    0.001    0.000 {built-in method posix.read}
        2    0.000    0.000    0.000    0.000 {built-in method posix.stat}
      328    0.004    0.000    0.004    0.000 {built-in method posix.waitpid}
      328    0.000    0.000    0.000    0.000 {built-in method posix.waitstatus_to_exitcode}
      328    0.000    0.000    0.000    0.000 {built-in method sys.audit}
      328    0.000    0.000    0.000    0.000 {built-in method sys.exc_info}
        1    0.000    0.000    0.000    0.000 {method '__exit__' of '_io._IOBase' objects}
      328    0.000    0.000    0.000    0.000 {method '__exit__' of '_thread.lock' objects}
      328    0.000    0.000    0.000    0.000 {method 'add' of 'set' objects}
      328    0.000    0.000    0.000    0.000 {method 'append' of 'collections.deque' objects}
      656    0.003    0.000    0.003    0.000 {method 'close' of '_io.BufferedReader' objects}
      328    0.000    0.000    0.000    0.000 {method 'count' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
      328    0.000    0.000    0.000    0.000 {method 'encode' of 'str' objects}
        2    0.000    0.000    0.000    0.000 {method 'end' of 're.Match' objects}
       99    0.000    0.000    0.000    0.000 {method 'join' of 'str' objects}
        2    0.000    0.000    0.000    0.000 {method 'match' of 're.Pattern' objects}
      328    0.000    0.000    0.000    0.000 {method 'pop' of 'collections.deque' objects}
      328    3.300    0.010    3.300    0.010 {method 'read' of '_io.BufferedReader' objects}
        1    0.000    0.000    0.000    0.000 {method 'read' of '_io.TextIOWrapper' objects}
      328    0.000    0.000    0.000    0.000 {method 'rfind' of 'bytes' objects}
      329    0.000    0.000    0.000    0.000 {method 'rfind' of 'str' objects}
      328    0.000    0.000    0.000    0.000 {method 'rstrip' of 'bytes' objects}
      329    0.000    0.000    0.000    0.000 {method 'rstrip' of 'str' objects}
      100    0.000    0.000    0.000    0.000 {method 'split' of 'str' objects}
        1    0.000    0.000    0.000    0.000 {method 'startswith' of 'str' objects}