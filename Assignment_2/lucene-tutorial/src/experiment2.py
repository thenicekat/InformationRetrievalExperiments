import math
import indexer


def tokenize_query(query):
    return query.lower().split()


def calculate_query_tf(tokens):
    query_tf = {}
    for term in tokens:
        if term in query_tf:
            query_tf[term] += 1
        else:
            query_tf[term] = 1
    return query_tf

def calculate_nnn_vectors(tokens, field, postings,doc_ids):
    query_terms = set(tokens)
    document_vectors = []
    # for docs_id in doc_ids.keys():
    #     doc_vector = {"doc_id": docs_id, "vector": {}}
    #     document_vectors.append(doc_vector)
    for term in query_terms:
        if term in postings:
            for posting in postings[term]:
                doc_id = posting["doc_id"]
                term_freq = posting["term_freq"]

                doc_vector = next(
                    (doc for doc in document_vectors if doc["doc_id"] == doc_id), None
                )
                if doc_vector is None:
                    doc_vector = {"doc_id": doc_id, "vector": {}}
                    document_vectors.append(doc_vector)

                doc_vector["vector"][term] = term_freq

    query_tf = calculate_query_tf(tokens)
    query_vector = {term: query_tf[term] for term in query_terms}
    similarities = calculate_similarity(query_vector, document_vectors)
    return similarities


def calculate_ntn_vectors(tokens, field, postings, num_documents, doc_freq,doc_ids):
    query_terms = set(tokens)
    document_vectors = []
    for docs_id in doc_ids.keys():
        doc_vector = {"doc_id": docs_id, "vector": {}}
        document_vectors.append(doc_vector)

    term_idf = {term: math.log(num_documents / doc_freq[term]) for term in query_terms}

    for term in query_terms:
        if term in postings:
            for posting in postings[term]:
                doc_id = posting["doc_id"]
                tf = posting["term_freq"]
                if not any(d["doc_id"] == doc_id for d in document_vectors):
                    document_vectors.append(
                        {"doc_id": doc_id, "vector": {term: tf * term_idf[term]}}
                    )

    query_tf = calculate_query_tf(tokens)
    query_vector = {term: query_tf[term] * term_idf[term] * 1 for term in query_terms}

    similarities = calculate_similarity(query_vector, document_vectors)
    return similarities


def calculate_ntc_vectors(tokens, field, postings, num_documents, doc_freq,doc_ids):
    query_terms = set(tokens)
    document_vectors = []
    for docs_id in doc_ids.keys():
        doc_vector = {"doc_id": docs_id, "vector": {}}
        document_vectors.append(doc_vector)

    term_idf = {term: math.log(num_documents / doc_freq[term]) for term in query_terms}

    for term in query_terms:
        if term in postings:
            for posting in postings[term]:
                doc_id = posting["doc_id"]
                tf = posting["term_freq"]
                if not any(d["doc_id"] == doc_id for d in document_vectors):
                    document_vectors.append(
                        {"doc_id": doc_id, "vector": {term: tf * term_idf[term]}}
                    )

    query_tf = calculate_query_tf(tokens)
    query_vector = {term: query_tf[term] * term_idf[term] * 1 for term in query_terms}

    similarities = calculate_cos_similarity(query_vector, document_vectors)
    return similarities


def calculate_cos_similarity(query_vector, document_vectors):
    query_terms = set(query_vector.keys())
    similarities = []
    for doc_entry in document_vectors:
        doc_id = doc_entry["doc_id"]
        doc_vector = doc_entry["vector"]
        dot_product = sum(
            query_vector[term] * doc_vector.get(term, 0) for term in query_terms
        )

        query_norm = math.sqrt(sum(value**2 for value in query_vector.values()))
        doc_norm = math.sqrt(sum(value**2 for value in doc_vector.values()))

        if query_norm > 0 and doc_norm > 0:
            similarity_score = dot_product / (query_norm * doc_norm)
        else:
            similarity_score = 0.0

        similarities.append((doc_id, float(similarity_score)))

    return similarities


def calculate_similarity(query_vector, document_vectors):
    query_terms = query_vector.keys()
    similarities = []

    for doc_entry in document_vectors:
        doc_vector = doc_entry["vector"]

        dot_product = sum(
            query_vector[term] * doc_vector.get(term, 0) for term in query_terms
        )

        similarities.append((doc_entry["doc_id"], float(dot_product)))

    return similarities

def retrieve_documents(query, notation="ntc", field="abstract"):
    postings, doc_freq, doc_ids = indexer.load_index_in_memory("../../nfcorpus/raw/")
    num_documents = doc_ids.__len__()

    tokens = tokenize_query(query)

    if notation == "nnn":
        similarities = calculate_nnn_vectors(tokens, field, postings,doc_ids)
    elif notation == "ntn":
        similarities = calculate_ntn_vectors(
            tokens, field, postings, num_documents, doc_freq,doc_ids
        )
    elif notation == "ntc":
        similarities = calculate_ntc_vectors(
            tokens, field, postings, num_documents, doc_freq,doc_ids
        )
    else:
        raise ValueError("Invalid notation type. Choose 'nnn', 'ntn', or 'ntc'.")


    ranked_documents = sorted(similarities, key=lambda x: x[1], reverse=True)
    return ranked_documents


if __name__ == "__main__":
    query_string = "PLAIN-1119"
    notation_type = "nnn"

    ranked_results = retrieve_documents(query_string, notation_type)

    for rank, (doc_id, similarity) in enumerate(ranked_results, 1):
        print(f"Rank {rank}: Document {doc_id}, Similarity Score: {similarity:.4f}")
