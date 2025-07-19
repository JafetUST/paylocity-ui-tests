*** Settings ***
Library    SeleniumLibrary
Variables   logIn_locators.yaml

*** Keywords ***
Open Browser To Login Page
    [Documentation]    Opens the browser to the login page.
    [Arguments]    ${LOGIN_URL}=${EMPTY}    ${BROWSER}=chrome
    Open Browser    ${LOGIN_URL}    ${BROWSER}
    SeleniumLibrary.Page Should Contain    Log In

Login With Valid Credentials
    [Documentation]    Logs in with valid credentials and checks benefits dashboard.
    [Arguments]    ${USERNAME}=${EMPTY}    ${PASSWORD}=${EMPTY}
    SeleniumLibrary.Input Text    ${LogInLocators.username_input}    ${USERNAME}
    SeleniumLibrary.Input Text    ${LogInLocators.password_input}    ${PASSWORD}
    SeleniumLibrary.Click Element    ${LogInLocators.logIn_button}
    SeleniumLibrary.Wait Until Element Is Visible    ${LogInLocators.benefits_dashboard}
    SeleniumLibrary.Page Should Contain    Paylocity Benefits Dashboard

Login With Invalid Credentials
    [Documentation]    Attempts to log in with invalid credentials and checks for error message.
    [Arguments]    ${USERNAME}=${EMPTY}    ${PASSWORD}=${EMPTY}
    SeleniumLibrary.Input Text    ${LogInLocators.username_input}    ${USERNAME}
    SeleniumLibrary.Input Text    ${LogInLocators.password_input}    ${PASSWORD}
    SeleniumLibrary.Click Element    ${LogInLocators.logIn_button}
    SeleniumLibrary.Wait Until Element Is Visible    ${LogInLocators.wrong_credentials_message}
    SeleniumLibrary.Page Should Contain    The specified username or password is incorrect    
