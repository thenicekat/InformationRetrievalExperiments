import math
import indexer


# Function to tokenize a query string into terms
def tokenize_query(query):
    return query.lower().split()  # Split query string into lowercase terms


# Function to calculate query term frequencies (TF)
def calculate_query_tf(tokens):
    query_tf = {}
    for term in tokens:
        if term in query_tf:
            query_tf[term] += 1
        else:
            query_tf[term] = 1
    return query_tf


# Function to calculate nnn (binary representation) vectors for documents and query
def calculate_nnn_vectors(tokens, field, postings):
    query_terms = set(tokens)
    document_vectors = []

    # Iterate over each term in the query
    for term in query_terms:
        if term in postings:
            # Fetch postings list for the term
            for posting in postings[term]:
                doc_id = posting["doc_id"]
                term_freq = posting["term_freq"]

                # Check if document vector already exists for the document ID
                doc_vector = next(
                    (doc for doc in document_vectors if doc["doc_id"] == doc_id), None
                )
                if doc_vector is None:
                    # Initialize document vector if not present
                    doc_vector = {"doc_id": doc_id, "vector": {}}
                    document_vectors.append(doc_vector)

                # Set term frequency in the document vector
                doc_vector["vector"][term] = term_freq

    # Calculate query term frequencies (TF) for the query vector
    query_tf = calculate_query_tf(tokens)
    query_vector = {term: query_tf[term] for term in query_terms}
    similarities = calculate_similarity(query_vector, document_vectors)
    return similarities


# Function to calculate ntn (TF * IDF * 1) vectors for documents and query
def calculate_ntn_vectors(tokens, field, postings, num_documents, doc_freq):
    query_terms = set(tokens)
    document_vectors = []

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


# Function to calculate ntc (TF * IDF) vectors for documents and query
def calculate_ntc_vectors(tokens, field, postings, num_documents, doc_freq):
    query_terms = set(tokens)
    document_vectors = []

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

    # Calculate similarities between query vector and each document vector
    similarities = []
    for doc_entry in document_vectors:
        doc_id = doc_entry["doc_id"]
        doc_vector = doc_entry["vector"]

        # Calculate dot product (sum of products of corresponding entries in query and document vectors)
        dot_product = sum(
            query_vector[term] * doc_vector.get(term, 0) for term in query_terms
        )

        # Calculate norms (Euclidean lengths) of query vector and document vector
        query_norm = math.sqrt(sum(value**2 for value in query_vector.values()))
        doc_norm = math.sqrt(sum(value**2 for value in doc_vector.values()))

        # Calculate cosine similarity score
        if query_norm > 0 and doc_norm > 0:
            similarity_score = dot_product / (query_norm * doc_norm)
        else:
            similarity_score = 0.0  # Handle zero division case if norms are zero

        # Append document ID and similarity score to similarities list
        similarities.append((doc_id, float(similarity_score)))

    return similarities


# Function to calculate cosine similarity between query vector and document vectors
def calculate_similarity(query_vector, document_vectors):
    query_terms = query_vector.keys()
    similarities = []

    # Iterate over each document vector
    for doc_entry in document_vectors:
        doc_vector = doc_entry["vector"]

        # Calculate dot product (sum of products of corresponding entries in query and document vectors)
        dot_product = sum(
            query_vector[term] * doc_vector.get(term, 0) for term in query_terms
        )

        # Append document ID and similarity score (dot product) to similarities list
        similarities.append((doc_entry["doc_id"], float(dot_product)))

    return similarities


# Main function to retrieve and rank documents based on cosine similarity with the query
def retrieve_documents(query, notation="ntc", field="abstract"):
    # Load index data into memory
    postings, doc_freq, doc_ids = indexer.load_index_in_memory("../../nfcorpus/raw/")
    num_documents = doc_ids.__len__()

    tokens = tokenize_query(query)

    if notation == "nnn":
        similarities = calculate_nnn_vectors(tokens, field, postings)
    elif notation == "ntn":
        similarities = calculate_ntn_vectors(
            tokens, field, postings, num_documents, doc_freq
        )
    elif notation == "ntc":
        similarities = calculate_ntc_vectors(
            tokens, field, postings, num_documents, doc_freq
        )
    else:
        raise ValueError("Invalid notation type. Choose 'nnn', 'ntn', or 'ntc'.")

    # Rank documents by similarity (descending order)
    ranked_documents = sorted(similarities, key=lambda x: x[1], reverse=True)
    return ranked_documents


# Example usage
query_string = "birth weight"  # Input query string
notation_type = "nnn"  # Choose the notation type: 'nnn', 'ntn', or 'ntc'

# Retrieve and rank documents based on cosine similarity with the query
ranked_results = retrieve_documents(query_string, notation_type)

# Print ranked documents based on similarity score
for rank, (doc_id, similarity) in enumerate(ranked_results, 1):
    print(f"Rank {rank}: Document {doc_id}, Similarity Score: {similarity:.4f}")