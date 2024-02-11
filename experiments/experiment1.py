import path_setup
from profiling import *

from main import *
import json
from tqdm import tqdm

def boolean_retrieval():
    with open('s2/s2_query.json') as f:
        queries = [i['query'] for i in json.load(f)['queries']]

    for q in tqdm(queries):
        try:
            and_query(q.split(' '), 's2/')
        except KeyError:
            print(f'Error with query: {q}')

@memory_profile
def boolean_retrieval_memory_profile():
    with open('s2/s2_query.json') as f:
        queries = [i['query'] for i in json.load(f)['queries']]

    for q in queries:
        try:
            and_query(q.split(' '), 's2/')
        except KeyError:
            print(f'Error with query: {q}')

def boolean_retrieval_time_profile():
    with open('s2/s2_query.json') as f:
        queries = [i['query'] for i in json.load(f)['queries']]

    for q in queries:
        try:
            and_query(q.split(' '), 's2/')
        except KeyError:
            print(f'Error with query: {q}')

if __name__ == "__main__":
    # time_profile.run('boolean_retrieval_time_profile()')
    boolean_retrieval_memory_profile()