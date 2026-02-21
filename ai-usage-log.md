- Tool: Groq (Llama 3.1 8B Instant)
  Task: Generate Gherkin test cases for Login module
  Output: 9 scenarios covering positive, negative, security, and validation cases
  How I used it: Saved raw output to tests/ui/generated_login_tests.feature and selected key scenarios to implement in Playwright tests

- Tool: Groq (Llama 3.1 8B Instant)
  Task: Generate Gherkin test cases for Dashboard module
  Output: Multiple scenarios covering widgets, data accuracy, filters/sorting, responsiveness, permissions, and edge cases
  How I used it: Saved raw output to tests/ui/generated_dashboard_tests.feature and will map selected scenarios to Playwright tests

- Tool: Groq (Llama 3.1 8B Instant)
  Task: Generate Gherkin test cases for REST API module
  Output: Scenarios covering auth validation, CRUD, 4xx/5xx errors, rate limiting, and schema validation
  How I used it: Saved raw output to tests/api/generated_api_tests.feature and will map selected scenarios to automated API tests