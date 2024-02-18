# Memory profile

Line #    Mem usage    Increment  Occurrences   Line Contents
=============================================================
    35     94.7 MiB     94.7 MiB           1   @memory_profile
    36                                         def process_all_terms_memory(vocabulary: list[str]):
    37     94.7 MiB      0.0 MiB           1       processed_vocabulary = []
    38                                         
    39    160.0 MiB      0.0 MiB       73761       for word in vocabulary:
    40                                                 # Remove stop words
    41    160.0 MiB      0.0 MiB       73760           if word not in stop_words:
    42                                                     # Perform stemming
    43    160.0 MiB      4.5 MiB       73616               stemmed_word = stemmer.stem(word)
    44                                                     # Perform lemmatization
    45    160.0 MiB     60.8 MiB       73616               lemmatized_word = lemmatizer.lemmatize(stemmed_word)
    46    160.0 MiB      0.0 MiB       73616               processed_vocabulary.append(lemmatized_word)
    47                                         
    48    160.0 MiB      0.0 MiB           1       return processed_vocabulary

# Time profile

         13073634 function calls (13071301 primitive calls) in 3.940 seconds

   Ordered by: standard name

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:100(acquire)
        1    0.000    0.000    0.003    0.003 <frozen importlib._bootstrap>:1022(_find_and_load)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:125(release)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:165(__init__)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:169(__enter__)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:173(__exit__)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:179(_get_module_lock)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:198(cb)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:233(_call_with_frames_removed)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:244(_verbose_message)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:357(__init__)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:391(cached)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:404(parent)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:412(has_location)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:48(_new_module)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:492(_init_module_attrs)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:564(module_from_spec)
        1    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap>:664(_load_unlocked)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:71(__init__)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:746(find_spec)
        1    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap>:826(find_spec)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:893(__enter__)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:897(__exit__)
        1    0.000    0.000    0.002    0.002 <frozen importlib._bootstrap>:921(_find_spec)
        1    0.000    0.000    0.003    0.003 <frozen importlib._bootstrap>:987(_find_and_load_unlocked)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1040(__init__)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1065(get_filename)
        1    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap_external>:1070(get_data)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1089(path_stats)
        6    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:126(_path_join)
        6    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:128(<listcomp>)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:132(_path_split)
        4    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:134(<genexpr>)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1356(_path_importer_cache)
        1    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap_external>:1399(_get_spec)
        3    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap_external>:140(_path_stat)
        1    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap_external>:1431(find_spec)
        1    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap_external>:150(_path_is_mode_type)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1531(_get_spec)
        1    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap_external>:1536(find_spec)
        1    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap_external>:159(_path_isfile)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:180(_path_isabs)
        2    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:380(cache_from_source)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:510(_get_cached)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:542(_check_name_wrapper)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:585(_classify_pyc)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:618(_validate_timestamp_pyc)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:670(_compile_bytecode)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:71(_relax_case)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:721(spec_from_file_location)
        3    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:84(_unpack_uint32)
        1    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:874(create_module)
        1    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap_external>:877(exec_module)
        1    0.000    0.000    0.001    0.001 <frozen importlib._bootstrap_external>:950(get_code)
        1    0.001    0.001    3.939    3.939 <string>:1(<module>)
        1    0.000    0.000    0.000    0.000 __init__.py:43(normalize_encoding)
        1    0.000    0.000    0.003    0.003 __init__.py:71(search_function)
        1    0.000    0.000    0.000    0.000 _collections_abc.py:78(_check_methods)
        3    0.000    0.000    0.000    0.000 abc.py:117(__instancecheck__)
        2    0.000    0.000    0.000    0.000 abc.py:121(__subclasscheck__)
       10    0.000    0.000    0.060    0.006 api.py:222(open)
       10    0.000    0.000    0.000    0.000 api.py:234(encoding)
        1    0.000    0.000    0.000    0.000 api.py:41(__init__)
        1    0.000    0.000    0.000    0.000 codecs.py:1064(make_identity_dict)
        1    0.000    0.000    0.000    0.000 codecs.py:1072(<dictcomp>)
        1    0.000    0.000    0.000    0.000 codecs.py:94(__new__)
       10    0.000    0.000    0.000    0.000 codecs.py:968(getdecoder)
       24    0.000    0.000    0.001    0.000 compat.py:25(add_py3_data)
    24/22    0.000    0.000    0.005    0.000 compat.py:39(_decorator)
        1    0.000    0.000    0.000    0.000 cp437.py:1(<module>)
       48    0.000    0.000    0.000    0.000 cp437.py:14(decode)
        1    0.000    0.000    0.000    0.000 cp437.py:17(IncrementalEncoder)
        1    0.000    0.000    0.000    0.000 cp437.py:21(IncrementalDecoder)
        1    0.000    0.000    0.000    0.000 cp437.py:25(StreamWriter)
        1    0.000    0.000    0.000    0.000 cp437.py:28(StreamReader)
        1    0.000    0.000    0.000    0.000 cp437.py:33(getregentry)
        1    0.000    0.000    0.000    0.000 cp437.py:9(Codec)
   161423    0.267    0.000    0.520    0.000 data.py:1072(readline)
   161423    0.051    0.000    0.571    0.000 data.py:1143(next)
   161423    0.041    0.000    0.612    0.000 data.py:1151(__next__)
       10    0.000    0.000    0.000    0.000 data.py:1154(__iter__)
        9    0.000    0.000    0.000    0.000 data.py:1158(__del__)
        9    0.000    0.000    0.000    0.000 data.py:1163(__enter__)
        9    0.000    0.000    0.000    0.000 data.py:1166(__exit__)
        9    0.000    0.000    0.000    0.000 data.py:1177(closed)
        9    0.000    0.000    0.000    0.000 data.py:1192(close)
        2    0.000    0.000    0.000    0.000 data.py:1202(seek)
    88062    0.064    0.000    0.134    0.000 data.py:1323(_read)
    88062    0.022    0.000    0.060    0.000 data.py:1361(_incr_decode)
       10    0.000    0.000    0.000    0.000 data.py:1401(_check_bom)
       16    0.000    0.000    0.000    0.000 data.py:202(normalize_resource_name)
       12    0.000    0.000    0.004    0.000 data.py:384(__init__)
       10    0.000    0.000    0.060    0.006 data.py:437(open)
       10    0.000    0.000    0.001    0.000 data.py:449(join)
      4/2    0.000    0.000    0.006    0.003 data.py:471(find)
       27    0.000    0.000    0.000    0.000 data.py:580(<genexpr>)
        2    0.000    0.000    0.004    0.002 data.py:931(__init__)
       10    0.000    0.000    0.059    0.006 data.py:942(read)
       40    0.000    0.000    0.000    0.000 data.py:960(__repr__)
       10    0.000    0.000    0.000    0.000 data.py:988(__init__)
        2    0.000    0.000    0.000    0.000 enum.py:359(__call__)
        2    0.000    0.000    0.000    0.000 enum.py:678(__new__)
        1    0.000    0.000    0.000    0.000 enum.py:986(__and__)
        1    0.051    0.051    3.938    3.938 experiment2.py:50(process_all_terms_time)
        4    0.000    0.000    0.000    0.000 genericpath.py:16(exists)
       25    0.000    0.000    0.001    0.000 genericpath.py:27(isfile)
       25    0.000    0.000    0.000    0.000 genericpath.py:39(isdir)
        1    0.000    0.000    0.000    0.000 os.py:1080(__subclasshook__)
        4    0.000    0.000    0.000    0.000 parse.py:655(unquote)
