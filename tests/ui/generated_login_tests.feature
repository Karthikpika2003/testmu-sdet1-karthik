**Login Module Test Cases**

### Valid Login

**Scenario 1: Successful Login with Valid Credentials**

```gherkin
Feature: Successful Login with Valid Credentials
  As a user, I want to log in to the application with valid credentials.

  Scenario: Successful Login with Valid Credentials
    Given I am on the login page
    When I enter valid username "testuser" and password "password123"
    And I click the login button
    Then I should be redirected to the dashboard page
    And I should see the welcome message "Welcome, testuser"
```

**Scenario 2: Successful Login with Valid Credentials (Edge Case: Case Sensitive)**

```gherkin
Feature: Successful Login with Valid Credentials (Edge Case: Case Sensitive)
  As a user, I want to log in to the application with valid credentials, considering case sensitivity.

  Scenario: Successful Login with Valid Credentials (Case Sensitive)
    Given I am on the login page
    When I enter valid username "TestUser" and password "password123"
    And I click the login button
    Then I should be redirected to the dashboard page
    And I should see the welcome message "Welcome, TestUser"
```

### Invalid Login

**Scenario 3: Invalid Login with Incorrect Credentials**

```gherkin
Feature: Invalid Login with Incorrect Credentials
  As a user, I want to log in to the application with invalid credentials.

  Scenario: Invalid Login with Incorrect Credentials
    Given I am on the login page
    When I enter invalid username "testuser" and password "wrongpassword"
    And I click the login button
    Then I should see the error message "Invalid username or password"
```

**Scenario 4: Invalid Login with Blank Credentials**

```gherkin
Feature: Invalid Login with Blank Credentials
  As a user, I want to log in to the application with blank credentials.

  Scenario: Invalid Login with Blank Credentials
    Given I am on the login page
    When I enter blank username and password
    And I click the login button
    Then I should see the error message "Username and password are required"
```

### Forgot Password

**Scenario 5: Forgot Password Flow**

```gherkin
Feature: Forgot Password Flow
  As a user, I want to recover my password using the forgot password flow.

  Scenario: Forgot Password Flow
    Given I am on the login page
    When I click the forgot password link
    And I enter valid email "testuser@example.com"
    And I click the submit button
    Then I should see the success message "Password reset link sent to your email"
    And I should receive an email with password reset link
```

### Session Expiry

**Scenario 6: Session Expiry**

```gherkin
Feature: Session Expiry
  As a user, I want to log out of the application due to session expiry.

  Scenario: Session Expiry
    Given I am logged in to the application
    When I wait for 30 minutes without any activity
    Then I should be redirected to the login page
    And I should see the error message "Your session has expired. Please log in again"
```

### Brute-Force Lockout

**Scenario 7: Brute-Force Lockout after Multiple Failed Attempts**

```gherkin
Feature: Brute-Force Lockout after Multiple Failed Attempts
  As a user, I want to be locked out of the application after multiple failed login attempts.

  Scenario: Brute-Force Lockout after Multiple Failed Attempts
    Given I am on the login page
    When I enter invalid username "testuser" and password "wrongpassword" 5 times
    And I click the login button each time
    Then I should see the error message "Too many failed login attempts. Please try again later"
    And I should be locked out of the application for 30 minutes
```

### Edge Cases and Validation Errors

**Scenario 8: Invalid Username Format**

```gherkin
Feature: Invalid Username Format
  As a user, I want to log in to the application with an invalid username format.

  Scenario: Invalid Username Format
    Given I am on the login page
    When I enter invalid username "testuser123!" and password "password123"
    And I click the login button
    Then I should see the error message "Invalid username format. Please use only alphanumeric characters and underscores"
```

**Scenario 9: Password Length Validation**

```gherkin
Feature: Password Length Validation
  As a user, I want to log in to the application with a password that does not meet the length requirements.

  Scenario: Password Length Validation
    Given I am on the login page
    When I enter valid username "testuser" and password "short"
    And I click the login button
    Then I should see the error message "Password must be at least 8 characters long"
```

These test cases cover various scenarios, including valid login, invalid credentials, forgot password flow, session expiry, and brute-force lockout. They also include edge cases and validation errors to ensure that the application handles unexpected input correctly.