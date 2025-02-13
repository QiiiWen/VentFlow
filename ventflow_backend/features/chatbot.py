import os
from dotenv import load_dotenv
from openai import OpenAI
import mysql.connector
from config import get_db_connection  # Import database connection function


load_dotenv()

OPEN_AI_API_KEY = os.getenv("OPENAI_API_KEY")
openai = OpenAI(api_key = OPEN_AI_API_KEY)

messages = [
    { "role": "system", "content": "You are an assistant specializing in Malaysia's business events and application-related FAQs for VentFlow mobile app. \
     You can answer:\
     Business event-related questions (event details, exhibitors, schedules and related information).\
     Application-related questions (how to book events, view purchases, refund tickets, etc.).\
     Only provide responses based on the provided data. If a question is outside this scope, politely inform the user." }
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