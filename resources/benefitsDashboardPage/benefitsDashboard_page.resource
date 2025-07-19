*** Settings ***
Library    SeleniumLibrary
Variables   benefitsDashboard_locators.yaml

*** Keywords ***
Open Benefits Dashboard
    [Documentation]    Opens the benefits dashboard.
    SeleniumLibrary.Wait Until Element Is Visible    ${benefitsDasboardLocators.benefits_dashboard_title}
    SeleniumLibrary.Page Should Contain    Paylocity Benefits Dashboard

Add Employee
    [Documentation]    Adds an employee to the benefits dashboard.
    [Arguments]    ${EMPLOYEE_FIRST_NAME}=${EMPTY}    ${EMPLOYEE_LAST_NAME}=${EMPTY}    ${DEPENDENT}=0
    SeleniumLibrary.Wait Until Element Is Visible    ${benefitsDasboardLocators.add_employee_button}
    SeleniumLibrary.Click Element    ${benefitsDasboardLocators.add_employee_button}
    SeleniumLibrary.Wait Until Element Is Visible    ${benefitsDasboardLocators.add_employee_modal}    60
    SeleniumLibrary.Input Text    ${benefitsDasboardLocators.first_name_input}    ${EMPLOYEE_FIRST_NAME}
    SeleniumLibrary.Input Text    ${benefitsDasboardLocators.last_name_input}    ${EMPLOYEE_LAST_NAME}
    SeleniumLibrary.Input Text    ${benefitsDasboardLocators.dependent_input}    ${DEPENDENT}
    SeleniumLibrary.Click Element    ${benefitsDasboardLocators.add_button}

Verify Employee Added In Dashboard
    [Documentation]    Verifies that an employee has been added to the benefits dashboard.
    [Arguments]    ${EMPLOYEE_FIRST_NAME}=${EMPTY}    ${EMPLOYEE_LAST_NAME}=${EMPTY}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${benefitsDasboardLocators.add_employee_modal}    60
    SeleniumLibrary.Wait Until Element Is Visible    ${benefitsDasboardLocators.employee_table}    60
    SeleniumLibrary.Page Should Contain Element    xpath=//tr[contains(td[2], '${EMPLOYEE_FIRST_NAME}') and contains(td[3], '${EMPLOYEE_LAST_NAME}')]

Refresh Benefits Dashboard
    [Documentation]    Refreshes the benefits dashboard.
    SeleniumLibrary.Wait Until Element Is Visible    ${benefitsDasboardLocators.benefits_dashboard_title}    60
    SeleniumLibrary.Click Element    ${benefitsDasboardLocators.benefits_dashboard_title}

Click On Delete Employee
    [Documentation]    Deletes an employee from the benefits dashboard.
    [Arguments]    ${EMPLOYEE_FIRST_NAME}=${EMPTY}    ${EMPLOYEE_LAST_NAME}=${EMPTY}
    SeleniumLibrary.Wait Until Element Is Visible    xpath=//tr[contains(td[2], '${EMPLOYEE_FIRST_NAME}') and contains(td[3], '${EMPLOYEE_LAST_NAME}')]
    SeleniumLibrary.Click Element    xpath=//tr[td[2][text()='${EMPLOYEE_FIRST_NAME}'] and td[3][text()='${EMPLOYEE_LAST_NAME}']]//i[contains(@class, 'fa-times')]

Confirm Delete Employee
    [Documentation]    Confirms the deletion of an employee.
    SeleniumLibrary.Wait Until Element Is Visible    ${benefitsDasboardLocators.delete_employee_modal}    60
    SeleniumLibrary.Click Element    ${benefitsDasboardLocators.delete_employee_button}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${benefitsDasboardLocators.delete_employee_modal}    60

Verify Employee Deleted From Dashboard
    [Documentation]    Verifies that an employee has been deleted from the benefits dashboard.
    [Arguments]    ${EMPLOYEE_FIRST_NAME}=${EMPTY}    ${EMPLOYEE_LAST_NAME}=${EMPTY}
    SeleniumLibrary.Wait Until Element Is Not Visible    ${benefitsDasboardLocators.delete_employee_modal}    60
    SeleniumLibrary.Wait Until Element Is Visible    ${benefitsDasboardLocators.employee_table}    60
    SeleniumLibrary.Page Should Not Contain Element    xpath=//tr[contains(td[2], '${EMPLOYEE_FIRST_NAME}') and contains(td[3], '${EMPLOYEE_LAST_NAME}')]

Edit Employee
    [Documentation]    Edits an employee's details
    [Arguments]    ${EMPLOYEE_FIRST_NAME}=${EMPTY}    ${EMPLOYEE_LAST_NAME}=${EMPTY}    ${NEW_FIRST_NAME}=${EMPTY}    ${NEW_LAST_NAME}=${EMPTY}    ${DEPENDENT}=0
    SeleniumLibrary.Wait Until Element Is Visible    ${benefitsDasboardLocators.employee_table}    60
    SeleniumLibrary.Wait Until Element Is Visible    xpath=//tr[contains(td[2], '${EMPLOYEE_FIRST_NAME}') and contains(td[3], '${EMPLOYEE_LAST_NAME}')]
    SeleniumLibrary.Click Element    xpath=//tr[td[2][text()='${EMPLOYEE_FIRST_NAME}'] and td[3][text()='${EMPLOYEE_LAST_NAME}']]//i[contains(@class, 'fa-edit')]
    SeleniumLibrary.Wait Until Element Is Visible    ${benefitsDasboardLocators.add_employee_modal}    60
    SeleniumLibrary.Input Text    ${benefitsDasboardLocators.first_name_input}    ${NEW_FIRST_NAME}
    SeleniumLibrary.Input Text    ${benefitsDasboardLocators.last_name_input}    ${NEW_LAST_NAME}
    SeleniumLibrary.Input Text    ${benefitsDasboardLocators.dependent_input}    ${DEPENDENT}
    SeleniumLibrary.Click Element    ${benefitsDasboardLocators.update_employee_button}