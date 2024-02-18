::> PART 3.4.1: PERMUTERM INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   156     75.0 MiB     75.0 MiB           1   @memory_profile
   157                                         def permuterm_trial():
   158    173.0 MiB     98.0 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   159                                             # Here postings is the inverted index
   160                                             # term_freq is the term frequency of each term in the collection
   161    250.9 MiB     78.0 MiB           1       permuterm_index = generate_permuterm_indices(term_freq=term_freq)
   162    251.2 MiB      0.2 MiB           1       permuterm_search_on_all_terms(permuterm_index, postings)


         24028208 function calls (24027059 primitive calls) in 26.167 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        3    0.000    0.000    0.000    0.000 <frozen codecs>:260(__init__)
        3    0.000    0.000    0.000    0.000 <frozen codecs>:309(__init__)
     4279    0.019    0.000    0.027    0.000 <frozen codecs>:319(decode)
       60    0.000    0.000    0.000    0.000 <frozen genericpath>:121(_splitext)
      728    0.001    0.000    0.003    0.000 <frozen genericpath>:16(exists)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:100(acquire)
       12    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:1026(__enter__)
       12    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:1030(__exit__)
        3    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap>:1054(_find_spec)
      3/1    0.000    0.000    0.004    0.004 <frozen importlib._bootstrap>:1120(_find_and_load_unlocked)
      3/1    0.000    0.000    0.004    0.004 <frozen importlib._bootstrap>:1165(_find_and_load)
      5/4    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap>:1207(_handle_fromlist)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:125(release)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:165(__init__)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:169(__enter__)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:173(__exit__)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:179(_get_module_lock)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:198(cb)
      8/2    0.000    0.000    0.002    0.001 <frozen importlib._bootstrap>:233(_call_with_frames_removed)
       28    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:244(_verbose_message)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:357(__init__)
        5    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:392(cached)
        8    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:405(parent)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:413(has_location)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:48(_new_module)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:493(_init_module_attrs)
        3    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap>:566(module_from_spec)
      3/1    0.000    0.000    0.003    0.003 <frozen importlib._bootstrap>:666(_load_unlocked)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:71(__init__)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:748(find_spec)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:920(find_spec)
        2    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap_external>:1007(get_code)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1097(__init__)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1122(get_filename)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1127(get_data)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1146(path_stats)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1220(__init__)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1231(create_module)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1239(exec_module)
       23    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:126(_path_join)
       23    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:128(<listcomp>)
        4    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:132(_path_split)
        8    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:134(<genexpr>)
       10    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:140(_path_stat)
        6    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1421(_path_importer_cache)
        3    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap_external>:1464(_get_spec)
        3    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap_external>:1496(find_spec)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:150(_path_is_mode_type)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:159(_path_isfile)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1599(_get_spec)
        5    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap_external>:1604(find_spec)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:180(_path_isabs)
        4    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:437(cache_from_source)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:567(_get_cached)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:599(_check_name_wrapper)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:642(_classify_pyc)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:675(_validate_timestamp_pyc)
        5    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:71(_relax_case)
        2    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap_external>:727(_compile_bytecode)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:778(spec_from_file_location)
        6    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:84(_unpack_uint32)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:931(create_module)
      2/1    0.000    0.000    0.003    0.003 <frozen importlib._bootstrap_external>:934(exec_module)
       60    0.000    0.000    0.001    0.000 <frozen posixpath>:117(splitext)
       60    0.000    0.000    0.001    0.000 <frozen posixpath>:140(basename)
     1551    0.001    0.000    0.003    0.000 <frozen posixpath>:389(normpath)
     1551    0.002    0.000    0.008    0.000 <frozen posixpath>:397(abspath)
     8716    0.003    0.000    0.005    0.000 <frozen posixpath>:41(_get_sep)
      775    0.001    0.000    0.053    0.000 <frozen posixpath>:412(realpath)
      775    0.014    0.000    0.047    0.000 <frozen posixpath>:421(_joinrealpath)
     1016    0.001    0.000    0.001    0.000 <frozen posixpath>:52(normcase)
     2326    0.002    0.000    0.004    0.000 <frozen posixpath>:60(isabs)
     6330    0.012    0.000    0.019    0.000 <frozen posixpath>:71(join)
       42    0.000    0.000    0.000    0.000 <string>:1(<lambda>)
        1    0.000    0.000   26.167   26.167 <string>:1(<module>)
       60    0.001    0.000    0.007    0.000 __init__.py:1087(flush)
       60    0.001    0.000    0.011    0.000 __init__.py:1098(emit)
       60    0.000    0.000    0.012    0.000 __init__.py:1216(emit)
       60    0.000    0.000    0.000    0.000 __init__.py:123(getLevelName)
        1    0.000    0.000    0.000    0.000 __init__.py:1319(disable)
       60    0.001    0.000    0.027    0.000 __init__.py:1479(info)
       60    0.001    0.000    0.003    0.000 __init__.py:1561(findCaller)
       60    0.001    0.000    0.007    0.000 __init__.py:1595(makeRecord)
       60    0.001    0.000    0.026    0.000 __init__.py:1610(_log)
       60    0.000    0.000    0.015    0.000 __init__.py:1636(handle)
       60    0.000    0.000    0.000    0.000 __init__.py:164(<lambda>)
       60    0.001    0.000    0.014    0.000 __init__.py:1690(callHandlers)
        1    0.000    0.000    0.000    0.000 __init__.py:1720(getEffectiveLevel)
       60    0.000    0.000    0.000    0.000 __init__.py:1734(isEnabledFor)
      240    0.001    0.000    0.001    0.000 __init__.py:194(_is_internal_frame)
       60    0.001    0.000    0.028    0.000 __init__.py:2140(info)
        2    0.000    0.000    0.008    0.004 __init__.py:225(compile)
        1    0.000    0.000    0.000    0.000 __init__.py:228(_acquireLock)
        1    0.000    0.000    0.000    0.000 __init__.py:237(_releaseLock)
        2    0.000    0.000    0.008    0.004 __init__.py:272(_compile)
        1    0.000    0.000    0.000    0.000 __init__.py:274(load)
       60    0.003    0.000    0.006    0.000 __init__.py:292(__init__)
        1    0.000    0.000    0.000    0.000 __init__.py:299(loads)
       60    0.000    0.000    0.000    0.000 __init__.py:368(getMessage)
       60    0.000    0.000    0.000    0.000 __init__.py:432(usesTime)
       60    0.000    0.000    0.000    0.000 __init__.py:440(_format)
       60    0.000    0.000    0.001    0.000 __init__.py:447(format)
       60    0.000    0.000    0.002    0.000 __init__.py:606(formatTime)
       60    0.000    0.000    0.000    0.000 __init__.py:652(usesTime)
       60    0.000    0.000    0.001    0.000 __init__.py:658(formatMessage)
       60    0.001    0.000    0.004    0.000 __init__.py:674(format)
      120    0.001    0.000    0.001    0.000 __init__.py:815(filter)
        3    0.000    0.000    0.000    0.000 __init__.py:89(find_spec)
      120    0.000    0.000    0.000    0.000 __init__.py:922(acquire)
      120    0.000    0.000    0.000    0.000 __init__.py:929(release)
       60    0.000    0.000    0.004    0.000 __init__.py:942(format)
        1    0.000    0.000    0.000    0.000 __init__.py:96(<lambda>)
       60    0.001    0.000    0.013    0.000 __init__.py:965(handle)
       59    0.000    0.000    0.000    0.000 _compiler.py:214(_compile_charset)
       59    0.000    0.000    0.000    0.000 _compiler.py:241(_optimize_charset)
       26    0.000    0.000    0.000    0.000 _compiler.py:31(_combine_flags)
    280/2    0.001    0.000    0.002    0.001 _compiler.py:37(_compile)
        6    0.000    0.000    0.000    0.000 _compiler.py:384(_mk_bitmap)
        6    0.000    0.000    0.000    0.000 _compiler.py:386(<listcomp>)
       62    0.000    0.000    0.000    0.000 _compiler.py:396(_simple)
        2    0.000    0.000    0.000    0.000 _compiler.py:426(_get_iscased)
        1    0.000    0.000    0.000    0.000 _compiler.py:434(_get_literal_prefix)
        1    0.000    0.000    0.000    0.000 _compiler.py:465(_get_charset_prefix)
        2    0.000    0.000    0.000    0.000 _compiler.py:509(_compile_info)
        4    0.000    0.000    0.000    0.000 _compiler.py:568(isstring)
        2    0.000    0.000    0.002    0.001 _compiler.py:571(_code)
        2    0.000    0.000    0.008    0.004 _compiler.py:738(compile)
        1    0.000    0.000    0.001    0.001 _monitor.py:30(__init__)
      305    0.000    0.000    0.000    0.000 _parser.py:109(__init__)
      478    0.000    0.000    0.000    0.000 _parser.py:160(__len__)
     1537    0.001    0.000    0.001    0.000 _parser.py:164(__getitem__)
       63    0.000    0.000    0.000    0.000 _parser.py:168(__setitem__)
      443    0.000    0.000    0.000    0.000 _parser.py:172(append)
   306/29    0.001    0.000    0.001    0.000 _parser.py:174(getwidth)
        2    0.000    0.000    0.000    0.000 _parser.py:224(__init__)
      949    0.000    0.000    0.000    0.000 _parser.py:233(__next)
      572    0.000    0.000    0.000    0.000 _parser.py:249(match)
      667    0.000    0.000    0.000    0.000 _parser.py:254(get)
      214    0.000    0.000    0.000    0.000 _parser.py:286(tell)
       12    0.000    0.000    0.000    0.000 _parser.py:309(_class_escape)
       55    0.000    0.000    0.000    0.000 _parser.py:369(_escape)
       51    0.000    0.000    0.000    0.000 _parser.py:446(_uniq)
     52/2    0.000    0.000    0.005    0.003 _parser.py:449(_parse_sub)
    221/5    0.002    0.000    0.005    0.001 _parser.py:509(_parse)
        2    0.000    0.000    0.000    0.000 _parser.py:73(__init__)
       57    0.000    0.000    0.000    0.000 _parser.py:79(groups)
       26    0.000    0.000    0.000    0.000 _parser.py:82(opengroup)
       26    0.000    0.000    0.001    0.000 _parser.py:94(closegroup)
        2    0.000    0.000    0.000    0.000 _parser.py:956(fix_flags)
        2    0.000    0.000    0.005    0.003 _parser.py:972(parse)
        1    0.000    0.000    0.000    0.000 _weakrefset.py:110(remove)
        2    0.000    0.000    0.000    0.000 _weakrefset.py:17(__init__)
        2    0.000    0.000    0.000    0.000 _weakrefset.py:21(__enter__)
        2    0.000    0.000    0.000    0.000 _weakrefset.py:27(__exit__)
        2    0.000    0.000    0.000    0.000 _weakrefset.py:53(_commit_removals)
        3    0.000    0.000    0.000    0.000 _weakrefset.py:63(__iter__)
        2    0.000    0.000    0.000    0.000 _weakrefset.py:85(add)
        1    0.000    0.000    0.000    0.000 context.py:197(get_start_method)
        1    0.000    0.000    0.000    0.000 context.py:237(get_context)
        1    0.000    0.000    0.005    0.005 context.py:70(RLock)
        1    0.000    0.000    0.000    0.000 contextlib.py:104(__init__)
        1    0.000    0.000    0.000    0.000 contextlib.py:132(__enter__)
        1    0.000    0.000    0.000    0.000 contextlib.py:141(__exit__)
        1    0.000    0.000    0.000    0.000 contextlib.py:287(helper)
        1    0.000    0.000    0.000    0.000 coroutines.py:21(iscoroutinefunction)
        1    0.000    0.000    0.000    0.000 decoder.py:332(decode)
        1    0.000    0.000    0.000    0.000 decoder.py:343(raw_decode)
        4    0.000    0.000    0.000    0.000 enum.py:1091(__new__)
        1    0.000    0.000    0.000    0.000 enum.py:1249(value)
        4    0.000    0.000    0.000    0.000 enum.py:1509(__and__)
        1    0.000    0.000    0.000    0.000 enum.py:193(__get__)
        4    0.000    0.000    0.000    0.000 enum.py:686(__call__)
        1    0.001    0.001   26.037   26.037 experiment4.py:156(permuterm_trial)
        1    1.498    1.498    1.510    1.510 experiment4.py:55(generate_permuterm_indices)
       30   18.813    0.627   22.698    0.757 experiment4.py:69(permuterm_search_on_one_term)
        1    0.003    0.003   22.771   22.771 experiment4.py:88(permuterm_search_on_all_terms)
        1    0.000    0.000    0.000    0.000 functools.py:393(__get__)
        1    0.000    0.000    0.000    0.000 functools.py:421(_unwrap_partial)
        1    0.000    0.000    0.075    0.075 inspect.py:1055(findsource)
        1    0.000    0.000    0.000    0.000 inspect.py:1172(__init__)
       42    0.000    0.000    0.000    0.000 inspect.py:1181(tokeneater)
        1    0.000    0.000    0.008    0.008 inspect.py:1224(getblock)
        1    0.000    0.000    0.083    0.083 inspect.py:1235(getsourcelines)
     1636    0.001    0.000    0.001    0.000 inspect.py:283(ismodule)
        2    0.000    0.000    0.000    0.000 inspect.py:292(isclass)
        3    0.000    0.000    0.000    0.000 inspect.py:300(ismethod)
        3    0.000    0.000    0.000    0.000 inspect.py:378(isfunction)
        1    0.000    0.000    0.000    0.000 inspect.py:391(_has_code_flag)
        1    0.000    0.000    0.000    0.000 inspect.py:409(iscoroutinefunction)
        3    0.000    0.000    0.000    0.000 inspect.py:456(istraceback)
        3    0.000    0.000    0.000    0.000 inspect.py:466(isframe)
        5    0.000    0.000    0.000    0.000 inspect.py:480(iscode)
        1    0.000    0.000    0.000    0.000 inspect.py:735(unwrap)
        1    0.000    0.000    0.000    0.000 inspect.py:752(_is_wrapper)
      825    0.001    0.000    0.001    0.000 inspect.py:896(getfile)
      776    0.002    0.000    0.011    0.000 inspect.py:936(getsourcefile)
     2328    0.001    0.000    0.001    0.000 inspect.py:943(<genexpr>)
     3008    0.001    0.000    0.001    0.000 inspect.py:946(<genexpr>)
      776    0.001    0.000    0.017    0.000 inspect.py:961(getabsfile)
        1    0.003    0.003    0.074    0.074 inspect.py:973(getmodule)
        2    0.000    0.000    0.000    0.000 linecache.py:36(getlines)
        1    0.000    0.000    0.000    0.000 linecache.py:52(checkcache)
        1    0.000    0.000    0.000    0.000 linecache.py:80(updatecache)
        1    1.401    1.401    1.755    1.755 main.py:133(load_index_in_memory)
        1    0.000    0.000   26.167   26.167 memory_profiler.py:1185(wrapper)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:1201(choose_backend)
        6    0.000    0.000    0.000    0.000 memory_profiler.py:1215(<genexpr>)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:640(__init__)
        1    0.000    0.000    0.083    0.083 memory_profiler.py:645(add)
        2    0.000    0.000    0.000    0.000 memory_profiler.py:689(items)
        8    0.000    0.000    0.000    0.000 memory_profiler.py:695(<genexpr>)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:702(__init__)
        1    0.000    0.000    0.083    0.083 memory_profiler.py:713(__call__)
        1    0.000    0.000    0.083    0.083 memory_profiler.py:728(add_function)
        2    0.000    0.000    0.000    0.000 memory_profiler.py:740(_count_ctxmgr)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:748(wrap_function)
        1    0.047    0.047   26.084   26.084 memory_profiler.py:759(f)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:775(enable_by_count)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:782(disable_by_count)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:842(enable)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:849(disable)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:853(show_results)
       60    0.000    0.000    0.000    0.000 process.py:189(name)
       61    0.000    0.000    0.000    0.000 process.py:37(current_process)
        1    0.000    0.000    0.000    0.000 random.py:119(__init__)
        1    0.000    0.000    0.000    0.000 random.py:128(seed)
        1    0.000    0.000    0.000    0.000 random.py:480(choices)
        1    0.000    0.000    0.000    0.000 random.py:493(<listcomp>)
       35    0.000    0.000    0.000    0.000 std.py:102(acquire)
       35    0.000    0.000    0.000    0.000 std.py:106(release)
        4    0.000    0.000    0.000    0.000 std.py:110(__enter__)
        4    0.000    0.000    0.000    0.000 std.py:113(__exit__)
        1    0.000    0.000    0.000    0.000 std.py:1147(__del__)
       32    0.001    0.000    0.022    0.001 std.py:1150(__str__)
        2    0.000    0.000    0.000    0.000 std.py:1153(_comparable)
        2    0.000    0.000    0.000    0.000 std.py:1157(__hash__)
        1    0.000    0.000    0.005    0.005 std.py:116(create_mp_lock)
       31    0.001    0.000    0.035    0.001 std.py:1160(__iter__)
       30    0.001    0.000    0.033    0.001 std.py:1198(update)
        2    0.000    0.000    0.001    0.000 std.py:1265(close)
        2    0.000    0.000    0.000    0.000 std.py:1286(fp_write)
        1    0.000    0.000    0.000    0.000 std.py:1301(<lambda>)
       31    0.000    0.000    0.032    0.001 std.py:1325(refresh)
       32    0.001    0.000    0.001    0.000 std.py:1446(format_dict)
       32    0.001    0.000    0.032    0.001 std.py:1464(display)
       32    0.000    0.000    0.000    0.000 std.py:153(__init__)
       32    0.000    0.000    0.000    0.000 std.py:163(colour)
       32    0.000    0.000    0.000    0.000 std.py:167(colour)
       32    0.000    0.000    0.001    0.000 std.py:186(__format__)
        3    0.000    0.000    0.000    0.000 std.py:226(__init__)
      181    0.001    0.000    0.001    0.000 std.py:231(__call__)
       63    0.001    0.000    0.001    0.000 std.py:400(format_interval)
        1    0.000    0.000    0.000    0.000 std.py:438(status_printer)
       32    0.000    0.000    0.003    0.000 std.py:451(fp_write)
       32    0.000    0.000    0.009    0.000 std.py:457(print_status)
       32    0.007    0.000    0.020    0.001 std.py:464(format_meter)
        1    0.000    0.000    0.005    0.005 std.py:663(__new__)
        1    0.000    0.000    0.000    0.000 std.py:679(_get_free_pos)
        1    0.000    0.000    0.000    0.000 std.py:682(<setcomp>)
        1    0.000    0.000    0.000    0.000 std.py:686(_decr_instances)
        1    0.000    0.000    0.005    0.005 std.py:760(get_lock)
        1    0.000    0.000    0.005    0.005 std.py:90(__init__)
        1    0.000    0.000    0.001    0.001 std.py:952(__init__)
        1    0.000    0.000    0.000    0.000 std.py:98(<listcomp>)
        1    0.000    0.000    0.002    0.002 synchronize.py:1(<module>)
        1    0.000    0.000    0.000    0.000 synchronize.py:119(_make_name)
        1    0.000    0.000    0.000    0.000 synchronize.py:128(Semaphore)
        1    0.000    0.000    0.000    0.000 synchronize.py:147(BoundedSemaphore)
        1    0.000    0.000    0.000    0.000 synchronize.py:164(Lock)
        1    0.000    0.000    0.000    0.000 synchronize.py:189(RLock)
        1    0.000    0.000    0.000    0.000 synchronize.py:191(__init__)
        1    0.000    0.000    0.000    0.000 synchronize.py:215(Condition)
        1    0.000    0.000    0.000    0.000 synchronize.py:326(Event)
        1    0.000    0.000    0.000    0.000 synchronize.py:368(Barrier)
        1    0.000    0.000    0.000    0.000 synchronize.py:46(SemLock)
        1    0.000    0.000    0.000    0.000 synchronize.py:50(__init__)
        1    0.000    0.000    0.000    0.000 synchronize.py:90(_make_methods)
        1    0.000    0.000    0.000    0.000 tempfile.py:142(rng)
        1    0.000    0.000    0.000    0.000 tempfile.py:153(__next__)
       60    0.000    0.000    0.000    0.000 threading.py:1145(name)
        1    0.000    0.000    0.000    0.000 threading.py:1199(daemon)
        1    0.000    0.000    0.000    0.000 threading.py:1214(daemon)
        1    0.000    0.000    0.000    0.000 threading.py:1317(_make_invoke_excepthook)
       61    0.000    0.000    0.000    0.000 threading.py:1446(current_thread)
        2    0.000    0.000    0.000    0.000 threading.py:236(__init__)
        1    0.000    0.000    0.000    0.000 threading.py:264(__enter__)
        1    0.000    0.000    0.000    0.000 threading.py:267(__exit__)
        1    0.000    0.000    0.000    0.000 threading.py:273(_release_save)
        1    0.000    0.000    0.000    0.000 threading.py:276(_acquire_restore)
        1    0.000    0.000    0.000    0.000 threading.py:279(_is_owned)
        1    0.000    0.000    0.000    0.000 threading.py:288(wait)
        2    0.000    0.000    0.000    0.000 threading.py:555(__init__)
        2    0.000    0.000    0.000    0.000 threading.py:568(is_set)
        1    0.000    0.000    0.000    0.000 threading.py:604(wait)
        1    0.000    0.000    0.000    0.000 threading.py:804(_newname)
        1    0.000    0.000    0.000    0.000 threading.py:849(__init__)
        1    0.000    0.000    0.000    0.000 threading.py:938(start)
        1    0.000    0.000    0.000    0.000 tokenize.py:299(detect_encoding)
        1    0.000    0.000    0.000    0.000 tokenize.py:323(read_or_stop)
        1    0.000    0.000    0.000    0.000 tokenize.py:329(find_cookie)
        1    0.000    0.000    0.000    0.000 tokenize.py:392(open)
       43    0.000    0.000    0.007    0.000 tokenize.py:433(_tokenize)
        1    0.000    0.000    0.000    0.000 tokenize.py:616(generate_tokens)
        1    0.000    0.000    0.007    0.007 tokenize.py:99(_compile)
      4/2    0.000    0.000    0.000    0.000 typing.py:3350(__getattribute__)
        1    0.000    0.000    0.000    0.000 util.py:1(<module>)
        1    0.000    0.000    0.000    0.000 util.py:108(_platform_supports_abstract_sockets)
        1    0.000    0.000    0.000    0.000 util.py:171(register_after_fork)
        1    0.000    0.000    0.000    0.000 util.py:182(Finalize)
        1    0.000    0.000    0.000    0.000 util.py:368(ForkAwareThreadLock)
        1    0.000    0.000    0.000    0.000 util.py:385(ForkAwareLocal)
        1    0.000    0.000    0.000    0.000 util.py:48(debug)
       32    0.000    0.000    0.000    0.000 utils.py:108(__init__)
       32    0.000    0.000    0.000    0.000 utils.py:112(__format__)
        1    0.000    0.000    0.000    0.000 utils.py:125(__eq__)
        2    0.000    0.000    0.000    0.000 utils.py:139(__getattr__)
        3    0.000    0.000    0.000    0.000 utils.py:152(wrapper_setattr)
        1    0.000    0.000    0.000    0.000 utils.py:156(__init__)
        2    0.000    0.000    0.000    0.000 utils.py:187(disable_on_exception)
       66    0.000    0.000    0.002    0.000 utils.py:194(inner)
        1    0.000    0.000    0.000    0.000 utils.py:213(__init__)
        2    0.000    0.000    0.000    0.000 utils.py:222(__eq__)
        1    0.000    0.000    0.000    0.000 utils.py:252(_is_utf)
        1    0.000    0.000    0.000    0.000 utils.py:266(_supports_unicode)
       64    0.001    0.000    0.001    0.000 utils.py:273(_is_ascii)
        1    0.000    0.000    0.000    0.000 utils.py:282(_screen_shape_wrapper)
        1    0.000    0.000    0.000    0.000 utils.py:333(_screen_shape_linux)
       96    0.000    0.000    0.015    0.000 utils.py:374(_text_width)
     9390    0.009    0.000    0.011    0.000 utils.py:375(<genexpr>)
       96    0.000    0.000    0.016    0.000 utils.py:378(disp_len)
       32    0.000    0.000    0.007    0.000 utils.py:386(disp_trim)
        1    0.000    0.000    0.000    0.000 weakref.py:104(__init__)
        1    0.000    0.000    0.000    0.000 weakref.py:164(__setitem__)
        1    0.000    0.000    0.000    0.000 weakref.py:289(update)
        1    0.000    0.000    0.000    0.000 weakref.py:347(__new__)
        1    0.000    0.000    0.000    0.000 weakref.py:352(__init__)
       44    0.000    0.000    0.000    0.000 {built-in method __new__ of type object at 0x860f60}
     4279    0.008    0.000    0.008    0.000 {built-in method _codecs.utf_8_decode}
        2    0.000    0.000    0.000    0.000 {built-in method _imp._fix_co_filename}
       18    0.000    0.000    0.000    0.000 {built-in method _imp.acquire_lock}
        1    0.000    0.000    0.000    0.000 {built-in method _imp.create_dynamic}
        1    0.000    0.000    0.000    0.000 {built-in method _imp.exec_dynamic}
        3    0.000    0.000    0.000    0.000 {built-in method _imp.find_frozen}
        3    0.000    0.000    0.000    0.000 {built-in method _imp.is_builtin}
       18    0.000    0.000    0.000    0.000 {built-in method _imp.release_lock}
        2    0.000    0.000    0.000    0.000 {built-in method _sre.compile}
     6330    0.001    0.000    0.001    0.000 {built-in method _stat.S_ISLNK}
        9    0.000    0.000    0.000    0.000 {built-in method _thread.allocate_lock}
      127    0.000    0.000    0.000    0.000 {built-in method _thread.get_ident}
        1    0.000    0.000    0.000    0.000 {built-in method _thread.start_new_thread}
        2    0.000    0.000    0.000    0.000 {built-in method _weakref.proxy}
        2    0.000    0.000    0.000    0.000 {built-in method atexit.register}
       11    0.000    0.000    0.000    0.000 {built-in method builtins.__build_class__}
        1    0.000    0.000    0.001    0.001 {built-in method builtins.__import__}
       34    0.000    0.000    0.000    0.000 {built-in method builtins.abs}
     1552    0.002    0.000    0.004    0.000 {built-in method builtins.any}
      158    0.000    0.000    0.000    0.000 {built-in method builtins.divmod}
      3/1    0.000    0.000   26.167   26.167 {built-in method builtins.exec}
      858    0.000    0.000    0.000    0.000 {built-in method builtins.getattr}
     1015    0.001    0.000    0.001    0.000 {built-in method builtins.hasattr}
        4    0.000    0.000    0.000    0.000 {built-in method builtins.id}
    14397    0.002    0.000    0.002    0.000 {built-in method builtins.isinstance}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.iter}
