from config.config import get_db_connection

conn = get_db_connection()
if conn and conn.is_connected():
    print("✅ Database connection is active.")
else:
    print("❌ Failed to connect to database.")