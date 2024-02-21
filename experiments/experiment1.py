import code_setup
from profiling import *
from main import *
import json
from tqdm import tqdm
import subprocess
import pandas as pd


def grep_boolean_retrieval():
    with open("s2/s2_query.json") as f:
        queries = [i["query"] for i in json.load(f)["queries"]]
    
    os.makedirs("experiments/experiment1_temp", exist_ok=True)

    for q in tqdm(queries[:1]):
        try:
            doc_count = 0
            for keyword in q.split(" "):
                subprocess.run(
                    f"grep '{keyword}' s2/intermediate/doc_to_tsv.tsv > experiments/experiment1_temp/output{doc_count}.txt",
                    shell=True,
                    check=True,
                    stdout=subprocess.PIPE,
                )
                doc_count += 1
            subprocess.run(
                # f"cat {' '.join(f'experiments/experiment1_temp/output{i}.txt' for i in range(doc_count))} | grep -Eo '[[:alnum:]]+' | sort | uniq -c | sort -rn | sed 1q > experiments/experiment1_temp/common.txt",
                f"grep -Fx -f {' '.join(f'experiments/experiment1_temp/output{i}.txt' for i in range(1, doc_count))} experiments/experiment1_temp/output0.txt > experiments/experiment1_temp/common.txt",
                shell=True,
                check=True,
                stdout=subprocess.PIPE,
            )
        except subprocess.CalledProcessError:
            print(f"Error with query: {q}")

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

def boolean_retrieval_single_query(query: str):
    try:
        output = and_query(query.split(" "), "s2/")
    except KeyError:
        print(f"Error with query: {query}")

def boolean_retrieval():
    with open("s2/s2_query.json") as f:
        queries = [i["query"] for i in json.load(f)["queries"]]

    for q in tqdm(queries):
        try:
            output = and_query(q.split(" "), "s2/")
            print(output)
        except KeyError:
            print(f"Error with query: {q}")

if __name__ == "__main__":
    with open("s2/s2_query.json") as f:
        queries = [i["query"] for i in json.load(f)["queries"]]

    os.makedirs("experiments/experiment1_temp", exist_ok=True)
    profiler = time_profile.Profile()
    initial_time = 0
    times = []
    for query in tqdm(queries):
        profiler.enable()
        grep_boolean_retrieval_single_query(query)
        profiler.disable()
        stats = pstats.Stats(profiler)
        current_iteration = stats.total_tt - initial_time
        initial_time = stats.total_tt

        times.append([query, current_iteration])
    pd.DataFrame(times).to_csv(
        "experiments/profiles/experiment1.csv", index=False, header=["Query", "Time"]
    )


