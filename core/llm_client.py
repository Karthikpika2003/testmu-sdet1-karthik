import os
from groq import Groq

client = Groq(api_key=os.getenv("GROQ_API_KEY"))

def ask_llm(prompt: str) -> str:
    response = client.chat.completions.create(
        model="llama-3.1-8b-instant",  # ✅ current supported model
        messages=[
            {"role": "system", "content": "You are a senior QA engineer helping debug test failures."},
            {"role": "user", "content": prompt}
        ],
        temperature=0.2,
    )
    return response.choices[0].message.content