150097/149787    0.019    0.000    0.019    0.000 {built-in method builtins.len}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.locals}
      257    0.000    0.000    0.000    0.000 {built-in method builtins.max}
      751    0.000    0.000    0.000    0.000 {built-in method builtins.min}
        4    0.000    0.000    0.000    0.000 {built-in method builtins.next}
     1062    0.000    0.000    0.000    0.000 {built-in method builtins.ord}
        2    0.000    0.000    0.000    0.000 {built-in method builtins.setattr}
       96    0.004    0.000    0.015    0.000 {built-in method builtins.sum}
        1    0.000    0.000    0.000    0.000 {built-in method fcntl.ioctl}
        6    0.000    0.000    0.000    0.000 {built-in method from_bytes}
       51    0.000    0.000    0.000    0.000 {built-in method fromkeys}
        1    0.000    0.000    0.000    0.000 {built-in method fromtimestamp}
        2    0.000    0.000    0.000    0.000 {built-in method io.open_code}
        3    0.000    0.000    0.000    0.000 {built-in method io.open}
        2    0.000    0.000    0.000    0.000 {built-in method marshal.loads}
        8    0.000    0.000    0.000    0.000 {built-in method math.floor}
       31    0.000    0.000    0.000    0.000 {built-in method now}
     1551    0.001    0.000    0.001    0.000 {built-in method posix._path_normpath}
    13676    0.002    0.000    0.002    0.000 {built-in method posix.fspath}
       61    0.000    0.000    0.000    0.000 {built-in method posix.getpid}
     6330    0.011    0.000    0.011    0.000 {built-in method posix.lstat}
      739    0.003    0.000    0.003    0.000 {built-in method posix.stat}
        1    0.000    0.000    0.000    0.000 {built-in method posix.sysconf}
       60    0.000    0.000    0.000    0.000 {built-in method sys._getframe}
        1    0.000    0.000    0.000    0.000 {built-in method sys.getrecursionlimit}
        1    0.000    0.000    0.000    0.000 {built-in method sys.gettrace}
        2    0.000    0.000    0.000    0.000 {built-in method sys.settrace}
       60    0.001    0.000    0.001    0.000 {built-in method time.localtime}
       60    0.000    0.000    0.000    0.000 {built-in method time.strftime}
      182    0.000    0.000    0.000    0.000 {built-in method time.time}
     9294    0.002    0.000    0.002    0.000 {built-in method unicodedata.east_asian_width}
        1    0.000    0.000    0.000    0.000 {function Random.seed at 0x7f708b941580}
        1    0.000    0.000    0.000    0.000 {method '__enter__' of '_thread.lock' objects}
        4    0.000    0.000    0.000    0.000 {method '__exit__' of '_io._IOBase' objects}
        1    0.000    0.000    0.000    0.000 {method '__exit__' of '_thread.RLock' objects}
        7    0.000    0.000    0.000    0.000 {method '__exit__' of '_thread.lock' objects}
       35    0.000    0.000    0.000    0.000 {method 'acquire' of '_multiprocessing.SemLock' objects}
      157    0.000    0.000    0.000    0.000 {method 'acquire' of '_thread.RLock' objects}
        4    0.000    0.000    0.000    0.000 {method 'acquire' of '_thread.lock' objects}
    43393    0.009    0.000    0.009    0.000 {method 'add' of 'set' objects}
        1    0.000    0.000    0.000    0.000 {method 'append' of 'collections.deque' objects}
   833406    0.074    0.000    0.074    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'copy' of 'dict' objects}
        1    0.000    0.000    0.000    0.000 {method 'decode' of 'bytes' objects}
        1    0.000    0.000    0.000    0.000 {method 'difference' of 'set' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 {method 'encode' of 'str' objects}
        2    0.000    0.000    0.000    0.000 {method 'end' of 're.Match' objects}
    10120    0.002    0.000    0.002    0.000 {method 'endswith' of 'str' objects}
        8    0.000    0.000    0.000    0.000 {method 'extend' of 'list' objects}
      201    0.000    0.000    0.000    0.000 {method 'find' of 'bytearray' objects}
       60    0.000    0.000    0.000    0.000 {method 'find' of 'str' objects}
       94    0.006    0.000    0.006    0.000 {method 'flush' of '_io.TextIOWrapper' objects}
       83    0.001    0.000    0.001    0.000 {method 'format' of 'str' objects}
     1034    0.000    0.000    0.000    0.000 {method 'get' of 'dict' objects}
        6    0.000    0.000    0.000    0.000 {method 'insert' of 'list' objects}
       28    0.000    0.000    0.000    0.000 {method 'isidentifier' of 'str' objects}
        5    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}
       28    0.000    0.000    0.000    0.000 {method 'join' of 'str' objects}
       39    0.000    0.000    0.000    0.000 {method 'match' of 're.Pattern' objects}
     6330    0.002    0.000    0.002    0.000 {method 'partition' of 'str' objects}
        3    0.000    0.000    0.000    0.000 {method 'pop' of 'dict' objects}
        5    0.000    0.000    0.000    0.000 {method 'pop' of 'list' objects}
        8    0.000    0.000    0.000    0.000 {method 'random' of '_random.Random' objects}
        2    0.000    0.000    0.000    0.000 {method 'read' of '_io.BufferedReader' objects}
        1    0.000    0.000    0.000    0.000 {method 'read' of '_io.TextIOWrapper' objects}
        1    0.000    0.000    0.000    0.000 {method 'readline' of '_io.BufferedReader' objects}
        1    0.000    0.000    0.000    0.000 {method 'readlines' of '_io._IOBase' objects}
       35    0.000    0.000    0.000    0.000 {method 'release' of '_multiprocessing.SemLock' objects}
      157    0.000    0.000    0.000    0.000 {method 'release' of '_thread.RLock' objects}
        1    0.000    0.000    0.000    0.000 {method 'release' of '_thread.lock' objects}
        3    0.000    0.000    0.000    0.000 {method 'remove' of 'set' objects}
      184    0.000    0.000    0.000    0.000 {method 'rfind' of 'str' objects}
       22    0.000    0.000    0.000    0.000 {method 'rpartition' of 'str' objects}
       52    0.000    0.000    0.000    0.000 {method 'rstrip' of 'str' objects}
        1    0.000    0.000    0.000    0.000 {method 'seek' of '_io.BufferedReader' objects}
        2    0.000    0.000    0.000    0.000 {method 'setter' of 'property' objects}
       34    0.000    0.000    0.000    0.000 {method 'span' of 're.Match' objects}
    73759    0.174    0.000    0.174    0.000 {method 'split' of 'str' objects}
        1    0.000    0.000    0.000    0.000 {method 'startswith' of 'bytes' objects}
 21957473    3.878    0.000    3.878    0.000 {method 'startswith' of 'str' objects}
   830284    0.072    0.000    0.072    0.000 {method 'strip' of 'str' objects}
       96    0.000    0.000    0.000    0.000 {method 'sub' of 're.Pattern' objects}
        6    0.000    0.000    0.000    0.000 {method 'translate' of 'bytearray' objects}
       33    0.000    0.000    0.000    0.000 {method 'update' of 'dict' objects}
      105    0.002    0.000    0.002    0.000 {method 'write' of '_io.TextIOWrapper' objects}


