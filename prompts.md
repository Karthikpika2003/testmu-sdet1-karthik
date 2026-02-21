# Prompts Used for Test Case Generation

## Login Module

### Prompt v1
Generate test cases for a login page.

### Issues with Prompt v1
- The output was too generic
- Missed security scenarios like brute-force lockout and session expiry
- Did not specify format or level of detail

### Prompt v2
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

### What changed in Prompt v2
- Added role context (senior QA engineer)
- Explicitly listed required scenarios
- Asked for Gherkin format
- Asked for negative and edge cases

### Result from Prompt v2
- The model generated 9 scenarios covering:
  - Valid login
  - Invalid credentials
  - Blank input
  - Forgot password
  - Session expiry
  - Brute-force lockout
  - Input validation edge cases
- The output was detailed and in Gherkin format, suitable for direct conversion into automated tests.

## Dashboard Module

### Prompt v1
Generate test cases for a dashboard page.

### Issues with Prompt v1
- Too vague and generic
- Did not cover data accuracy, permissions, or responsive behavior
- No specific format requested

### Prompt v2
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

### What changed in Prompt v2
- Added role context (senior QA engineer)
- Listed concrete dashboard features to test
- Requested Gherkin format explicitly
- Added edge cases and negative scenarios

### Result from Prompt v2
- The model generated scenarios covering widget loading, empty/error states, data accuracy, refresh behavior, filters, sorting, responsive layouts, and permission-based visibility.
- The output included positive, negative, and edge cases such as slow network, partial data, and unauthorized access.
- The test cases were produced in Gherkin format and are suitable for conversion into automated UI tests.

## REST API Module

### Prompt v1
Generate test cases for a REST API.

### Issues with Prompt v1
- Too generic and not tied to concrete API behaviors
- Did not cover auth, CRUD, errors, or schema validation
- No specific format requested

### Prompt v2
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

### What changed in Prompt v2
- Added role context (senior QA engineer)
- Listed concrete API responsibilities to test
- Requested Gherkin format explicitly
- Added negative cases and edge conditions

### Result from Prompt v2
- The model generated scenarios covering auth token validation, CRUD operations, error handling (4xx/5xx), rate limiting, and schema validation.
- The output included both positive and negative cases, as well as edge cases like invalid payloads and missing tokens.
- The test cases were produced in Gherkin format and are suitable for mapping to automated API tests.