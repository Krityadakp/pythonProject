*** Settings ***
Library    BuiltIn
Library    RequestsLibrary

*** Variables ***
${url_offerid}  https://api.qa.customer.it-lotus.com

*** Keywords ***
get a offerid from api
    Create session  offerId_api  ${url_offerid}  verify=true
    ${response}   GET On Session  offerid_api  /offerid       header=authorization     params=offerid
    Set Test Variable     ${response}

http response status code should be '200'
    Status Should Be    200   ${response}
check campaignid detail
    Should Be Equal    ${response.json()}[data][1][AgencyName]      "Tesco Lotus"
    Should Be Equal    ${response.json()}[data][2][ID]           204751
    Should Be Equal    ${response.json()}[data][3][AgencyID]    104517
    Should Be Equal    ${response.json()}[data][4][Name]     "campaign type donate"
    Should Be Equal    ${response.json()}[data][5][Detail]     "campaign type donate"
    Should Be Equal    ${response.json()}[data][6][Condition]     "campaign type donate"
    Should Be Equal    ${response.json()}[data][7][ConditionAlert]     null
    Should Be Equal    ${response.json()}[data][8][ReferenceCode]     "657T5LJH52"
    Should Be Equal    ${response.json()}[data][9][CategoryID]     900798
    Should Be Equal    ${response.json()}[data][10][CategoryName]     "ฟรี"

*** Test Cases ***
TC001 check campaignid detail
    get a offerid from api
    http response status code should be '200'