::> PART 3.4.2: TREE BASED INDEX
Filename: /home/divyateja/InformationRetrieval_CSF469/experiments/experiment4.py

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
   165     92.2 MiB     92.2 MiB           1   @memory_profile
   166                                         def trie_trial():
   167    174.0 MiB     81.7 MiB           1       postings, term_freq = load_index_in_memory("./s2/")
   168                                             # Here postings is the inverted index
   169                                             # term_freq is the term frequency of each term in the collection
   170    302.6 MiB    128.6 MiB           2       trieBasedIndexFromStart, trieBasedIndexFromEnd = generate_trie_indices(
   171    174.0 MiB      0.0 MiB           1           term_freq=term_freq
   172                                             )
   173    310.3 MiB      7.7 MiB           2       tree_based_search(
   174    302.6 MiB      0.0 MiB           1           start_trie=trieBasedIndexFromStart,
   175    302.6 MiB      0.0 MiB           1           end_trie=trieBasedIndexFromEnd,
   176    302.6 MiB      0.0 MiB           1           postings=postings,
   177                                             )


         5949205 function calls (3280854 primitive calls) in 14.498 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        2    0.000    0.000    0.000    0.000 <frozen codecs>:260(__init__)
        2    0.000    0.000    0.000    0.000 <frozen codecs>:309(__init__)
     4276    0.017    0.000    0.027    0.000 <frozen codecs>:319(decode)
       60    0.001    0.000    0.001    0.000 <frozen genericpath>:121(_splitext)
        2    0.000    0.000    0.000    0.000 <frozen genericpath>:16(exists)
       60    0.000    0.000    0.001    0.000 <frozen posixpath>:117(splitext)
       60    0.000    0.000    0.001    0.000 <frozen posixpath>:140(basename)
       60    0.000    0.000    0.000    0.000 <frozen posixpath>:41(_get_sep)
      240    0.000    0.000    0.000    0.000 <frozen posixpath>:52(normcase)
       61    0.000    0.000    0.000    0.000 <string>:1(<lambda>)
        1    0.000    0.000   14.498   14.498 <string>:1(<module>)
       60    0.001    0.000    0.006    0.000 __init__.py:1087(flush)
       60    0.001    0.000    0.011    0.000 __init__.py:1098(emit)
       60    0.000    0.000    0.011    0.000 __init__.py:1216(emit)
       60    0.000    0.000    0.000    0.000 __init__.py:123(getLevelName)
       60    0.001    0.000    0.025    0.000 __init__.py:1479(info)
       60    0.001    0.000    0.003    0.000 __init__.py:1561(findCaller)
       60    0.001    0.000    0.007    0.000 __init__.py:1595(makeRecord)
       60    0.001    0.000    0.024    0.000 __init__.py:1610(_log)
       60    0.000    0.000    0.013    0.000 __init__.py:1636(handle)
       60    0.000    0.000    0.000    0.000 __init__.py:164(<lambda>)
       60    0.001    0.000    0.013    0.000 __init__.py:1690(callHandlers)
       60    0.000    0.000    0.000    0.000 __init__.py:1734(isEnabledFor)
      240    0.001    0.000    0.001    0.000 __init__.py:194(_is_internal_frame)
       60    0.001    0.000    0.026    0.000 __init__.py:2140(info)
        1    0.000    0.000    0.000    0.000 __init__.py:225(compile)
        1    0.000    0.000    0.000    0.000 __init__.py:272(_compile)
        1    0.000    0.000    0.000    0.000 __init__.py:274(load)
       60    0.003    0.000    0.007    0.000 __init__.py:292(__init__)
        1    0.000    0.000    0.000    0.000 __init__.py:299(loads)
       60    0.000    0.000    0.000    0.000 __init__.py:368(getMessage)
       60    0.000    0.000    0.000    0.000 __init__.py:432(usesTime)
       60    0.000    0.000    0.000    0.000 __init__.py:440(_format)
       60    0.000    0.000    0.001    0.000 __init__.py:447(format)
       60    0.000    0.000    0.002    0.000 __init__.py:606(formatTime)
       60    0.000    0.000    0.000    0.000 __init__.py:652(usesTime)
       60    0.000    0.000    0.001    0.000 __init__.py:658(formatMessage)
       60    0.001    0.000    0.004    0.000 __init__.py:674(format)
      120    0.000    0.000    0.000    0.000 __init__.py:815(filter)
      120    0.000    0.000    0.000    0.000 __init__.py:922(acquire)
      120    0.000    0.000    0.000    0.000 __init__.py:929(release)
       60    0.000    0.000    0.004    0.000 __init__.py:942(format)
       60    0.001    0.000    0.012    0.000 __init__.py:965(handle)
        1    0.000    0.000    0.000    0.000 _monitor.py:94(report)
        1    0.000    0.000    0.000    0.000 _weakrefset.py:110(remove)
        2    0.000    0.000    0.000    0.000 _weakrefset.py:17(__init__)
        2    0.000    0.000    0.000    0.000 _weakrefset.py:21(__enter__)
        2    0.000    0.000    0.000    0.000 _weakrefset.py:27(__exit__)
        2    0.000    0.000    0.000    0.000 _weakrefset.py:53(_commit_removals)
        3    0.000    0.000    0.000    0.000 _weakrefset.py:63(__iter__)
        1    0.000    0.000    0.000    0.000 _weakrefset.py:85(add)
        1    0.000    0.000    0.000    0.000 contextlib.py:104(__init__)
        1    0.000    0.000    0.000    0.000 contextlib.py:132(__enter__)
        1    0.000    0.000    0.000    0.000 contextlib.py:141(__exit__)
        1    0.000    0.000    0.000    0.000 contextlib.py:287(helper)
        1    0.000    0.000    0.000    0.000 coroutines.py:21(iscoroutinefunction)
        1    0.000    0.000    0.000    0.000 decoder.py:332(decode)
        1    0.000    0.000    0.000    0.000 decoder.py:343(raw_decode)
        1    0.228    0.228    4.449    4.449 experiment4.py:103(generate_trie_indices)
        1    0.166    0.166    7.944    7.944 experiment4.py:126(tree_based_search)
       30    0.239    0.008    0.239    0.008 experiment4.py:143(<listcomp>)
        2    0.000    0.000    0.000    0.000 experiment4.py:16(__init__)
        1    0.001    0.001   14.375   14.375 experiment4.py:165(trie_trial)
   147518    2.414    0.000    4.221    0.000 experiment4.py:19(insert)
       60    0.001    0.000    7.488    0.125 experiment4.py:35(starts_with)
