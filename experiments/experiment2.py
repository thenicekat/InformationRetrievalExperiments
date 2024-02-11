import nltk
from nltk.corpus import stopwords
from nltk.stem import PorterStemmer, WordNetLemmatizer

# Download necessary NLTK data
nltk.download('stopwords')
nltk.download('wordnet')

# Initialize stemmer, lemmatizer and stop words
stemmer = PorterStemmer()
lemmatizer = WordNetLemmatizer()
stop_words = set(stopwords.words('english'))

def process_vocabulary(vocabulary):
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

# Example usage
vocabulary = ["running", "runs", "run", "easily", "fairly", "fairness", "cats", "feet", "people", "the", "and"]
print(vocabulary)
processed_vocabulary = process_vocabulary(vocabulary)
print(processed_vocabulary)