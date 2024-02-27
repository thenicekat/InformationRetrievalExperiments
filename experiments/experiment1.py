from code_setup import *
from profiling import *
from main import *
import json
from tqdm import tqdm
import subprocess
import pandas as pd


def custom_and_query(query_terms, postings, doc_freq):
    # postings for only the query terms
    postings_for_keywords = {}
    doc_freq_for_keywords = {}

    for q in query_terms:
        postings_for_keywords[q] = postings[q]

    # store doc frequency for query token in
    # dictionary

    for q in query_terms:
        doc_freq_for_keywords[q] = doc_freq[q]

    # sort tokens in increasing order of their
    # frequencies

    sorted_tokens = sorted(doc_freq_for_keywords.items(), key=lambda x: x[1])

    # initialize result to postings list of the
    # token with minimum doc frequency

    result = postings_for_keywords[sorted_tokens[0][0]]

    # iterate over the remaining postings list and
    # intersect them with result, and updating it
    # in every step

    for i in range(1, len(postings_for_keywords)):
        result = intersection(result, postings_for_keywords[sorted_tokens[i][0]])
        if len(result) == 0:
            return result

    return result


# This is doing grep boolean retrieval for a single query
def grep_boolean_retrieval_single_query(query: str):
    try:
        doc_count = 0
        for keyword in query.split(" "):
            command = f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.tsv"
            subprocess.run(
                command,
                shell=True,
                check=True,
                stdout=subprocess.PIPE,
            )
            doc_count += 1

        if doc_count == 1:
            return
        command = f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.tsv' for i in range(doc_count))} > experiments/experiment1_temp/common.tsv"
        subprocess.run(
            command,
            shell=True,
            check=True,
            stdout=subprocess.PIPE,
        )
    except subprocess.CalledProcessError:
        print(f"Error with query: {query}")


# This is doing non-grep boolean retrieval for all queries
def non_grep_boolean_retrieval_single_query(query: str, postings, doc_freq):
    try:
        output = custom_and_query(query.split(" "), postings, doc_freq)
        return output
    except KeyError:
        print(f"Error with query: {query}")
        return []


@memory_profile
def compare_grep_non_grep():
    postings, doc_freq = load_index_in_memory("s2/")

    with open("s2/s2_query.json") as f:
        queries = [i["query"] for i in json.load(f)["queries"]]

    # Temporary directory for storing the output of grep
    os.makedirs("experiments/experiment1_temp", exist_ok=True)

    grep_profiler = time_profile.Profile()
    non_grep_profiler = time_profile.Profile()

    grep_time = 0
    non_grep_time = 0

    results = []

    for query in tqdm(queries):
        logging.info(f"Query: {query}")

        non_grep_profiler.enable()
        non_grep_boolean_retrieval_single_query(query, postings, doc_freq)
        non_grep_profiler.disable()
        stats = pstats.Stats(non_grep_profiler)
        non_grep_current_iteration = stats.total_tt - non_grep_time
        non_grep_time = stats.total_tt

        logging.info(
            f"Profiled {non_grep_current_iteration} seconds at {index} for {non_grep_boolean_retrieval_single_query.__name__}"
        )

        grep_profiler.enable()
        grep_boolean_retrieval_single_query(query)
        grep_profiler.disable()
        stats = pstats.Stats(grep_profiler)
        grep_current_iteration = stats.total_tt - grep_time
        grep_time = stats.total_tt

        logging.info(
            f"Profiled {grep_current_iteration} seconds at {index} for {grep_boolean_retrieval_single_query.__name__}"
        )

        results.append([query, non_grep_current_iteration, grep_current_iteration])
    pd.DataFrame(results).to_csv(
        "experiments/profiles/experiment1_combined.csv",
        index=False,
        header=["Query", "Non-Grep Time", "Grep Time"],
    )


if __name__ == "__main__":
    print(
        "\n::> PART 3.1: Compare hash-based boolean retrieval with grep-based boolean retrieval\n"
    )
    compare_grep_non_grep()
