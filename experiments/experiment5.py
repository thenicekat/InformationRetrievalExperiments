from code_setup import *
from profiling import *
from main import *
from tqdm import tqdm
from experiment3 import *
from experiment4 import *

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

# GENERATE TRIE INDICES
def generate_trie_indices(term_freq: dict):
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
def wildcard_search(start_trie: Trie, end_trie: Trie, postings: dict, term: dict):
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
    logging.info(f"Trie Search: Result Term is: {len(postings_result)}")


def tolerant_retrieval(start_trie: Trie, end_trie: Trie):
    # Open the file and search for the term
    with open("./s2/s2_wildcard_boolean.json") as f:
        queries = json.load(f)

    f_ = open("./s2/intermediate/postings.tsv", encoding="utf-8")
    postings = {}

    for line in f_:
        splitline = line.split("\t")
        token = splitline[0]
        item_list = []

        for item in range(2, len(splitline)):
            item_list.append(splitline[item].strip())
        postings[token] = item_list

    for term in tqdm(queries["queries"]):
        words = term["query"].split()
        final_doc_list = list()
        for w in words:
            if '*' in w:
                # Split the term at the *
                first_half = w.split("*")[0]
                second_half = w.split("*")[1]
                # This will return all the words that start with the first half
                first_half_results = start_trie.starts_with(first_half)
                # This will return reverse of all the words that end with the second half
                second_half_results = end_trie.starts_with(second_half[::-1])
                # reverse all the words in the second half results
                second_half_results = [i[::-1] for i in second_half_results]

                wildcard_words = list(
                    set(first_half_results).intersection(set(second_half_results)))
                wildcard_docs = set()
                for word in wildcard_words:
                    wildcard_docs = wildcard_docs.union(set(postings[word]))
                final_doc_list.append(wildcard_docs)

            else:
                final_doc_list.append(set(postings[w]))

        result = set(final_doc_list[0])
        for i in range(1,len(final_doc_list)):
            result = result.intersection(final_doc_list[i])

        result = list(result)
        

                

        

# ENTRYPOINT
if __name__ == "__main__":
    postings, term_freq = load_index_in_memory("./s2/")
    trieBasedIndex = generate_trie_indices()