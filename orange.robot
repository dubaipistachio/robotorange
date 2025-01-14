*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASE_URL}    https://opensource-demo.orangehrmlive.com/
${USERNAME}    name=username
${PASSWORD}    name=password 
${LOGIN_BUTTON}    css=.oxd-button
${DASHBOARD}    css=.oxd-topbar-header-title
${DROPDOWN_LOGOUT}    css=.bi-caret-down-fill
${LOGOUT_BUTTON}    xpath=.//a[.='Logout']
${ERROR_MESSAGE}  css=.oxd-alert-content-text 

*** Keywords ***

Login
    Open Browser    ${BASE_URL}    chrome
    Wait Until Element Is Visible    ${USERNAME}
    Input Text    ${USERNAME}    Admin
    Input Password    ${PASSWORD}    admin123
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible  ${DASHBOARD}

Logout
    Wait Until Element Is Visible    ${DROPDOWN_LOGOUT}
    Wait Until Element Is Visible    ${LOGOUT_BUTTON}
    Click Button    ${LOGOUT_BUTTON}
    Wait Until Element Is Visible  ${USERNAME}

Invalid Login 
    Open Browser    ${BASE_URL}    chrome
    Wait Until Element Is Visible    ${USERNAME}
    Input Text    ${USERNAME}    musyafairfan1000@gmail.com
    Input Password    ${PASSWORD}    111!
    Click Button    ${LOGIN_BUTTON}
    Wait Until Element Is Visible  ${ERROR_MESSAGE}
    Input Text    ${USERNAME}    jkj@gmail.com
    # Input Password    ${PASSWORD}    1234qwer
    # Click Button    ${LOGIN_BUTTON}
    # Wait Until Element Is Visible  ${ERROR_MESSAGE}


*** Test Cases ***
Login to Website
    [Tags]    SuccessfulLogin
    Login
    Sleep    10s
Logout to Website
    [Tags]    SuccessfulLogout
    Logout
    Sleep    10s
Login Invalid
    [Tags]    InvalidCredentialsLogin
    Invalid Login
    
