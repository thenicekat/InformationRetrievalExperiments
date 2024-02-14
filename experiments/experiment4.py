from code_setup import *
from profiling import *
from main import *
from tqdm import tqdm


# GENERATE PERMUTERM INDICES
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


# PREFIX SEARCH ON PERMUTERM INDEX
def prefix_search_on_permuterm_index(permuterm_index: dict, query: str):
    query = query + "$"
    # We have to rotate it such that last char is *
    while query[-1] != "*":
        query = query[-1] + query[:-1]
    # We remove the * from the end
    query = query[:-1]
    # Now we can search for the query in the permuterm index
    for key in permuterm_index:
        if key.startswith(query):
            logging.info(permuterm_index[key])


# PREFIX SEARCH ON ALL TERMS
def prefix_search_on_all_terms(permuterm_index: dict):
    # Open the file and search for the term
    with open("./s2/s2_wildcard.json") as f:
        queries = json.load(f)

    for term in tqdm(queries["queries"]):
        logging.info(f"Term is: {term}")
        prefix_search_on_permuterm_index(permuterm_index, term["query"])


# ENTRYPOINT
if __name__ == "__main__":
    # PART 3.4.1: PERMUTERM INDEX
    permuterm_index = generate_permuterm_indices()
    prefix_search_on_all_terms(permuterm_index)

    # PART 3.4.2: TREE BASED INDEX