243219/241229    0.037    0.000    0.037    0.000 porter.py:126(_is_consonant)
    29228    0.057    0.000    0.096    0.000 porter.py:147(_measure)
     3965    0.001    0.000    0.014    0.000 porter.py:198(_has_positive_measure)
     6470    0.005    0.000    0.008    0.000 porter.py:201(_contains_vowel)
     5465    0.002    0.000    0.003    0.000 porter.py:208(_ends_double_consonant)
     2653    0.003    0.000    0.004    0.000 porter.py:219(_ends_cvc)
    45540    0.021    0.000    0.028    0.000 porter.py:240(_replace_suffix)
   442132    0.557    0.000    0.949    0.000 porter.py:248(_apply_rule_list)
    72620    0.037    0.000    0.126    0.000 porter.py:276(_step1a)
    72620    0.060    0.000    0.134    0.000 porter.py:303(_step1b)
      488    0.000    0.000    0.000    0.000 porter.py:376(<lambda>)
     4977    0.002    0.000    0.021    0.000 porter.py:382(<lambda>)
    72620    0.039    0.000    0.072    0.000 porter.py:387(_step1c)
     2915    0.002    0.000    0.003    0.000 porter.py:398(nltk_condition)
72936/72620    0.155    0.000    0.508    0.000 porter.py:435(_step2)
       78    0.000    0.000    0.000    0.000 porter.py:507(<lambda>)
    72620    0.054    0.000    0.171    0.000 porter.py:515(_step3)
    72620    0.072    0.000    0.389    0.000 porter.py:543(_step4)
    11084    0.004    0.000    0.040    0.000 porter.py:571(<lambda>)
     1027    0.000    0.000    0.004    0.000 porter.py:591(<lambda>)
    72620    0.020    0.000    0.056    0.000 porter.py:603(_step5a)
    72620    0.029    0.000    0.057    0.000 porter.py:639(_step5b)
      344    0.000    0.000    0.001    0.000 porter.py:651(<lambda>)
    73616    0.205    0.000    1.730    0.000 porter.py:654(stem)
       18    0.000    0.000    0.000    0.000 posixpath.py:338(normpath)
        2    0.000    0.000    0.000    0.000 posixpath.py:377(abspath)
        6    0.000    0.000    0.000    0.000 posixpath.py:41(_get_sep)
        2    0.000    0.000    0.000    0.000 posixpath.py:60(isabs)
        4    0.000    0.000    0.000    0.000 posixpath.py:71(join)
        4    0.000    0.000    0.000    0.000 re.py:187(match)
       30    0.000    0.000    0.000    0.000 re.py:197(search)
       27    0.000    0.000    0.001    0.000 re.py:202(sub)
       61    0.000    0.000    0.000    0.000 re.py:288(_compile)
        1    0.000    0.000    0.000    0.000 re.py:324(_subx)
        1    0.000    0.000    0.000    0.000 re.py:330(filter)
        4    0.000    0.000    0.000    0.000 request.py:1680(url2pathname)
        4    0.000    0.000    0.000    0.000 sre_compile.py:265(_compile_charset)
        4    0.000    0.000    0.000    0.000 sre_compile.py:292(_optimize_charset)
        3    0.000    0.000    0.000    0.000 sre_compile.py:447(_simple)
        1    0.000    0.000    0.000    0.000 sre_compile.py:456(_generate_overlap_table)
        1    0.000    0.000    0.000    0.000 sre_compile.py:477(_get_iscased)
        1    0.000    0.000    0.000    0.000 sre_compile.py:485(_get_literal_prefix)
        1    0.000    0.000    0.000    0.000 sre_compile.py:560(_compile_info)
        2    0.000    0.000    0.000    0.000 sre_compile.py:619(isstring)
        1    0.000    0.000    0.000    0.000 sre_compile.py:622(_code)
        1    0.000    0.000    0.000    0.000 sre_compile.py:783(compile)
        1    0.000    0.000    0.000    0.000 sre_compile.py:81(_combine_flags)
      7/1    0.000    0.000    0.000    0.000 sre_compile.py:87(_compile)
        1    0.000    0.000    0.000    0.000 sre_parse.py:1066(expand_template)
        7    0.000    0.000    0.000    0.000 sre_parse.py:112(__init__)
       15    0.000    0.000    0.000    0.000 sre_parse.py:161(__len__)
       55    0.000    0.000    0.000    0.000 sre_parse.py:165(__getitem__)
        3    0.000    0.000    0.000    0.000 sre_parse.py:169(__setitem__)
       24    0.000    0.000    0.000    0.000 sre_parse.py:173(append)
      8/2    0.000    0.000    0.000    0.000 sre_parse.py:175(getwidth)
        1    0.000    0.000    0.000    0.000 sre_parse.py:225(__init__)
       32    0.000    0.000    0.000    0.000 sre_parse.py:234(__next)
       11    0.000    0.000    0.000    0.000 sre_parse.py:250(match)
       29    0.000    0.000    0.000    0.000 sre_parse.py:255(get)
        7    0.000    0.000    0.000    0.000 sre_parse.py:287(tell)
        4    0.000    0.000    0.000    0.000 sre_parse.py:356(_escape)
        1    0.000    0.000    0.000    0.000 sre_parse.py:433(_uniq)
      2/1    0.000    0.000    0.000    0.000 sre_parse.py:436(_parse_sub)
      3/1    0.000    0.000    0.000    0.000 sre_parse.py:494(_parse)
        1    0.000    0.000    0.000    0.000 sre_parse.py:76(__init__)
        4    0.000    0.000    0.000    0.000 sre_parse.py:82(groups)
        1    0.000    0.000    0.000    0.000 sre_parse.py:85(opengroup)
        1    0.000    0.000    0.000    0.000 sre_parse.py:928(fix_flags)
        1    0.000    0.000    0.000    0.000 sre_parse.py:944(parse)
        1    0.000    0.000    0.000    0.000 sre_parse.py:97(closegroup)
        3    0.000    0.000    0.000    0.000 textwrap.py:473(indent)
       18    0.000    0.000    0.000    0.000 textwrap.py:482(predicate)
       21    0.000    0.000    0.000    0.000 textwrap.py:485(prefixed_lines)
        2    0.000    0.000    0.000    0.000 threading.py:90(RLock)
    88062    0.021    0.000    0.038    0.000 utf_8.py:15(decode)
        1    0.000    0.000    1.828    1.828 util.py:112(__getattr__)
        1    0.000    0.000    0.000    0.000 util.py:139(_make_bound_method)
        1    0.000    0.000    0.000    0.000 util.py:144(Foo)
        1    0.001    0.001    1.828    1.828 util.py:68(__load)
        1    0.000    0.000    1.821    1.821 wordnet.py:1153(__init__)
        1    0.000    0.000    0.024    0.024 wordnet.py:1276(map_wn30)
        1    0.652    0.652    1.770    1.770 wordnet.py:1361(_load_lemma_pos_offset_map)
  1440656    0.190    0.000    0.269    0.000 wordnet.py:1372(_next_token)
   155287    0.061    0.000    0.116    0.000 wordnet.py:1388(<listcomp>)
   155287    0.069    0.000    0.106    0.000 wordnet.py:1399(<listcomp>)
        1    0.004    0.004    0.024    0.024 wordnet.py:1411(_load_exception_map)
        1    0.000    0.000    0.024    0.024 wordnet.py:1436(get_version)
        1    0.000    0.000    0.023    0.023 wordnet.py:1523(_data_file)
    73616    0.072    0.000    0.291    0.000 wordnet.py:2064(_morphy)
    76133    0.024    0.000    0.170    0.000 wordnet.py:2075(apply_rules)
    76133    0.091    0.000    0.145    0.000 wordnet.py:2076(<listcomp>)
    76183    0.048    0.000    0.049    0.000 wordnet.py:2083(filter_forms)
    73616    0.030    0.000    2.151    0.000 wordnet.py:33(lemmatize)
       10    0.000    0.000    0.018    0.002 zipfile.py:1020(_read2)
       10    0.000    0.000    0.000    0.000 zipfile.py:1036(close)
        2    0.000    0.000    0.004    0.002 zipfile.py:1218(__init__)
        2    0.000    0.000    0.004    0.002 zipfile.py:1328(_RealGetContents)
       22    0.000    0.000    0.000    0.000 zipfile.py:1439(getinfo)
       10    0.000    0.000    0.059    0.006 zipfile.py:1475(read)
       10    0.000    0.000    0.003    0.000 zipfile.py:1480(open)
       40    0.000    0.000    0.000    0.000 zipfile.py:1529(<lambda>)
        1    0.000    0.000    0.000    0.000 zipfile.py:1819(__del__)
       13    0.000    0.000    0.000    0.000 zipfile.py:1823(close)
       22    0.000    0.000    0.000    0.000 zipfile.py:1939(_fpclose)
        2    0.000    0.000    0.000    0.000 zipfile.py:216(_EndRecData64)
        2    0.000    0.000    0.000    0.000 zipfile.py:259(_EndRecData)
       38    0.000    0.000    0.000    0.000 zipfile.py:346(__init__)
       38    0.000    0.000    0.000    0.000 zipfile.py:463(_decodeExtra)
       12    0.000    0.000    0.000    0.000 zipfile.py:665(_check_compression)
       10    0.000    0.000    0.001    0.000 zipfile.py:700(_get_decompressor)
       10    0.000    0.000    0.000    0.000 zipfile.py:719(__init__)
       10    0.000    0.000    0.000    0.000 zipfile.py:727(tell)
       40    0.000    0.000    0.020    0.000 zipfile.py:740(read)
       10    0.000    0.000    0.000    0.000 zipfile.py:751(close)
       10    0.000    0.000    0.001    0.000 zipfile.py:792(__init__)
       10    0.000    0.000    0.055    0.006 zipfile.py:902(read)
       10    0.000    0.000    0.007    0.001 zipfile.py:937(_update_crc)
       10    0.000    0.000    0.055    0.006 zipfile.py:984(_read1)
        1    0.000    0.000    0.000    0.000 {built-in method __new__ of type object at 0x564939fe39a0}
        3    0.000    0.000    0.000    0.000 {built-in method _abc._abc_instancecheck}
        2    0.000    0.000    0.000    0.000 {built-in method _abc._abc_subclasscheck}
       48    0.000    0.000    0.000    0.000 {built-in method _codecs.charmap_decode}
       10    0.000    0.000    0.000    0.000 {built-in method _codecs.lookup}
    88062    0.016    0.000    0.016    0.000 {built-in method _codecs.utf_8_decode}
        1    0.000    0.000    0.000    0.000 {built-in method _imp._fix_co_filename}
        5    0.000    0.000    0.000    0.000 {built-in method _imp.acquire_lock}
        1    0.001    0.001    0.001    0.001 {built-in method _imp.is_frozen}
        5    0.000    0.000    0.000    0.000 {built-in method _imp.release_lock}
        1    0.000    0.000    0.000    0.000 {built-in method _sre.compile}
        4    0.000    0.000    0.000    0.000 {built-in method _stat.S_ISDIR}
        4    0.000    0.000    0.000    0.000 {built-in method _stat.S_ISREG}
      128    0.000    0.000    0.000    0.000 {built-in method _struct.unpack}
        2    0.000    0.000    0.000    0.000 {built-in method _thread.allocate_lock}
        2    0.000    0.000    0.000    0.000 {built-in method _thread.get_ident}
        6    0.000    0.000    0.000    0.000 {built-in method builtins.__build_class__}
        1    0.000    0.000    0.003    0.003 {built-in method builtins.__import__}
       38    0.000    0.000    0.000    0.000 {built-in method builtins.chr}
      2/1    0.001    0.001    3.940    3.940 {built-in method builtins.exec}
        7    0.000    0.000    0.000    0.000 {built-in method builtins.getattr}
       13    0.000    0.000    0.000    0.000 {built-in method builtins.hasattr}
      197    0.000    0.000    0.000    0.000 {built-in method builtins.isinstance}
   155287    0.016    0.000    0.016    0.000 {built-in method builtins.iter}