2668411/60    7.419    0.000    7.487    0.125 experiment4.py:47(dfs)
   516813    1.807    0.000    1.807    0.000 experiment4.py:9(__init__)
        1    0.000    0.000    0.000    0.000 functools.py:393(__get__)
        1    0.000    0.000    0.000    0.000 functools.py:421(_unwrap_partial)
        1    0.000    0.000    0.000    0.000 inspect.py:1055(findsource)
        1    0.000    0.000    0.000    0.000 inspect.py:1172(__init__)
       61    0.000    0.000    0.000    0.000 inspect.py:1181(tokeneater)
        1    0.000    0.000    0.001    0.001 inspect.py:1224(getblock)
        1    0.000    0.000    0.001    0.001 inspect.py:1235(getsourcelines)
        4    0.000    0.000    0.000    0.000 inspect.py:283(ismodule)
        2    0.000    0.000    0.000    0.000 inspect.py:292(isclass)
        3    0.000    0.000    0.000    0.000 inspect.py:300(ismethod)
        3    0.000    0.000    0.000    0.000 inspect.py:378(isfunction)
        1    0.000    0.000    0.000    0.000 inspect.py:391(_has_code_flag)
        1    0.000    0.000    0.000    0.000 inspect.py:409(iscoroutinefunction)
        3    0.000    0.000    0.000    0.000 inspect.py:456(istraceback)
        3    0.000    0.000    0.000    0.000 inspect.py:466(isframe)
        6    0.000    0.000    0.000    0.000 inspect.py:480(iscode)
        1    0.000    0.000    0.000    0.000 inspect.py:735(unwrap)
        1    0.000    0.000    0.000    0.000 inspect.py:752(_is_wrapper)
        1    0.000    0.000    0.000    0.000 inspect.py:896(getfile)
        1    0.000    0.000    0.000    0.000 inspect.py:936(getsourcefile)
        3    0.000    0.000    0.000    0.000 inspect.py:943(<genexpr>)
        4    0.000    0.000    0.000    0.000 inspect.py:946(<genexpr>)
        1    0.000    0.000    0.000    0.000 inspect.py:973(getmodule)
        2    0.000    0.000    0.000    0.000 linecache.py:36(getlines)
        1    0.000    0.000    0.000    0.000 linecache.py:52(checkcache)
        1    1.631    1.631    1.981    1.981 main.py:133(load_index_in_memory)
        1    0.000    0.000   14.498   14.498 memory_profiler.py:1185(wrapper)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:1201(choose_backend)
        6    0.000    0.000    0.000    0.000 memory_profiler.py:1215(<genexpr>)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:640(__init__)
        1    0.000    0.000    0.001    0.001 memory_profiler.py:645(add)
        2    0.000    0.000    0.000    0.000 memory_profiler.py:689(items)
       14    0.000    0.000    0.000    0.000 memory_profiler.py:695(<genexpr>)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:702(__init__)
        1    0.000    0.000    0.001    0.001 memory_profiler.py:713(__call__)
        1    0.000    0.000    0.001    0.001 memory_profiler.py:728(add_function)
        2    0.000    0.000    0.000    0.000 memory_profiler.py:740(_count_ctxmgr)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:748(wrap_function)
        1    0.122    0.122   14.497   14.497 memory_profiler.py:759(f)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:775(enable_by_count)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:782(disable_by_count)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:842(enable)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:849(disable)
        1    0.000    0.000    0.000    0.000 memory_profiler.py:853(show_results)
       60    0.000    0.000    0.000    0.000 process.py:189(name)
       60    0.000    0.000    0.000    0.000 process.py:37(current_process)
       18    0.000    0.000    0.000    0.000 std.py:102(acquire)
       18    0.000    0.000    0.000    0.000 std.py:106(release)
        4    0.000    0.000    0.000    0.000 std.py:110(__enter__)
        4    0.000    0.000    0.000    0.000 std.py:113(__exit__)
        1    0.000    0.000    0.000    0.000 std.py:1147(__del__)
       15    0.000    0.000    0.009    0.001 std.py:1150(__str__)
        2    0.000    0.000    0.000    0.000 std.py:1153(_comparable)
        2    0.000    0.000    0.000    0.000 std.py:1157(__hash__)
       31    0.000    0.000    0.014    0.000 std.py:1160(__iter__)
       13    0.000    0.000    0.013    0.001 std.py:1198(update)
        2    0.000    0.000    0.001    0.000 std.py:1265(close)
        2    0.000    0.000    0.000    0.000 std.py:1286(fp_write)
        1    0.000    0.000    0.000    0.000 std.py:1301(<lambda>)
       14    0.000    0.000    0.013    0.001 std.py:1325(refresh)
       15    0.000    0.000    0.000    0.000 std.py:1446(format_dict)
       15    0.000    0.000    0.014    0.001 std.py:1464(display)
       15    0.000    0.000    0.000    0.000 std.py:153(__init__)
       15    0.000    0.000    0.000    0.000 std.py:163(colour)
       15    0.000    0.000    0.000    0.000 std.py:167(colour)
       15    0.000    0.000    0.000    0.000 std.py:186(__format__)
        3    0.000    0.000    0.000    0.000 std.py:226(__init__)
       79    0.000    0.000    0.000    0.000 std.py:231(__call__)
       29    0.000    0.000    0.000    0.000 std.py:400(format_interval)
        1    0.000    0.000    0.000    0.000 std.py:438(status_printer)
       15    0.000    0.000    0.001    0.000 std.py:451(fp_write)
       15    0.000    0.000    0.004    0.000 std.py:457(print_status)
       15    0.002    0.000    0.008    0.001 std.py:464(format_meter)
        1    0.000    0.000    0.000    0.000 std.py:663(__new__)
        1    0.000    0.000    0.000    0.000 std.py:679(_get_free_pos)
        1    0.000    0.000    0.000    0.000 std.py:682(<setcomp>)
        1    0.000    0.000    0.000    0.000 std.py:686(_decr_instances)
        1    0.000    0.000    0.000    0.000 std.py:760(get_lock)
        1    0.000    0.000    0.001    0.001 std.py:952(__init__)
       60    0.000    0.000    0.000    0.000 threading.py:1145(name)
       60    0.000    0.000    0.000    0.000 threading.py:1446(current_thread)
        1    0.000    0.000    0.000    0.000 threading.py:568(is_set)
       62    0.000    0.000    0.000    0.000 tokenize.py:433(_tokenize)
        1    0.000    0.000    0.000    0.000 tokenize.py:616(generate_tokens)
       15    0.000    0.000    0.000    0.000 utils.py:108(__init__)
       15    0.000    0.000    0.000    0.000 utils.py:112(__format__)
        1    0.000    0.000    0.000    0.000 utils.py:125(__eq__)
        2    0.000    0.000    0.000    0.000 utils.py:139(__getattr__)
        3    0.000    0.000    0.000    0.000 utils.py:152(wrapper_setattr)
        1    0.000    0.000    0.000    0.000 utils.py:156(__init__)
        2    0.000    0.000    0.000    0.000 utils.py:187(disable_on_exception)
       32    0.000    0.000    0.001    0.000 utils.py:194(inner)
        1    0.000    0.000    0.000    0.000 utils.py:213(__init__)
        2    0.000    0.000    0.000    0.000 utils.py:222(__eq__)
        1    0.000    0.000    0.000    0.000 utils.py:252(_is_utf)
        1    0.000    0.000    0.000    0.000 utils.py:266(_supports_unicode)
       30    0.000    0.000    0.000    0.000 utils.py:273(_is_ascii)
        1    0.000    0.000    0.000    0.000 utils.py:282(_screen_shape_wrapper)
        1    0.000    0.000    0.000    0.000 utils.py:333(_screen_shape_linux)
       45    0.000    0.000    0.007    0.000 utils.py:374(_text_width)
     4396    0.004    0.000    0.005    0.000 utils.py:375(<genexpr>)
       45    0.000    0.000    0.007    0.000 utils.py:378(disp_len)
       15    0.000    0.000    0.003    0.000 utils.py:386(disp_trim)
       62    0.000    0.000    0.000    0.000 {built-in method __new__ of type object at 0x860f60}
     4276    0.010    0.000    0.010    0.000 {built-in method _codecs.utf_8_decode}
      120    0.000    0.000    0.000    0.000 {built-in method _thread.get_ident}
        2    0.000    0.000    0.000    0.000 {built-in method _weakref.proxy}
       17    0.000    0.000    0.000    0.000 {built-in method builtins.abs}
        2    0.000    0.000    0.000    0.000 {built-in method builtins.any}
       73    0.000    0.000    0.000    0.000 {built-in method builtins.divmod}
        1    0.000    0.000   14.498   14.498 {built-in method builtins.exec}
       14    0.000    0.000    0.000    0.000 {built-in method builtins.getattr}
      157    0.000    0.000    0.000    0.000 {built-in method builtins.hasattr}
        3    0.000    0.000    0.000    0.000 {built-in method builtins.id}
      177    0.000    0.000    0.000    0.000 {built-in method builtins.isinstance}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.iter}
    73915    0.011    0.000    0.011    0.000 {built-in method builtins.len}
       30    0.000    0.000    0.000    0.000 {built-in method builtins.max}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.min}
        2    0.000    0.000    0.000    0.000 {built-in method builtins.next}
      315    0.000    0.000    0.000    0.000 {built-in method builtins.ord}
       45    0.002    0.000    0.007    0.000 {built-in method builtins.sum}
        1    0.000    0.000    0.000    0.000 {built-in method fcntl.ioctl}
        1    0.000    0.000    0.000    0.000 {built-in method fromtimestamp}
        2    0.000    0.000    0.000    0.000 {built-in method io.open}
       14    0.000    0.000    0.000    0.000 {built-in method now}
      360    0.000    0.000    0.000    0.000 {built-in method posix.fspath}
       60    0.000    0.000    0.000    0.000 {built-in method posix.getpid}
        3    0.000    0.000    0.000    0.000 {built-in method posix.stat}
       60    0.000    0.000    0.000    0.000 {built-in method sys._getframe}
        1    0.000    0.000    0.000    0.000 {built-in method sys.getrecursionlimit}
        1    0.000    0.000    0.000    0.000 {built-in method sys.gettrace}
        2    0.000    0.000    0.000    0.000 {built-in method sys.settrace}
       60    0.001    0.000    0.001    0.000 {built-in method time.localtime}
       60    0.000    0.000    0.000    0.000 {built-in method time.strftime}
      129    0.000    0.000    0.000    0.000 {built-in method time.time}
     4351    0.001    0.000    0.001    0.000 {built-in method unicodedata.east_asian_width}
        1    0.000    0.000    0.000    0.000 {method '__exit__' of '_io._IOBase' objects}
       18    0.000    0.000    0.000    0.000 {method 'acquire' of '_multiprocessing.SemLock' objects}
      138    0.000    0.000    0.000    0.000 {method 'acquire' of '_thread.RLock' objects}
    43392    0.008    0.000    0.008    0.000 {method 'add' of 'set' objects}
  1571045    0.156    0.000    0.156    0.000 {method 'append' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'difference' of 'set' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        1    0.000    0.000    0.000    0.000 {method 'encode' of 'str' objects}
        2    0.000    0.000    0.000    0.000 {method 'end' of 're.Match' objects}
        6    0.000    0.000    0.000    0.000 {method 'endswith' of 'str' objects}
       60    0.000    0.000    0.000    0.000 {method 'find' of 'str' objects}
       77    0.005    0.000    0.005    0.000 {method 'flush' of '_io.TextIOWrapper' objects}
       61    0.000    0.000    0.001    0.000 {method 'format' of 'str' objects}
      138    0.000    0.000    0.000    0.000 {method 'get' of 'dict' objects}
        1    0.000    0.000    0.000    0.000 {method 'insert' of 'list' objects}
       30    0.001    0.000    0.001    0.000 {method 'intersection' of 'set' objects}
       39    0.000    0.000    0.000    0.000 {method 'isidentifier' of 'str' objects}
       54    0.000    0.000    0.000    0.000 {method 'match' of 're.Pattern' objects}
        3    0.000    0.000    0.000    0.000 {method 'pop' of 'list' objects}
        1    0.000    0.000    0.000    0.000 {method 'read' of '_io.TextIOWrapper' objects}
       18    0.000    0.000    0.000    0.000 {method 'release' of '_multiprocessing.SemLock' objects}
      138    0.000    0.000    0.000    0.000 {method 'release' of '_thread.RLock' objects}
        3    0.000    0.000    0.000    0.000 {method 'remove' of 'set' objects}
      180    0.000    0.000    0.000    0.000 {method 'rfind' of 'str' objects}
        3    0.000    0.000    0.000    0.000 {method 'rstrip' of 'str' objects}
       51    0.000    0.000    0.000    0.000 {method 'span' of 're.Match' objects}
    73819    0.137    0.000    0.137    0.000 {method 'split' of 'str' objects}
        1    0.000    0.000    0.000    0.000 {method 'startswith' of 'str' objects}
   830284    0.086    0.000    0.086    0.000 {method 'strip' of 'str' objects}
       45    0.000    0.000    0.000    0.000 {method 'sub' of 're.Pattern' objects}
       16    0.000    0.000    0.000    0.000 {method 'update' of 'dict' objects}
       94    0.001    0.000    0.001    0.000 {method 'write' of '_io.TextIOWrapper' objects}


