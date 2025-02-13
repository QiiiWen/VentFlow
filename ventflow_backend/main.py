from fastapi import FastAPI, HTTPException
import mysql.connector
import os
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

app = FastAPI()

# Database connection
def get_db_connection():
    return mysql.connector.connect(
        host=os.getenv("DB_HOST", "localhost"),
        user=os.getenv("DB_USER", "your_username"),
        password=os.getenv("DB_PASSWORD", "your_password"),
        database=os.getenv("DB_NAME", "ventflow_db"),
    )

@app.get("/")
def read_root():
    return {"message": "Welcome to VentFlow API!"}

@app.get("/events")
def get_events():
    try:
        db = get_db_connection()
        cursor = db.cursor(dictionary=True)
        cursor.execute("SELECT * FROM events")
        events = cursor.fetchall()
        db.close()
        return {"events": events}
    except Exception as e:
        print(f"Error: {e}")  
        return {"error": str(e)}
