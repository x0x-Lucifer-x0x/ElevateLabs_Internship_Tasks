# --- src/predict.py ---
import joblib
from src.preprocess import TextCleaner

# Load model and vectorizer
model = joblib.load("A:\\V5C0D3\\Internship_Tasks\\Real-Time Twitter Senitment Analysis Dashboard\\model\\linear_svc_model.pkl")
vectorizer = joblib.load("A:\\V5C0D3\\Internship_Tasks\\Real-Time Twitter Senitment Analysis Dashboard\\model\\tfidf_vectorizer.pkl")
cleaner = TextCleaner()

def predict_sentiment(tweets):
    cleaned = cleaner.transform(tweets)
    X = vectorizer.transform(cleaned)
    preds = model.predict(X)
    return list(zip(tweets, preds))