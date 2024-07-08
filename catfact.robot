*** Settings ***
Library  BuiltIn
Library  RequestsLibrary

*** Variables ***
${url_fact}  https://catfact.ninja

*** Keywords ***
get a cat's fact from api
  Create session  cat_api  ${url_fact}  verify=true
  ${response}  GET On Session  cat_api  /fact
  Set Test Variable    ${response}
http response status code should be '200'
#  Should Be Equal    ${response.status}    200
  Should Be Equal As Strings    ${response.json()['fact']}   values=true
#  Should Be Equal As Numbers    ${response.json}    [length]  values=true

*** Test Cases ***
TC001
    get a cat's fact from api
    http response status code should be '200'

