import pandas as pd
import mysql.connector
from sklearn.feature_extraction.text import TfidfVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from ventflow_backend.config import get_db_connection

def fetch_event_data():
    db = get_db_connection()
    cursor = db.cursor(dictionary=True)
    cursor.execute("SELECT id, name, description FROM events")
    events = cursor.fetchall()
    db.close()
    return pd.DataFrame(events)  # Convert to Pandas DataFrame


def get_event_recommendations(event_id, top_n=5):
    events_df = fetch_event_data()

    # Convert descriptions into TF-IDF vectors
    vectorizer = TfidfVectorizer(stop_words='english')
    event_vectors = vectorizer.fit_transform(events_df['description'])

    # Compute cosine similarity
    similarity_matrix = cosine_similarity(event_vectors)

    # Find similar events
    event_idx = events_df.index[events_df['id'] == event_id][0]
    similar_scores = list(enumerate(similarity_matrix[event_idx]))
    sorted_scores = sorted(similar_scores, key=lambda x: x[1], reverse=True)[1:top_n+1]
    
    recommended_event_ids = [events_df.iloc[i[0]]['id'] for i in sorted_scores]
    return recommended_event_ids
