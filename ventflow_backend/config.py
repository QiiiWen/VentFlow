import mysql.connector
import os
from dotenv import load_dotenv

load_dotenv()

DB_CONFIG = {
    "host": os.getenv("DB_HOST", "localhost"),
    "user": os.getenv("DB_USER", "your_username"),
    "password": os.getenv("DB_PASSWORD", "your_password"),
    "database": os.getenv("DB_NAME", "ventflow_db"),
}


def get_db_connection():
    """Establishes a connection to the database with error handling."""
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        print("✅ Database connection successful!")
        return conn
    except mysql.connector.Error as e:
        print(f"❌ Database connection failed: {e}")
        return None
