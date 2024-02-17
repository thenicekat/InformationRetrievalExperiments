grep -P '^deep\s' ../s2/intermediate/postings.tsv > deep.txt
grep -P '^learning\s' ../s2/intermediate/postings.tsv > learning.txt
cat deep.txt learning.txt | grep -Eo '[[:alnum:]]+' | sort | uniq -c | sort -rn | sed 1q > common.txt