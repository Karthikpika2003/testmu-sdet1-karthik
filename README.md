# TestMu SDET-1 — AI-Native QA Challenge

**Author:** Karthik V Nambiar

## Overview

This repository demonstrates how AI can be integrated into a Python + Playwright test framework to reduce debugging time and accelerate test creation.

It covers three modules:
- Login (UI)
- Dashboard (UI)
- REST API

The project includes:
- AI-generated test cases (Gherkin) for all three modules
- A Failure Explainer that sends real test failures to an LLM and saves a plain-English explanation
- A clear audit trail of prompts and AI usage

This was built as part of the **TestMu AI SDET-1 Assessment**.

---

## Tech Stack

- **Language:** Python  
- **Test Framework:** Pytest  
- **UI Automation:** Playwright  
- **API Testing:** Requests  
- **LLM Provider:** Groq (Llama 3.1 8B Instant)

**AI Use Cases:**
- Test case generation (Task 2)
- Failure Explainer integrated into test runs (Task 3)

---

## Project Structure

```text
testmu-sdet1-karthik/
│
├── core/
│   ├── llm_client.py
│   └── failure_explainer.py
│
├── tests/
│   ├── ui/
│   │   ├── test_login.py
│   │   ├── generated_login_tests.feature
│   │   └── generated_dashboard_tests.feature
│   └── api/
│       └── generated_api_tests.feature
│
├── reports/
│   └── ai_failure_report.txt
│
├── generate_login_tests.py
├── generate_dashboard_tests.py
├── generate_api_tests.py
├── prompts.md
├── ai-usage-log.md
├── requirements.txt
├── pytest.ini
└── README.md
```
## Setup

### 1) Create and activate virtual environment

```bash
python -m venv venv
venv\Scripts\activate
```

### 2) Install dependencies
```bash
pip install -r requirements.txt
playwright install
```

### 3) Set Groq API key (Windows PowerShell)
```bash
$env:GROQ_API_KEY="YOUR_GROQ_API_KEY_HERE"
```
(You can make it permanent later with setx GROQ_API_KEY "..." and reopening the terminal.)

## Running the Tests
From the project root:
```bash
pytest
```
If a test passes: normal Pytest output

If a test fails: the Failure Explainer sends details to the LLM and appends a human-readable explanation to:
```
reports/ai_failure_report.txt
```

## How to see the AI Failure Explainer in action

To verify the AI integration (Task 3), you can temporarily introduce a failing assertion in:
```
tests/ui/test_login.py
```
When the test fails, an LLM-generated explanation will be appended to:
```
reports/ai_failure_report.txt
```
This uses the Groq API directly (real LLM call, not mocked).

## AI Failure Explainer (Task 3)

### Why this option?
I chose Option A (Failure Explainer) because it provides immediate, human-readable feedback on test failures and helps reduce debugging time during regression runs.

### How it works:

1)Pytest detects a failed test
2)The failure hook collects:
Test name
Error output
3)This information is sent to the LLM (via Groq API)
4)The LLM returns:
What likely went wrong
What part of the app is suspicious
One concrete suggestion to fix it
5)The result is saved to:
```
reports/ai_failure_report.txt
```
A sample output file is included in the repository.

### AI-Generated Test Cases (Task 2)

AI was used to generate test cases for:

Login Module:
tests/ui/generated_login_tests.feature

Dashboard Module:
tests/ui/generated_dashboard_tests.feature

REST API Module:
tests/api/generated_api_tests.feature

All prompts used (including initial and improved versions) are documented in:
```
prompts.md
```
A full audit log of AI usage is available in:
```
ai-usage-log.md
```
### How AI Was Used

Generate structured Gherkin test cases for UI and API modules

Iterate on prompts to improve coverage and specificity

Analyze real test failures and produce human-readable explanations

Assist in refining failure messages and test assertions

Details are recorded in ai-usage-log.md.

### What I’d Build Next (With More Time)

Capture richer failure context (screenshots, HTML snapshots, API responses)

Add Flaky Test Classifier as an alternative AI mode

Integrate with CI (GitHub Actions) to auto-annotate failures in PRs

Convert more AI-generated scenarios into fully automated tests

Add structured test reports (Allure / HTML reports) with embedded AI insights

### Notes

This project focuses on demonstrating process and integration of AI into QA workflows, rather than exhaustively testing a single real product.

The emphasis is on:

Clean structure

Reproducible prompts

Real LLM integration

Practical QA engineering workflows

