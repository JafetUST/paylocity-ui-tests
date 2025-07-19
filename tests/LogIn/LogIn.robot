*** Settings ***
Library    SeleniumLibrary
Resource   ../../resources/logInPage/logIn_page.resource

Suite Setup    Setup Paylocity
Suite Teardown    Teardown Paylocity

*** Test Cases ***
Log In With Valid Credentials
    [Documentation]    Tests logging in with valid credentials and checks for the benefits dashboard.
    logIn_page.Login With Valid Credentials    TestUser757    O!hE|ZJgR]3X
    Teardown Paylocity

Log In With Invalid Credentials
    [Documentation]    Tests logging in with invalid credentials and checks for error message.
    Setup Paylocity
    Login With Invalid Credentials    TestUser757    wrong_pass
    
*** Keywords ***
Setup Paylocity
    [Documentation]    Sets up the Paylocity environment.
    Open Browser To Login Page    https://wmxrwq14uc.execute-api.us-east-1.amazonaws.com/Prod/Account/Login
    SeleniumLibrary.Maximize Browser Window

Teardown Paylocity
    [Documentation]    Tears down the Paylocity environment.
    Close Browser