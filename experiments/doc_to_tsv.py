import json
import code_setup

output = []
with open("s2/s2_doc.json") as f:
    json_data = json.load(f)

for i in json_data['all_papers']:
    output.append(f"{i['docno']}\t{''.join(i['title'])}\t{''.join(i['paperAbstract'])}")
    # output.append(f"{i['docno']}\t{''.join(i['title'])}")

with open("s2/intermediate/doc_to_tsv.tsv", "w") as f:
    f.write("\n".join(output))