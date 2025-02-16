import os
from dotenv import load_dotenv
from openai import OpenAI
import mysql.connector
from ventflow_backend.config import get_db_connection  # Import database connection function


load_dotenv()

OPEN_AI_API_KEY = os.getenv("OPENAI_API_KEY")
openai = OpenAI(api_key = OPEN_AI_API_KEY)

# Fetch event data once at startup
def fetch_event_data():
    try:
        db = get_db_connection()
        cursor = db.cursor(dictionary=True)
        cursor.execute("SELECT name, date, location, description, organizer, price, status FROM events")
        events = cursor.fetchall()
        db.close()

        if not events:
            return "No event data available at the moment."

        event_info = "\n".join([
            f"Event: {event['name']}, Date: {event['date']}, Location: {event['location']}, "
            f"Description: {event['description']}, Organizer: {event['organizer']}, Price: {event['price']}, Status: {event['status']}"
            for event in events
        ])

        return event_info
    except Exception as e:
        return f"Error fetching event data: {str(e)}"

# Store event data globally
EVENT_DATA = fetch_event_data()
    

messages = [
    { 
        "role": "system", 
        "content": f"You are a friendly assistant specializing in Malaysia's business events and application-related FAQs for the VentFlow mobile app.\n"
                   f"You can answer:\n"
                   f"- Business event-related questions (event details, exhibitors, schedules, and related information).\n"
                   f"- Application-related questions (how to book events, view purchases, refund tickets, etc.).\n"
                   f"Only provide answer for user's question based on the provided data or information (Do refine your sentences in a more natural intonatoin instead of directly giving out the data). If a question is outside this scope, politely inform the user.\n\n"
                   f"Here is the latest event information:\n{fetch_event_data()}"
    }
]


def chat_bot():
    while True:
        message = input("User: ")
        if message.lower() == "quit":
            break
        messages.append( { "role": "user", "content": message } )
        output = openai.chat.completions.create(
            model="gpt-4o-mini",
            messages = messages
        )
        messages.append({ "role": "assistant", "content": output.choices[0].message.content })
        print(output.choices[0].message.content)

if __name__ == "__main__":
    chat_bot()