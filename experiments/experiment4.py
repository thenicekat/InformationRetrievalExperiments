from code_setup import *
from profiling import *
from main import *
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
    return permuterm_index


def prefix_search_on_permuterm_index(permuterm_index: dict, query: str):
    query = query + "$"
    # We have to rotate it such that last char is *
    while query[-1] != "*":
        query = query[-1] + query[:-1]
    # We remove the * from the end
    query = query[:-1]
    # Now we can search for the query in the permuterm index
    for key in tqdm(permuterm_index):
        if key.startswith(query):
            logging.info(permuterm_index[key])


# ENTRYPOINT
if __name__ == "__main__":
    permuterm_index = generate_permuterm_indices()
    prefix_search_on_permuterm_index(permuterm_index, "hello*")
    prefix_search_on_permuterm_index(permuterm_index, "world*")
