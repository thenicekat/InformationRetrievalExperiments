"""
Learning to Rank models (Total 15, 3 for report).
You should experiment with at least 1 model for pointwise, pairwise, and
list wise approaches. You are free (but not restricted) to use the libraries
referred here for your experiments

Reference: https://medium.com/justeattakeaway-tech/building-a-listwise-ranking-tf-recommender-a-step-by-step-guide-727e572860b8
"""

# This is where we shall code our list wise ltr model

import collections
from datetime import datetime
import logging
import numpy as np
import pandas as pd
import tensorflow as tf
import tensorflow_recommenders as tfrs
import tensorflow_ranking as tfr
from tqdm import tqdm
import indexer


logging.basicConfig(
    level=logging.INFO,
    datefmt="%d-%b-%y %H:%M:%S",
    filename=f"./ltr_logs/{datetime.now().strftime('%d-%m-%Y_%H-%M-%S')}.log",
    filemode="w",
    format="%(asctime)s [%(levelname)s] %(message)s ",
)

BATCH_SIZE = 128

# Read the merged qrel file and delete the column named 'ZERO'
merged_qrel = pd.read_csv('../../nfcorpus/merged.qrel', sep="\t")
del merged_qrel['ZERO']

postings, doc_freq, doc_ids, query_term_id_mapping = indexer.load_index_in_memory('../../nfcorpus/raw/')

# read queries
queries_dev = pd.read_csv('../../nfcorpus/dev.titles.queries', sep="	", names=['QUERY_ID', 'QUERY'])
queries_train = pd.read_csv('../../nfcorpus/train.titles.queries', sep="	", names=['QUERY_ID', 'QUERY'])
queries_test = pd.read_csv('../../nfcorpus/test.titles.queries', sep="	", names=['QUERY_ID', 'QUERY'])

# add them to a single mapping between query id and query
queries = pd.concat([queries_dev, queries_train, queries_test])
del queries_dev, queries_train, queries_test
# convert this into a dict
queries = dict(zip(queries['QUERY_ID'], queries['QUERY']))


relevance_rank = merged_qrel[["QUERY_ID", "DOC_ID", "RELEVANCE"]].copy()
document_ids  = merged_qrel[["DOC_ID"]].copy()

merged_qrel = []

documents = tf.data.Dataset.from_tensor_slices(dict(document_ids))
documents = documents.map(lambda x: x["DOC_ID"])

relevance_rank = tf.data.Dataset.from_tensor_slices(dict(relevance_rank))
relevance_rank = relevance_rank.map(lambda x: {
    "query_id": x["QUERY_ID"],
    "document_id": x["DOC_ID"],
    "relevance": x["RELEVANCE"],
})

# Get the unique queries and documents to create the vocabularies
unique_query_ids = np.unique(np.concatenate(list(relevance_rank.batch(1_000).map(lambda x: x["query_id"]))))
del documents
logging.info("Unique query ids: %d" % len(unique_query_ids))

def _create_feature_dict():
  return {"document_id": [], "relevance": []}

num_list_per_query = 10
num_docs_per_list = 10

document_id_vocab = set()

# we create a dict of query id mapping to a dict of document id and relevance arrays
doc_lists_by_query = collections.defaultdict(_create_feature_dict)
for example in relevance_rank:
    query_id = example["query_id"].numpy()
    doc_lists_by_query[query_id]["document_id"].append(
        example["document_id"])
    doc_lists_by_query[query_id]["relevance"].append(
        int(example["relevance"]))
    document_id_vocab.add(example["document_id"].numpy())

# Create a tensor slice for each query-document pair.
# the slice here is a dict of query_id, document_id and relevance
tensor_slices = {"query": [], "document_id": [], "relevance": []}

