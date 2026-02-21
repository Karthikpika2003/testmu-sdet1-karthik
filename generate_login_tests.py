from core.llm_client import ask_llm

prompt = """
You are a senior QA engineer. Generate detailed Gherkin test cases for a web application's Login module. 
Cover the following scenarios:
- Valid login
- Invalid credentials
- Forgot password flow
- Session expiry
- Brute-force lockout after multiple failed attempts

Include:
- Positive and negative cases
- Clear Given/When/Then steps
- Edge cases and validation errors
"""

result = ask_llm(prompt)
print(result)