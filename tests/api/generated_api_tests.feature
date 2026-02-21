**Auth Token Validation**

### Step 1: Missing Auth Token

```gherkin
Feature: Auth Token Validation
  As a user, I want to ensure that the API validates auth tokens correctly
  so that I can access protected resources securely.

  Scenario: Missing Auth Token
    Given I send a GET request to "/users" without an auth token
    When the server responds with a 401 Unauthorized status code
    Then the response body should contain "Missing auth token"
    And the response headers should not contain "Authorization"

  Scenario: Missing Auth Token in Header
    Given I send a GET request to "/users" with an empty auth token in the header
    When the server responds with a 401 Unauthorized status code
    Then the response body should contain "Missing auth token"
    And the response headers should not contain "Authorization"

  Scenario: Missing Auth Token in Query Param
    Given I send a GET request to "/users" with an empty auth token in the query param
    When the server responds with a 401 Unauthorized status code
    Then the response body should contain "Missing auth token"
    And the response headers should not contain "Authorization"
```

### Step 2: Expired Auth Token

```gherkin
Scenario: Expired Auth Token
    Given I have an expired auth token
    And I send a GET request to "/users" with the expired auth token
    When the server responds with a 401 Unauthorized status code
    Then the response body should contain "Invalid auth token"
    And the response headers should not contain "Authorization"
```

### Step 3: Invalid Auth Token

```gherkin
Scenario: Invalid Auth Token
    Given I have an invalid auth token
    And I send a GET request to "/users" with the invalid auth token
    When the server responds with a 401 Unauthorized status code
    Then the response body should contain "Invalid auth token"
    And the response headers should not contain "Authorization"
```

**CRUD Operations**

### Step 1: Create User

```gherkin
Feature: Create User
  As a user, I want to create a new user
  so that I can access the API securely.

  Scenario: Create User with Valid Payload
    Given I send a POST request to "/users" with a valid user payload
    When the server responds with a 201 Created status code
    Then the response body should contain the created user's details
    And the response headers should contain "Location" with the user's ID

  Scenario: Create User with Invalid Payload
    Given I send a POST request to "/users" with an invalid user payload
    When the server responds with a 400 Bad Request status code
    Then the response body should contain "Invalid user payload"
    And the response headers should not contain "Location"

  Scenario: Create User with Duplicate Email
    Given I send a POST request to "/users" with a user payload having a duplicate email
    When the server responds with a 400 Bad Request status code
    Then the response body should contain "Email already exists"
    And the response headers should not contain "Location"
```

### Step 2: Read User

```gherkin
Feature: Read User
  As a user, I want to read a user's details
  so that I can access the user's information.

  Scenario: Read User with Valid ID
    Given I send a GET request to "/users/{id}" with a valid user ID
    When the server responds with a 200 OK status code
    Then the response body should contain the user's details
    And the response headers should contain "Content-Type" with "application/json"

  Scenario: Read User with Invalid ID
    Given I send a GET request to "/users/{id}" with an invalid user ID
    When the server responds with a 404 Not Found status code
    Then the response body should contain "User not found"
    And the response headers should not contain "Content-Type"
```

### Step 3: Update User

```gherkin
Feature: Update User
  As a user, I want to update a user's details
  so that I can update the user's information.

  Scenario: Update User with Valid Payload
    Given I send a PATCH request to "/users/{id}" with a valid user payload
    When the server responds with a 200 OK status code
    Then the response body should contain the updated user's details
    And the response headers should contain "Content-Type" with "application/json"

  Scenario: Update User with Invalid Payload
    Given I send a PATCH request to "/users/{id}" with an invalid user payload
    When the server responds with a 400 Bad Request status code
    Then the response body should contain "Invalid user payload"
    And the response headers should not contain "Content-Type"

  Scenario: Update User with Partial Update
    Given I send a PATCH request to "/users/{id}" with a partial user payload
    When the server responds with a 200 OK status code
    Then the response body should contain the updated user's details
    And the response headers should contain "Content-Type" with "application/json"
```

### Step 4: Delete User

```gherkin
Feature: Delete User
  As a user, I want to delete a user
  so that I can remove the user's information.

  Scenario: Delete User with Valid ID
    Given I send a DELETE request to "/users/{id}" with a valid user ID
    When the server responds with a 204 No Content status code
    Then the response body should be empty
    And the response headers should not contain "Content-Type"

  Scenario: Delete User with Invalid ID
    Given I send a DELETE request to "/users/{id}" with an invalid user ID
    When the server responds with a 404 Not Found status code
    Then the response body should contain "User not found"
    And the response headers should not contain "Content-Type"
```

**Error Handling**

### Step 1: 4xx Responses

```gherkin
Feature: Error Handling
  As a user, I want to handle errors correctly
  so that I can understand what went wrong.

  Scenario: 400 Bad Request
    Given I send a POST request to "/users" with an invalid user payload
    When the server responds with a 400 Bad Request status code
    Then the response body should contain "Invalid user payload"
    And the response headers should not contain "Location"

  Scenario: 401 Unauthorized
    Given I send a GET request to "/users" without an auth token
    When the server responds with a 401 Unauthorized status code
    Then the response body should contain "Missing auth token"
    And the response headers should not contain "Authorization"

  Scenario: 403 Forbidden
    Given I send a GET request to "/users" with an invalid auth token
    When the server responds with a 403 Forbidden status code
    Then the response body should contain "Invalid auth token"
    And the response headers should not contain "Authorization"
```

### Step 2: 5xx Responses

```gherkin
Feature: Error Handling
  As a user, I want to handle errors correctly
  so that I can understand what went wrong.

  Scenario: 500 Internal Server Error
    Given I send a POST request to "/users" with a valid user payload
    When the server responds with a 500 Internal Server Error status code
    Then the response body should contain "Internal Server Error"
    And the response headers should not contain "Location"

  Scenario: 502 Bad Gateway
    Given I send a POST request to "/users" with a valid user payload
    When the server responds with a 502 Bad Gateway status code
    Then the response body should contain "Bad Gateway"
    And the response headers should not contain "Location"
```

**Rate Limiting**

### Step 1: Rate Limiting

```gherkin
Feature: Rate Limiting
  As a user, I want to handle rate limiting correctly
  so that I can understand what went wrong.

  Scenario: Rate Limiting Exceeded
    Given I send a POST request to "/users" with a valid user payload 10 times in a row
    When the server responds with a 429 Too Many Requests status code
    Then the response body should contain "Rate limiting exceeded"
    And the response headers should contain "Retry-After" with a valid value
```

**Schema Validation**

### Step 1: Request Payload Validation

```gherkin
Feature: Schema Validation
  As a user, I want to validate request payloads correctly
  so that I can ensure data integrity.

  Scenario: Valid Request Payload
    Given I send a POST request to "/users" with a valid user payload
    When the server responds with a 201 Created status code
    Then the response body should contain the created user's details
    And the response headers should contain "Location" with the user's ID

  Scenario: Invalid Request Payload
    Given I send a POST request to "/users" with an invalid user payload
    When the server responds with a 400 Bad Request status code
    Then the response body should contain "Invalid user payload"
    And the response headers should not contain "Location"
```

### Step 2: Response Payload Validation

```gherkin
Feature: Schema Validation
  As a user, I want to validate response payloads correctly
  so that I can ensure data integrity.

  Scenario: Valid Response Payload
    Given I send a GET request to "/users/{id}" with a valid user ID
    When the server responds with a 200 OK status code
    Then the response body should contain