for query_id, feature_lists in tqdm(doc_lists_by_query.items()):
  try:
    logging.info(f"Query ID: {query_id.decode('utf-8')}, Query: {queries[query_id.decode('utf-8')]}")
    
    for _ in range(num_list_per_query):
        # Drop the query if they don't have enough diocuments.
        if len(feature_lists["document_id"]) < num_docs_per_list:
            continue
        
        # randomly choose 10 documents
        tensor_slices["query"].append(queries[query_id.decode('utf-8')])
        
        random_indices = np.random.choice(len(feature_lists["document_id"]), num_docs_per_list, replace=False)
        x = tf.stack(np.array(feature_lists["document_id"])[random_indices]) 
        tensor_slices["document_id"].append(x)
        tensor_slices["relevance"].append(tf.stack(np.array(feature_lists["relevance"], dtype=np.float32)[random_indices]))
        
        logging.info(f"Iteration {_}: Reduced to {len(x)} from {len(feature_lists['document_id'])}")
  except Exception as e:
    pass

logging.info("Number of slices: %d" % len(tensor_slices["query"]))
logging.info("Number of unique documents: %d" % len(document_id_vocab))

buffer_size = len(relevance_rank)
dataset = tf.data.Dataset.from_tensor_slices(tensor_slices)

# split into train and test
train_size = int(0.8 * len(dataset))
train = dataset.take(train_size)
test = dataset.skip(train_size)

class LTRModel(tfrs.Model):
  def __init__(self, loss):
    super().__init__()
    embedding_dimension = 256

    # Query embeddings
    # We have a sentence per query
    # convert sentence to embedding
    # use lstm
    self.query_embeddings = tf.keras.Sequential([
      tf.keras.layers.TextVectorization(
        max_tokens=20000,
        vocabulary=list(postings.keys()),
      ),
      tf.keras.layers.Embedding(20002, embedding_dimension),
      tf.keras.layers.GlobalAveragePooling1D(),
    ])

    # Document embeddings
    self.document_embeddings = tf.keras.Sequential([
      tf.keras.layers.StringLookup(
        vocabulary=list(document_id_vocab)),
      tf.keras.layers.Embedding(len(document_id_vocab) + 2, embedding_dimension)
    ])

    # Compute predictions
    self.score_model = tf.keras.Sequential([
      # Learn multiple dense layers.
      tf.keras.layers.Dense(128, activation="relu"),
      tf.keras.layers.Dense(64, activation="relu"),
      tf.keras.layers.Dense(1)
    ])

    self.task = tfrs.tasks.Ranking(
      loss=loss,
      metrics=[
        tfr.keras.metrics.NDCGMetric(name="ndcg_metric"),
        tf.keras.metrics.RootMeanSquaredError()
      ]
    )

  def call(self, features):
    query_embeddings = self.query_embeddings(features["query"])
    logging.info(f"Query embeddings: {query_embeddings.shape}")
    document_embeddings = self.document_embeddings(features["document_id"])
    logging.info(f"Document embeddings: {document_embeddings.shape}")

    # The embeddings are concatenated
    # we get the length of the list of documents
    list_length = features["document_id"].shape[1]
    # repeat the query embedding to match the length of the list
    query_embedding_repeated = tf.repeat(
        tf.expand_dims(query_embeddings, 1), [list_length], axis=1)
    # reshape the query embedding to match the document embedding
  
    # concatenate the query embedding with the document embeddings
    concatenated_embeddings = tf.concat(
        [query_embedding_repeated, document_embeddings], 2)

    return self.score_model(concatenated_embeddings)

  def compute_loss(self, features, training=False):
    labels = features.pop("relevance")
    scores = self(features)
    return self.task(
        labels=labels,
        predictions=tf.squeeze(scores, axis=-1),
    )

cached_train = train.shuffle(1000).batch(8192).cache()

listwise_model = LTRModel(tfr.keras.losses.ListMLELoss())
listwise_model.compile(optimizer=tf.keras.optimizers.Adagrad(0.1))
listwise_model.fit(cached_train, epochs=3, verbose=True)

# Evaluate on test query
query = "What is the best way to cook a turkey"
documents = np.random.choice(list(document_id_vocab), 10)
test_features = {
  "query": tf.constant([query]),
  "document_id": tf.constant([documents]),
}
res = listwise_model(test_features)
res = res.numpy().flatten()
for i in range(10):
    logging.info(f"Document: {documents[i]} | Predicted relevance: {res[i]}")


# save the model
listwise_model.save_weights('./ltr_models/7c')