import nltk
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer, WordNetLemmatizer
import code_setup
from tqdm import tqdm
from profiling import *

# Download necessary NLTK data
nltk.download('stopwords')
nltk.download('wordnet')

# Initialize stemmer, lemmatizer and stop words
stemmer = PorterStemmer()
lemmatizer = WordNetLemmatizer()
stop_words = set(stopwords.words('english'))

def get_terms() -> list[str]:
    with open('s2/intermediate/postings.tsv') as f:
        return [i.split("\t")[0] for i in f.read().splitlines()]

def process_all_terms(vocabulary: list[str]):
    processed_vocabulary = []

    for word in tqdm(vocabulary):
        # Remove stop words
        if word not in stop_words:
            # Perform stemming
            stemmed_word = stemmer.stem(word)
            # Perform lemmatization
            lemmatized_word = lemmatizer.lemmatize(stemmed_word)
            processed_vocabulary.append(lemmatized_word)

    return processed_vocabulary

@memory_profile
def process_all_terms_memory(vocabulary: list[str]):
    processed_vocabulary = []

    for word in vocabulary:
        # Remove stop words
        if word not in stop_words:
            # Perform stemming
            stemmed_word = stemmer.stem(word)
            # Perform lemmatization
            lemmatized_word = lemmatizer.lemmatize(stemmed_word)
            processed_vocabulary.append(lemmatized_word)

    return processed_vocabulary

def process_all_terms_time(vocabulary: list[str]):
    processed_vocabulary = []

    for word in vocabulary:
        # Remove stop words
        if word not in stop_words:
            # Perform stemming
            stemmed_word = stemmer.stem(word)
            # Perform lemmatization
            lemmatized_word = lemmatizer.lemmatize(stemmed_word)
            processed_vocabulary.append(lemmatized_word)

    return processed_vocabulary

if __name__ == "__main__":
    terms = get_terms()
    time_profile.run("process_all_terms_time(terms)")