import numpy as np
import indexer
import experiment2


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
    top_doc_ids,
    doc_ids,
    postings,
    alpha=1,
    beta=0.75,
    gamma=0,
):

    top_relevant_doc_ids = top_doc_ids

    relevant_docs_vectors = document_vectors
    vocabulary = list(postings.keys())

    if relevant_docs_vectors:
        centroid_relevant = np.mean(list(relevant_docs_vectors.values()), axis=0)
        total_relevant_docs = len(relevant_docs_vectors)
    else:
        centroid_relevant = np.zeros_like(query_vector)
        total_relevant_docs = 0

    # all_doc_ids = list(doc_ids.keys())
    # non_relevant_doc_ids = [
    #     doc_id for doc_id in all_doc_ids if doc_id not in top_relevant_doc_ids
    # ]
    # non_relevant_docs_vectors = create_document_vectors(
    #     non_relevant_doc_ids, vocabulary, postings
    # )

    # if non_relevant_docs_vectors:
    #     centroid_non_relevant = np.mean(
    #         list(non_relevant_docs_vectors.values()), axis=0
    #     )
    #     total_non_relevant_docs = len(non_relevant_docs_vectors)
    # else:
    #     centroid_non_relevant = np.zeros_like(query_vector)
    #     total_non_relevant_docs = 0

    new_query_vector = (
        query_vector * alpha
        + ((beta * centroid_relevant) / total_relevant_docs)
        # - ((gamma * centroid_non_relevant) / total_non_relevant_docs)
    )

    return new_query_vector


def create_document_vectors(top_doc_ids, vocabulary, postings):
    document_vectors = {}

    for doc_id in top_doc_ids:
        doc_vector = np.zeros(len(vocabulary))

        for term_index, term in enumerate(vocabulary):
            for posting in postings[term]:
                if posting["doc_id"] == doc_id:
                    doc_vector[term_index] = posting["term_freq"]
                    break
        document_vectors[doc_id] = doc_vector

    return document_vectors


if __name__ == "__main__":
    postings, doc_freq, doc_ids = indexer.load_index_in_memory("../../nfcorpus/raw/")

    query = "deep learning neural networks"
    tokens = tokenize_query(query)
    query_tf = calculate_query_tf(tokens)
    query_terms = set(tokens)
    vocabulary = list(postings.keys())
    query_vector = np.zeros(vocabulary.__len__())
    for term in query_terms:
        if term in vocabulary:
            term_index = vocabulary.index(term)
            print(term, term_index)
            query_vector[term_index] = query_tf[term]
    print("hello")
    ranked_results = experiment2.retrieve_documents(query, "ntc")
    top_doc_ids = [doc_id for doc_id, _ in ranked_results[:10]]
    document_vectors = create_document_vectors(top_doc_ids, vocabulary, postings)

    updated_query = rocchio_pseudo_feedback(
        query_vector, document_vectors, top_doc_ids, doc_ids, postings
    )

    print("Original Query Vector:", query_vector)
    print("Updated Query Vector:", updated_query)
