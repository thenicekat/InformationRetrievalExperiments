from code_setup import *
from profiling import *
from main import *
from tqdm import tqdm


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
def tree_based_search(trie: Trie):

    # Open the file and search for the term
    with open("./s2/s2_query.json") as f:
        queries = json.load(f)

    for term in tqdm(queries["queries"]):
        # Split the term at the *
        # words = term["query"].split()
        result = trie.boolean_retrieval_multiple_words(term["query"])


# ENTRYPOINT
if __name__ == "__main__":
    # # PART 3.3.1: TREE BASED INDEX
    print("::> PART 3.3.1: TREE BASED INDEX")
    trieBasedIndex = generate_trie_indices()
    # result = trieBasedIndex.search_multiple_words("if")
    # print(result)
    tree_based_search(trieBasedIndex)
