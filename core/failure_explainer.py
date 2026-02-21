from core.llm_client import ask_llm

def explain_failure(test_name: str, error: str, context: str) -> str:
    prompt = f"""
A test named "{test_name}" has failed.

Error:
{error}

Context (HTML, API response, or logs):
{context}

Explain in plain English:
1. What likely went wrong
2. What part of the app is suspicious
3. One concrete suggestion to fix it
"""
    return ask_llm(prompt)