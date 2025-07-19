# Author: Jafet Uriel Sánchez Torres
# Robot Framework UI Tests
This project contains automated tests for the Paylocity UI using Robot Framework and Selenium.

## Installation
1. Install dependencies:
```bash
pip install -r requirements.txt
```

## Run Tests
Run all test cases:
```bash
robot -d results tests/
```

## Folder Structure
- `tests/`: Contains Robot test cases.
- `resources/`: Keywords and variables for each page object.

## Validations/Asserts
- Element visibility – Confirms that key UI elements are visible on the screen.
- Element content – Verifies that specific text or values are correctly displayed (e.g., employee name, salary).
- Navigation and flow – Ensures the user can navigate through the app as expected.
- Form submission feedback – Validates success after actions like editing or deleting an employee.

## Test cases
- Log In With Valid Credentials.
- Log In With Invalid Credentials.
- Benefits Dashboard Page Is Displayed.
- Add Employee To Benefits Dashboard.
- Edit Employee In Benefits Dashboard.
- Delete Employee From Benefits Dashboard.