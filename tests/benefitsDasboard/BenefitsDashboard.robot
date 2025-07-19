*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/logInPage/logIn_page.resource
Resource   ../../resources/benefitsDashboardPage/benefitsDashboard_page.resource

Suite Setup    Setup Paylocity
Suite Teardown    Teardown Paylocity

*** Test Cases ***
Benefits Dashboard Page Is Displayed
    [Documentation]    Tests if the benefits dashboard page is displayed correctly.
    logIn_page.Login With Valid Credentials    TestUser757    O!hE|ZJgR]3X
    benefitsDashboard_page.Open Benefits Dashboard

Add Employee To Benefits Dashboard
    [Documentation]    Tests adding an employee to the benefits dashboard.
    benefitsDashboard_page.Add Employee    John    Doe    2
    benefitsDashboard_page.Refresh Benefits Dashboard
    benefitsDashboard_page.Verify Employee Added In Dashboard    John    Doe

Edit Employee In Benefits Dashboard
    [Documentation]    Tests editing an employee's details in the benefits dashboard.
    benefitsDashboard_page.Edit Employee    John    Doe    Jane    Smith    3
    benefitsDashboard_page.Refresh Benefits Dashboard
    benefitsDashboard_page.Verify Employee Added In Dashboard    Jane    Smith

Delete Employee From Benefits Dashboard
    [Documentation]    Tests deleting an employee from the benefits dashboard.
    benefitsDashboard_page.Click On Delete Employee    Jane    Smith
    benefitsDashboard_page.Confirm Delete Employee
    benefitsDashboard_page.Refresh Benefits Dashboard
    benefitsDashboard_page.Verify Employee Deleted From Dashboard    Jane    Smith

*** Keywords ***
Setup Paylocity
    [Documentation]    Sets up the Paylocity environment.
    Open Browser To Login Page    https://wmxrwq14uc.execute-api.us-east-1.amazonaws.com/Prod/Account/Login
    SeleniumLibrary.Maximize Browser Window

Teardown Paylocity
    [Documentation]    Tears down the Paylocity environment.
    Close Browser