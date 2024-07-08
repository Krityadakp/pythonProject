*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Test Cases ***
TC001-Login suscess
    Open Browser     https://www.lotuss.com/en    chrome
    Wait Until Page Contains Element    ${registerButton}
    Click Element    ${registerButton}
    Sleep    1m
    Input Text    locator    text
*** Variables ***
${registerButton}  css=#header-register-btn button


*** Keywords ***
