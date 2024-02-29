from code_setup import *
from profiling import *
from main import *
from tqdm import tqdm
import pandas as pd


# Trie Node for the tree based index
class TrieNode:
    def __init__(self):
        self.children = {}
        self.is_end_of_word = False
        self.array = None


# Trie data structure for the tree based index, this contains the actual implementation of the tree based index
class Trie:
    def __init__(self):
        self.root = TrieNode()

    def insert(self, word, array):
        node = self.root
        for char in word:
            if char not in node.children:
                node.children[char] = TrieNode()
            node = node.children[char]
        node.is_end_of_word = True
        node.array = array

    def search(self, word):
        node = self.root
        for char in word:
            if char not in node.children:
                return None
            node = node.children[char]
        if node.is_end_of_word:
            return node.array
        return None

    def boolean_retrieval_multiple_words(self, sentence):
        words = sentence.split()
        result_array = None
        for word in words:
            array = self.search(word)
            if array is not None:
                if result_array is None:
                    result_array = array.copy()
                else:
                    result_array = intersection(result_array, array)
        return result_array

    def starts_with(self, prefix):
        node = self.root
        for char in prefix:
            if char not in node.children:
                return False
            node = node.children[char]
        # This will check if the prefix is a valid word or not
        # Now we have to do a DFS to get all the words that start with the prefix
        results = set()
        self.dfs(node, prefix, results)
        return results

    def dfs(self, node, prefix, results):
        if node.is_end_of_word:
            results.add(prefix)
        for char in node.children:
            self.dfs(node.children[char], prefix + char, results)


# GENERATE PERMUTERM INDICES
def generate_permuterm_indices(term_freq: dict, postings: dict):
    # We can create a permutation index for each term in the collection
    # so like if we have a term "hello" we can create a permutation index for it
    # we store hello$, ello$h, llo$he, lo$hel, o$hell
    permuterm_trie = Trie()
    for term in term_freq:
        original_term = term
        term = term + "$"
        for i in range(len(term)):
            permuterm_trie.insert(term[i:] + term[:i], postings[original_term])
    return permuterm_trie


# PREFIX SEARCH ON PERMUTERM INDEX
def permuterm_search_on_one_term(permuterm_index: Trie, postings: dict, query: str):
    query = query + "$"
    # We have to rotate it such that last char is *
    while query[-1] != "*":
        query = query[-1] + query[:-1]
    # We remove the * from the end
    query = query[:-1]
    # Now we can search for the query in the permuterm index
    terms = permuterm_index.starts_with(prefix=query)

    postings_result = set()
    for term in terms:
        try:
            for posting in permuterm_index.search(term):
                postings_result.add(posting)
        except:
            logging.info(f"Permuterm Search: Term not found: {term}")

    return postings_result


# GENERATE TRIE INDICES
def generate_trie_indices(term_freq: dict, postings: dict):
    # Here postings is the inverted index
    # term_freq is the term frequency of each term in the collection
    # Create a trie based index
    trieBasedIndexFromStart = Trie()
    # We can create a trie based index for each term in the collection
    # so like if we have a term "hello" we can create a trie based index for it
    # we store h->e->l->l->o and map it to the term "hello"
    for term in term_freq:
        trieBasedIndexFromStart.insert(term, postings[term])

    # Create a trie based index from the end
    trieBasedIndexFromEnd = Trie()
    # We can create a trie based index for each term in the collection
    # so like if we have a term "hello" we can create a trie based index for it
    # we store o->l->l->e->h and map it to the term "hello"
    for term in term_freq:
        trieBasedIndexFromEnd.insert(term[::-1], postings[term])

    return trieBasedIndexFromStart, trieBasedIndexFromEnd


# TREE BASED SEARCH
def tree_based_search(start_trie: Trie, end_trie: Trie, postings: dict, term: dict):
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

    final_results = list(set(first_half_results).intersection(set(second_half_results)))
    postings_result = set()
    for result in final_results:
        # logging.info(f"Trie Search: Result Term is: {result}")
        for posting in postings[result]:
            postings_result.add(posting)
    logging.info(f"Trie Search: Length of Results is: {len(postings_result)}")


@memory_profile
def permuterm_trial():
    permuterm_profiler = time_profile.Profile()

    postings, term_freq = load_index_in_memory("./s2/")
    # Here postings is the inverted index
    # term_freq is the term frequency of each term in the collection
    permuterm_index = generate_permuterm_indices(term_freq=term_freq, postings=postings)

    # Open the file and search for the term
    with open("./s2/s2_wildcard.json") as f:
        queries = json.load(f)

    initial_time = 0
    times = []
    for term in tqdm(queries["queries"]):
        logging.info(f"Permuterm Search: Query Term is: {term}")

        permuterm_profiler.enable()
        results_per_query = permuterm_search_on_one_term(
            permuterm_index=permuterm_index,
            postings=postings,
            query=term["query"],
        )
        permuterm_profiler.disable()

        stats = pstats.Stats(permuterm_profiler)
        current_iteration = stats.total_tt - initial_time
        initial_time = stats.total_tt

        times.append([term["query"], current_iteration])

        logging.info(
            f"Profiled {current_iteration} seconds at {index} for {permuterm_search_on_one_term.__name__}"
        )
        logging.info(
            f"Permuterm Search: Length of Results is: {len(results_per_query)}"
        )
        # logging.info(f"Permuterm Search: Result Term is: {results_per_query}")

    return times


@memory_profile
def trie_trial():
    tree_profiler = time_profile.Profile()
    postings, term_freq = load_index_in_memory("./s2/")
    # Here postings is the inverted index
    # term_freq is the term frequency of each term in the collection

    # Create the trie
    trieBasedIndexFromStart, trieBasedIndexFromEnd = generate_trie_indices(
        term_freq=term_freq, postings=postings
    )

    # Open the file and search for the term
    with open("./s2/s2_wildcard.json") as f:
        queries = json.load(f)

    initial_time = 0
    times = []
    for term in tqdm(queries["queries"]):
        tree_profiler.enable()

        tree_based_search(
            start_trie=trieBasedIndexFromStart,
            end_trie=trieBasedIndexFromEnd,
            postings=postings,
            term=term,
        )

        tree_profiler.disable()

        stats = pstats.Stats(tree_profiler)
        current_iteration = stats.total_tt - initial_time
        initial_time = stats.total_tt

        times.append([term["query"], current_iteration])

        logging.info(
            f"Profiled {current_iteration} seconds at {index} for {tree_based_search.__name__}"
        )

    return times


# ENTRYPOINT
if __name__ == "__main__":
    # # PART 3.4.1: PERMUTERM INDEX
    print("::> PART 3.4.1: PERMUTERM INDEX")
    times_p = permuterm_trial()

    # # PART 3.4.2: TREE BASED INDEX
    print("::> PART 3.4.2: TREE BASED INDEX")
    times_t = trie_trial()

    combined_times = []
    for i in range(len(times_p)):
        combined_times.append(
            [
                times_p[i][0],
                times_p[i][1],
                times_t[i][1],
            ]
        )
    pd.DataFrame(combined_times, columns=["Query", "Permuterm", "Trie"]).to_csv(
        "experiments/profiles/experiment4_combined.csv", index=False
    )
