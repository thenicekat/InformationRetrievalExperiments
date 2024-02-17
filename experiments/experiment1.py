import code_setup
from profiling import *
from main import *
import json
from tqdm import tqdm
import subprocess


def grep_boolean_retrieval():
    with open("s2/s2_query.json") as f:
        queries = [i["query"] for i in json.load(f)["queries"]]
    
    os.makedirs("experiments/experiment1_temp", exist_ok=True)

    for q in tqdm(queries):
        try:
            doc_count = 0
            for keyword in q.split(" "):
                subprocess.run(
                    f"grep '^{keyword}\s' s2/intermediate/postings.tsv > experiments/experiment1_temp/output{doc_count}.txt",
                    shell=True,
                    check=True,
                    stdout=subprocess.PIPE,
                )
                doc_count += 1
            subprocess.run(
                f"cat {' '.join(f'experiments/experiment1_temp/output{i}.txt' for i in range(doc_count))} | grep -Eo '[[:alnum:]]+' | sort | uniq -c | sort -rn | sed 1q > experiments/experiment1_temp/common.txt",
                shell=True,
                check=True,
                stdout=subprocess.PIPE,
            )
        except subprocess.CalledProcessError:
            print(f"Error with query: {q}")

def grep_boolean_retrieval_time():
    with open("s2/s2_query.json") as f:
        queries = [i["query"] for i in json.load(f)["queries"]]
    
    os.makedirs("experiments/experiment1_temp", exist_ok=True)

    for q in queries:
        try:
            doc_count = 0
            for keyword in q.split(" "):
                subprocess.run(
                    f"grep '^{keyword}\s' s2/intermediate/postings.tsv > experiments/experiment1_temp/output{doc_count}.txt",
                    shell=True,
                    check=True,
                    stdout=subprocess.PIPE,
                )
                doc_count += 1
            subprocess.run(
                f"cat {' '.join(f'experiments/experiment1_temp/output{i}.txt' for i in range(doc_count))} | grep -Eo '[[:alnum:]]+' | sort | uniq -c | sort -rn | sed 1q > experiments/experiment1_temp/common.txt",
                shell=True,
                check=True,
                stdout=subprocess.PIPE,
            )
        except subprocess.CalledProcessError:
            print(f"Error with query: {q}")

@memory_profile
def grep_boolean_retrieval_memory():
    with open("s2/s2_query.json") as f:
        queries = [i["query"] for i in json.load(f)["queries"]]
    
    os.makedirs("experiments/experiment1_temp", exist_ok=True)

    for q in queries:
        try:
            doc_count = 0
            for keyword in q.split(" "):
                subprocess.run(
                    f"grep '^{keyword}\s' s2/intermediate/postings.tsv > experiments/experiment1_temp/output{doc_count}.txt",
                    shell=True,
                    check=True,
                    stdout=subprocess.PIPE,
                )
                doc_count += 1
            subprocess.run(
                f"cat {' '.join(f'experiments/experiment1_temp/output{i}.txt' for i in range(doc_count))} | grep -Eo '[[:alnum:]]+' | sort | uniq -c | sort -rn | sed 1q > experiments/experiment1_temp/common.txt",
                shell=True,
                check=True,
                stdout=subprocess.PIPE,
            )
        except subprocess.CalledProcessError:
            print(f"Error with query: {q}")


def boolean_retrieval():
    with open("s2/s2_query.json") as f:
        queries = [i["query"] for i in json.load(f)["queries"]]

    for q in tqdm(queries):
        try:
            output = and_query(q.split(" "), "s2/")
            print(output)
        except KeyError:
            print(f"Error with query: {q}")


@memory_profile
def boolean_retrieval_memory_profile():
    with open("s2/s2_query.json") as f:
        queries = [i["query"] for i in json.load(f)["queries"]]

    for q in queries:
        try:
            and_query(q.split(" "), "s2/")
        except KeyError:
            print(f"Error with query: {q}")


def boolean_retrieval_time_profile():
    with open("s2/s2_query.json") as f:
        queries = [i["query"] for i in json.load(f)["queries"]]

    for q in queries:
        try:
            and_query(q.split(" "), "s2/")
        except KeyError:
            print(f"Error with query: {q}")


if __name__ == "__main__":
    time_profile.run("grep_boolean_retrieval_time()")
