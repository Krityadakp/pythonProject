*** Settings ***
Library    BuiltIn
Library    RequestsLibrary

*** Variables ***
${url_fact}  https://catfact.ninja

*** Keywords ***
get a cat's facts from api
    Create session  cat_api  ${url_fact}  verify=true
    ${response}   GET On Session  cat_api  /facts   params=limit=3
    Set Test Variable     ${response}
http response status code should be '200'
    Status Should Be    200   ${response}
check limit in the list of facts
    ${body}=  evaluate    json.loads('''${response.content}''')  json
    ${fact_list}=   Set Variable   ${body}[data]
    ${fact_list_size}=  Get Length    ${fact_list}
    Should Be Equal As Integers  ${fact_list_size}   3

#http response body should contain required fields
#    shoud be equal  ${response.json()}  [current_page]  ${1}
#    shoud be equal  ${response.json()}  [data]${body}[fact]
#    shoud be equal  ${response.json()}  [data]${body}[length]






*** Test Cases ***
TC001
    get a cat's facts from api
    http response status code should be '200'
    check limit in the list of facts
#    http response body should contain required fields
