from core.llm_client import ask_llm

prompt = """
You are a senior QA engineer. Generate detailed Gherkin test cases for a web application's Dashboard module.
Cover the following scenarios:
- Widget loading and empty states
- Data accuracy and refresh behavior
- Filter and sort functionality
- Responsive layout (desktop vs mobile)
- Permission-based visibility (admin vs normal user)

Include:
- Positive and negative cases
- Given/When/Then steps
- Edge cases (slow network, partial data, no data, unauthorized access)
"""

result = ask_llm(prompt)
print(result)