# region Setup dirs
import os
import sys
sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
os.chdir('..')
# endregion

from main import *
import json
from tqdm import tqdm

with open('s2/s2_query.json') as f:
    queries = [i['query'] for i in json.load(f)['queries']]

for q in tqdm(queries):
    try:
        and_query(q.split(' '), 's2/')
    except KeyError:
        print(f'Error with query: {q}')