from playwright.sync_api import sync_playwright

def test_invalid_login_shows_error():
    with sync_playwright() as p:
        browser = p.chromium.launch()
        page = browser.new_page()

        page.goto("https://the-internet.herokuapp.com/login")

        page.fill("#username", "tomsmith")
        page.fill("#password", "wrongpassword")
        page.click("button[type=submit]")

        error_text = page.locator("#flash").inner_text()
        assert "Your password is invalid!" in error_text

        browser.close()