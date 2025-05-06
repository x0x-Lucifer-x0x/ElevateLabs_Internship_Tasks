# --- app.py ---
import streamlit as st
import pandas as pd
from datetime import datetime
import os

from src.fetch import fetch_tweets
from src.predict import predict_sentiment

st.title("Twitter Sentiment Analyzer")

query = st.text_input("Enter a topic or hashtag:", "#AI")
max_results = st.slider("Number of tweets to fetch", 10, 50, 10)

if st.button("Analyze"):
    with st.spinner("Fetching tweets..."):
        tweets = fetch_tweets(query, max_results)

    if not tweets:
        st.warning("No tweets found.")
    else:
        st.success(f"Fetched {len(tweets)} tweets. Predicting sentiment...")
        results = predict_sentiment(tweets)

        # Display results
        for tweet, label in results:
            sentiment = "Positive" if label == 1 else "Negative"
            color = "green" if label == 1 else "red"
            st.markdown(f"<p style='color:{color}'><b>{sentiment}</b>: {tweet}</p>", unsafe_allow_html=True)

        # ✅ Save sentiment logs
        os.makedirs("logs", exist_ok=True)
        log_df = pd.DataFrame({
            'timestamp': [datetime.now()] * len(results),
            'tweet': [tweet for tweet, _ in results],
            'sentiment': ["Positive" if label == 1 else "Negative" for _, label in results]
        })
        log_file = "logs/sentiment_log.csv"
        log_df.to_csv(log_file, mode='a', header=not os.path.exists(log_file), index=False)
