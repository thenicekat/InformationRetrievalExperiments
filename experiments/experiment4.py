import path_setup
from profiling import *

from main import *
import json
from tqdm import tqdm


def generate_permuterm_indices():
    postings, term_freq = load_index_in_memory("./s2/")
    # Here postings is the inverted index
    # term_freq is the term frequency of each term in the collection
    # Create a permuterm index
    permuterm_index = {}
    # We can create a permutation index for each term in the collection
    # so like if we have a term "hello" we can create a permutation index for it
    # we store hello$, ello$h, llo$he, lo$hel, o$hell and map it to the term "hello"
    for term in term_freq:
        term = term + "$"
        for i in range(len(term)):
            permuterm_index[term[i:] + term[:i]] = term
