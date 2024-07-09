*** Settings ***
Library    BuiltIn
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${url_fact}  https://catfact.ninja

*** Keywords ***
get a cat's fact from api
    Create session  cat_api  ${url_fact}  verify=true
    ${response}   GET On Session  cat_api  /fact
    Set Test Variable     ${response}
http response status code should be '200'
    Status Should Be    200   ${response}
http response body should contain required fields
    ${body}=  evaluate    json.loads('''${response.content}''')  json
    ${fact_value}=    set variable    ${body}[fact]
    ${length_value}=    set variable    ${body}[length]
    ${fact_value_type}    evaluate    type($fact_value).__name__
    ${length_value_type}    evaluate    type($length_value).__name__
    should be equal    ${fact_value_type}   str
    should be equal    ${length_value_type}   int

*** Test Cases ***
TC001
    get a cat's fact from api
    http response status code should be '200'
    http response body should contain required fields
