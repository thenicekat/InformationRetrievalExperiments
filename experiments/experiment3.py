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


# GENERATE TRIE INDICES
def generate_trie_indices():
    postings, term_freq = load_index_in_memory("./s2/")
    # Here postings is the inverted index
    # term_freq is the term frequency of each term in the collection
    # Create a trie based index
    trieBasedIndex = Trie()
    # We can create a trie based index for each term in the collection
    # so like if we have a term "hello" we can create a trie based index for it
    # we store h->e->l->l->o and map it to the term "hello"
    for term in term_freq:
        trieBasedIndex.insert(term, postings[term])
    return trieBasedIndex


# TREE BASED SEARCH
@memory_profile
def Compare_hash_based_and_tree_based_search():
    tree_profiler = time_profile.Profile()
    hash_profiler = time_profile.Profile()

    trie = generate_trie_indices()

    # Open the file and search for the term
    with open("./s2/s2_query.json") as f:
        queries = json.load(f)

    initial_tree_time = 0
    initial_hash_time = 0

    results = []
    for term in tqdm(queries["queries"]):
        logging.info(f"Query: {term['query']}")

        tree_profiler.enable()
        tree_result = trie.boolean_retrieval_multiple_words(term["query"])
        tree_profiler.disable()
        logging.info(f"Tree-based result: {len(tree_result)}")

        tree_stats = pstats.Stats(tree_profiler)
        tree_time = tree_stats.total_tt - initial_tree_time
        initial_tree_time = tree_stats.total_tt

        logging.info(
            f"Profiled {tree_time} seconds at {index} for {trie.boolean_retrieval_multiple_words.__name__}"
        )

        hash_profiler.enable()

        try:
            output = and_query(term["query"].split(" "), "s2/")
            logging.info(f"Hash-based result: {len(output)}")
        except KeyError:
            print(f"Error with query: {term['query']}")

        hash_profiler.disable()

        hash_stats = pstats.Stats(hash_profiler)
        hash_time = hash_stats.total_tt - initial_hash_time
        initial_hash_time = hash_stats.total_tt

        logging.info(
            f"Profiled {hash_time} seconds at {index} for {and_query.__name__}"
        )

        results.append([term["query"], tree_time, hash_time])
    df = pd.DataFrame(results, columns=["Query", "Tree_based", "Hash_based"])
    df.to_csv("experiment3_combined.csv", index=False)


# ENTRYPOINT
if __name__ == "__main__":
    # # PART 3.3: Compare hash-based and tree-based implementation of dictionaries
    print(
        "::> PART 3.3: Compare hash-based and tree-based implementation of dictionaries"
    )
    Compare_hash_based_and_tree_based_search()