848919/848912    0.063    0.000    0.063    0.000 {built-in method builtins.len}
       24    0.000    0.000    0.000    0.000 {built-in method builtins.max}
     8119    0.003    0.000    0.003    0.000 {built-in method builtins.min}
  1440656    0.080    0.000    0.080    0.000 {built-in method builtins.next}
       20    0.000    0.000    0.000    0.000 {built-in method builtins.ord}
       40    0.000    0.000    0.000    0.000 {built-in method builtins.repr}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.setattr}
        3    0.000    0.000    0.000    0.000 {built-in method from_bytes}
        1    0.000    0.000    0.000    0.000 {built-in method fromkeys}
        1    0.001    0.001    0.001    0.001 {built-in method io.open_code}
       12    0.000    0.000    0.000    0.000 {built-in method io.open}
        1    0.000    0.000    0.000    0.000 {built-in method marshal.loads}
       29    0.000    0.000    0.000    0.000 {built-in method posix.fspath}
       57    0.002    0.000    0.002    0.000 {built-in method posix.stat}
       20    0.007    0.000    0.007    0.000 {built-in method zlib.crc32}
       10    0.001    0.000    0.001    0.000 {built-in method zlib.decompressobj}
       10    0.000    0.000    0.000    0.000 {function ZipExtFile.close at 0x7f6ed2a55090}
       11    0.000    0.000    0.000    0.000 {method '__exit__' of '_io._IOBase' objects}
       40    0.000    0.000    0.000    0.000 {method '__exit__' of '_thread.RLock' objects}
        2    0.000    0.000    0.000    0.000 {method '__exit__' of '_thread.lock' objects}
     8128    0.001    0.000    0.001    0.000 {method 'add' of 'set' objects}
   227255    0.019    0.000    0.019    0.000 {method 'append' of 'list' objects}
       22    0.000    0.000    0.000    0.000 {method 'close' of '_io.BufferedReader' objects}
        9    0.000    0.000    0.000    0.000 {method 'close' of '_io.BytesIO' objects}
    29228    0.004    0.000    0.004    0.000 {method 'count' of 'str' objects}
       48    0.000    0.000    0.003    0.000 {method 'decode' of 'bytes' objects}
       10    0.030    0.003    0.030    0.003 {method 'decompress' of 'zlib.Decompress' objects}
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
  5118551    0.401    0.000    0.401    0.000 {method 'endswith' of 'str' objects}
        2    0.000    0.000    0.000    0.000 {method 'extend' of 'list' objects}
        8    0.000    0.000    0.000    0.000 {method 'find' of 'bytearray' objects}
       38    0.000    0.000    0.000    0.000 {method 'find' of 'str' objects}
       10    0.000    0.000    0.000    0.000 {method 'flush' of 'zlib.Decompress' objects}
        6    0.000    0.000    0.000    0.000 {method 'format' of 'str' objects}
       43    0.000    0.000    0.000    0.000 {method 'get' of 'dict' objects}
        3    0.000    0.000    0.000    0.000 {method 'group' of 're.Match' objects}
        4    0.000    0.000    0.000    0.000 {method 'groups' of 're.Match' objects}
        5    0.000    0.000    0.000    0.000 {method 'isalnum' of 'str' objects}
        5    0.000    0.000    0.000    0.000 {method 'isascii' of 'str' objects}
        2    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}
       36    0.000    0.000    0.000    0.000 {method 'join' of 'str' objects}
    73626    0.007    0.000    0.007    0.000 {method 'lower' of 'str' objects}
       12    0.000    0.000    0.000    0.000 {method 'lstrip' of 'str' objects}
        4    0.000    0.000    0.000    0.000 {method 'match' of 're.Pattern' objects}
        1    0.000    0.000    0.000    0.000 {method 'pop' of 'dict' objects}
   161356    0.019    0.000    0.019    0.000 {method 'pop' of 'list' objects}
       47    0.020    0.000    0.020    0.000 {method 'read' of '_io.BufferedReader' objects}
    88224    0.010    0.000    0.010    0.000 {method 'read' of '_io.BytesIO' objects}
       33    0.000    0.000    0.000    0.000 {method 'replace' of 'str' objects}
        2    0.000    0.000    0.000    0.000 {method 'rfind' of 'str' objects}
        7    0.000    0.000    0.000    0.000 {method 'rpartition' of 'str' objects}
       14    0.000    0.000    0.000    0.000 {method 'rstrip' of 'str' objects}
       30    0.000    0.000    0.000    0.000 {method 'search' of 're.Pattern' objects}
       48    0.000    0.000    0.000    0.000 {method 'seek' of '_io.BufferedReader' objects}
       22    0.000    0.000    0.000    0.000 {method 'seek' of '_io.BytesIO' objects}
       10    0.000    0.000    0.000    0.000 {method 'seekable' of '_io.BufferedReader' objects}
   161306    0.054    0.000    0.054    0.000 {method 'split' of 'str' objects}
    88894    0.025    0.000    0.025    0.000 {method 'splitlines' of 'str' objects}
       10    0.000    0.000    0.000    0.000 {method 'startswith' of 'bytes' objects}
   155462    0.023    0.000    0.023    0.000 {method 'startswith' of 'str' objects}
       18    0.000    0.000    0.000    0.000 {method 'strip' of 'str' objects}
       27    0.001    0.000    0.001    0.000 {method 'sub' of 're.Pattern' objects}
       42    0.000    0.000    0.000    0.000 {method 'tell' of '_io.BufferedReader' objects}
    88064    0.010    0.000    0.010    0.000 {method 'tell' of '_io.BytesIO' objects}
        1    0.000    0.000    0.000    0.000 {method 'update' of 'dict' objects}
        1    0.000    0.000    0.000    0.000 {method 'values' of 'dict' objects}