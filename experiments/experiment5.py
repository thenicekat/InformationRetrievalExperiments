from code_setup import *
from profiling import *
from main import *
from tqdm import tqdm
from experiment4 import *


# @memory_profile
def tolerant_retrieval():
    tolerant_profile = time_profile.Profile()

    # Open the file and search for the term
    with open("./s2/s2_wildcard_boolean.json") as f:
        queries = json.load(f)

    postings, term_freq = load_index_in_memory("./s2/")
    threshold = 2

    start_trie, end_trie = generate_trie_indices(term_freq=term_freq, postings=postings)

    initial_time = 0
    times = []

    for query_ in tqdm(queries["queries"]):
        logging.info(f"Query: {query_}")

        tolerant_profile.enable()

        words = query_["query"].split()
        final_doc_list = list()

        for w in words:
            if "*" in w:
                logging.info(f"::> Wildcard Term: {w}")
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
                    set(first_half_results).intersection(set(second_half_results))
                )
                wildcard_docs = set()
                for word in wildcard_words:
                    wildcard_docs = wildcard_docs.union(set(postings[word]))
                # logging.info(f"::> Docs: {wildcard_docs}")
                final_doc_list.append(wildcard_docs)

            else:
                logging.info(f"::> Non Wildcard Term: {w}")
                docs = set()
                for term in postings:
                    if (
                        edit_distance(w, term) <= threshold
                        and abs(len(w) - len(term)) <= 1
                    ):
                        logging.info(
                            f"::> Non Wildcard Term that's closer to this: {term}"
                        )
                        # logging.info(f"::> Docs: {postings[term][0]}")
                        docs = docs.union(set(postings[term]))
                # logging.info(f"::> Docs: {docs}")
                final_doc_list.append(docs)

        result = set(final_doc_list[0])
        for i in range(1, len(final_doc_list)):
            result = result.intersection(final_doc_list[i])

        result = list(result)

        tolerant_profile.disable()

        stats = pstats.Stats(tolerant_profile)
        current_iteration = stats.total_tt - initial_time
        initial_time = stats.total_tt

        times.append([query_, current_iteration])

        logging.info(
            f"Profiled {current_iteration} seconds at {index} for Tolerant Retrieval"
        )

    pd.DataFrame(times).to_csv("experiment5.csv", index=False, header=["Query", "Time"])


def edit_distance(word1, word2):
    m, n = len(word1), len(word2)
    # Initialize an m x n matrix
    dp = [[0] * (n + 1) for _ in range(m + 1)]

    # Initialize the first row and column
    for i in range(m + 1):
        dp[i][0] = i
    for j in range(n + 1):
        dp[0][j] = j

    # Fill in the matrix
    for i in range(1, m + 1):
        for j in range(1, n + 1):
            cost = (
                0 if word1[i - 1] == word2[j - 1] else 2
            )  # cost for substitution is 2
            dp[i][j] = min(
                dp[i - 1][j] + 1,  # Deletion
                dp[i][j - 1] + 1,  # Insertion
                dp[i - 1][j - 1] + cost,
            )  # Substitution

    # Return the bottom-right cell of the matrix
    return dp[m][n]


# ENTRYPOINT
if __name__ == "__main__":
    tolerant_retrieval()
