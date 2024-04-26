import numpy as np
import indexer
import experiment2
from tqdm import tqdm


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


def rocchio_pseudo_feedback(
    query_vector,
    document_vectors,
    top_relevant_doc_ids,
    doc_ids,
    postings,
    alpha=1,
    beta=0.75,
    gamma=0,
):

    # relevant_docs_vectors = document_vectors
    relevant_docs_vectors = {}
    for doc_id in top_relevant_doc_ids:
        if doc_id in document_vectors:
            relevant_docs_vectors[doc_id] = document_vectors[doc_id]

    vocabulary = list(postings.keys())

    if relevant_docs_vectors:
        centroid_relevant = np.mean(list(relevant_docs_vectors.values()), axis=0)
        total_relevant_docs = len(relevant_docs_vectors)
    else:
        centroid_relevant = np.zeros_like(query_vector)
        total_relevant_docs = 0

    all_doc_ids = list(doc_ids.keys())
    non_relevant_doc_ids = [
        doc_id for doc_id in all_doc_ids if doc_id not in top_relevant_doc_ids
    ]
    non_relevant_docs_vectors = {}
    for doc_id in non_relevant_doc_ids:
        if doc_id in document_vectors:
            non_relevant_docs_vectors[doc_id] = document_vectors[doc_id]

    if non_relevant_docs_vectors:
        centroid_non_relevant = np.mean(
            list(non_relevant_docs_vectors.values()), axis=0
        )
        total_non_relevant_docs = len(non_relevant_docs_vectors)
    else:
        centroid_non_relevant = np.zeros_like(query_vector)
        total_non_relevant_docs = 0

    new_query_vector = (
        query_vector * alpha
        + ((beta * centroid_relevant) / total_relevant_docs)
        - ((gamma * centroid_non_relevant) / total_non_relevant_docs)
    )

    return new_query_vector


def create_document_vectors(top_doc_ids, vocabulary, postings):
    document_vectors = {}

    for doc_id in tqdm(top_doc_ids, desc="Creating Document Vectors"):
        doc_vector = np.zeros(len(vocabulary))

        for term_index, term in enumerate(vocabulary):
            for posting in postings[term]:
                if posting["doc_id"] == doc_id:
                    doc_vector[term_index] = posting["term_freq"]
                    break
        document_vectors[doc_id] = doc_vector

    return document_vectors


def calculate_similarity(query_vector, document_vectors):
    similarities = []

    for doc_id, doc_vector in document_vectors.items():
        dot_product = np.dot(query_vector, doc_vector)
        similarities.append((doc_id, float(dot_product)))

    ranked_documents = sorted(similarities, key=lambda x: x[1], reverse=True)

    return ranked_documents


# if __name__ == "__main__":
#     postings, doc_freq, doc_ids = indexer.load_index_in_memory("../../nfcorpus/raw/")

#     query = "easter island"
#     tokens = tokenize_query(query)
#     query_tf = calculate_query_tf(tokens)
#     query_terms = set(tokens)
#     vocabulary = list(postings.keys())
#     query_vector = np.zeros(vocabulary.__len__())
#     for term in query_terms:
#         if term in vocabulary:
#             term_index = vocabulary.index(term)
#             print(term, term_index)
#             query_vector[term_index] = query_tf[term]
#     print("hello")
#     document_vectors = create_document_vectors(doc_ids, vocabulary, postings)
#     ranked_results = calculate_similarity(query_vector, document_vectors)
#     top_doc_ids = [doc_id for doc_id, _ in ranked_results[:10]]

#     updated_query = rocchio_pseudo_feedback(
#         query_vector, document_vectors, top_doc_ids, doc_ids, postings
#     )
#     ranked_results = calculate_similarity(updated_query, document_vectors)

#     # print("Original Query Vector:", query_vector)
#     # print("Updated Query Vector:", updated_query)
#     for rank, (doc_id, similarity) in enumerate(ranked_results, 1):
#         print(f"Rank {rank}: Document {doc_id}, Similarity Score: {similarity:.4f}")


def load_document_vectors(file_path):
    document_vectors = {}
    with open(file_path, "r") as file:
        for line in file:
            parts = line.strip().split(" ")
            doc_id = parts[0]
            vector_values = list(map(float, parts[1:]))
            document_vectors[doc_id] = np.array(vector_values)
    return document_vectors


if __name__ == "__main__":

    input_file = "../../nfcorpus/dev.vid-titles.queries"
    output_file = "output_rocchio_before.txt"
    file_path = "document_vectors.txt"
    postings, doc_freq, doc_ids = indexer.load_index_in_memory("../../nfcorpus/raw/")
    vocabulary = list(postings.keys())
    document_vectors = create_document_vectors(doc_ids, vocabulary, postings)
    # document_vectors = load_document_vectors(file_path)
    print("hi")

    with open(input_file, "r") as f_in, open(output_file, "w") as f_out:
        for line in tqdm(f_in, desc="Processing Queries"):
            parts = line.strip().split("\t")
            if len(parts) != 2:
                continue

            query_id, query = parts[0], parts[1]
            tokens = tokenize_query(query)
            query_tf = calculate_query_tf(tokens)
            query_terms = set(tokens)
            query_vector = np.zeros(vocabulary.__len__())
            for term in query_terms:
                if term in vocabulary:
                    term_index = vocabulary.index(term)
                    query_vector[term_index] = query_tf[term]
            ranked_results = calculate_similarity(query_vector, document_vectors)
            top_doc_ids = [doc_id for doc_id, _ in ranked_results[:10]]

            updated_query = rocchio_pseudo_feedback(
                query_vector, document_vectors, top_doc_ids, doc_ids, postings
            )
            ranked_results = calculate_similarity(updated_query, document_vectors)
            for rank, (doc_id, similarity) in enumerate(ranked_results, 1):
                output_line = (
                    f"{query_id} Q0 {doc_id} {rank} {similarity:.6f} STANDARD\n"
                )
                f_out.write(output_line)

    print(f"Results written to {output_file}")
