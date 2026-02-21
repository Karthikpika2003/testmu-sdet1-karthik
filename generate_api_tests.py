from core.llm_client import ask_llm

prompt = """
You are a senior QA engineer. Generate detailed Gherkin test cases for a REST API.
Cover the following scenarios:
- Auth token validation (missing, expired, invalid token)
- CRUD operations (create, read, update, delete)
- Error handling (4xx and 5xx responses)
- Rate limiting behavior
- Schema validation for request and response payloads

Include:
- Positive and negative cases
- Given/When/Then steps
- Edge cases (invalid payloads, partial updates, concurrent requests)
"""

result = ask_llm(prompt)
print(result)