from code_setup import *
from profiling import *
from main import *
from tqdm import tqdm


# Trie Node for the tree based index
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end_of_word = False


# Trie data structure for the tree based index, this contains the actual implementation of the tree based index
class Trie:
    def __init__(self):
        self.root = TrieNode()

    def insert(self, word):
        node = self.root
        for char in word:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
        node.is_end_of_word = True

    def search(self, word):
        node = self.root
        for char in word:
            if char not in node.children:
                return False
            node = node.children[char]
        return node.is_end_of_word

    def starts_with(self, prefix):
        node = self.root
        for char in prefix:
            if char not in node.children:
                return False
            node = node.children[char]
        # This will check if the prefix is a valid word or not
        # Now we have to do a DFS to get all the words that start with the prefix
        results = []
        self.dfs(node, prefix, results)
        return results

    def dfs(self, node, prefix, results):
        if node.is_end_of_word:
            results.append(prefix)
        for char in node.children:
            self.dfs(node.children[char], prefix + char, results)


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
def permuterm_search_on_one_term(permuterm_index: dict, query: str):
    query = query + "$"
    # We have to rotate it such that last char is *
    while query[-1] != "*":
        query = query[-1] + query[:-1]
    # We remove the * from the end
    query = query[:-1]
    # Now we can search for the query in the permuterm index
    for key in permuterm_index:
        if key.startswith(query):
            logging.info(f"Permuterm Search: Result Term is: {permuterm_index[key]}")


# PREFIX SEARCH ON ALL TERMS
def permuterm_search_on_all_terms(permuterm_index: dict):
    # Open the file and search for the term
    with open("./s2/s2_wildcard.json") as f:
        queries = json.load(f)

    for term in tqdm(queries["queries"]):
        logging.info(f"Permuterm Search: Query Term is: {term}")
        permuterm_search_on_one_term(permuterm_index, term["query"])


# GENERATE TRIE INDICES
def generate_trie_indices():
    postings, term_freq = load_index_in_memory("./s2/")
    # Here postings is the inverted index
    # term_freq is the term frequency of each term in the collection
    # Create a trie based index
    trieBasedIndexFromStart = Trie()
    # We can create a trie based index for each term in the collection
    # so like if we have a term "hello" we can create a trie based index for it
    # we store h->e->l->l->o and map it to the term "hello"
    for term in term_freq:
        trieBasedIndexFromStart.insert(term)

    # Create a trie based index from the end
    trieBasedIndexFromEnd = Trie()
    # We can create a trie based index for each term in the collection
    # so like if we have a term "hello" we can create a trie based index for it
    # we store o->l->l->e->h and map it to the term "hello"
    for term in term_freq:
        trieBasedIndexFromEnd.insert(term[::-1])

    return trieBasedIndexFromStart, trieBasedIndexFromEnd


# TREE BASED SEARCH
def tree_based_search(start_trie: Trie, end_trie: Trie):
    # Open the file and search for the term
    with open("./s2/s2_wildcard.json") as f:
        queries = json.load(f)

    for term in tqdm(queries["queries"]):
        # Split the term at the *
        first_half = term["query"].split("*")[0]
        second_half = term["query"].split("*")[1]
        logging.info(
            f"Trie Search: Query Term is: {term} --> {first_half} and {second_half}"
        )
        # This will return all the words that start with the first half
        first_half_results = start_trie.starts_with(first_half)
        # This will return reverse of all the words that end with the second half
        second_half_results = end_trie.starts_with(second_half[::-1])
        # reverse all the words in the second half results
        second_half_results = [i[::-1] for i in second_half_results]

        final_results = list(
            set(first_half_results).intersection(set(second_half_results))
        )

        for result in final_results:
            logging.info(f"Trie Search: Result Term is: {result}")


def permuterm_trial():
    permuterm_index = generate_permuterm_indices()
    permuterm_search_on_all_terms(permuterm_index)


def trie_trial():
    trieBasedIndexFromStart, trieBasedIndexFromEnd = generate_trie_indices()
    tree_based_search(
        start_trie=trieBasedIndexFromStart, end_trie=trieBasedIndexFromEnd
    )


# ENTRYPOINT
if __name__ == "__main__":
    # # PART 3.4.1: PERMUTERM INDEX
    print("::> PART 3.4.1: PERMUTERM INDEX")
    # time_profile.run("permuterm_trial()")

    # # PART 3.4.2: TREE BASED INDEX
    print("::> PART 3.4.2: TREE BASED INDEX")
    # time_profile.run("trie_trial()")
