import sys
import os
import pytest

# Add project root to Python path
ROOT_DIR = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
sys.path.insert(0, ROOT_DIR)

from core.failure_explainer import explain_failure

@pytest.hookimpl(hookwrapper=True)
def pytest_runtest_makereport(item, call):
    outcome = yield
    rep = outcome.get_result()

    if rep.when == "call" and rep.failed:
        test_name = item.name
        error = str(rep.longrepr)

        context = "No extra context captured yet."

        explanation = explain_failure(test_name, error, context)

        os.makedirs("reports", exist_ok=True)
        with open("reports/ai_failure_report.txt", "a", encoding="utf-8") as f:
            f.write(f"\n=== {test_name} ===\n")
            f.write(explanation)
            f.write("\n\n")