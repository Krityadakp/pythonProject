*** Settings ***
Library    BuiltIn
Library    RequestsLibrary
Library    JSONLibrary

*** Variables ***
${url_lotus}  https://api.qa.customer.it-lotus.com
${path_lotus}   /lotus
${url_bzb}  https://catfact.ninja
${path_bzb}     /bzb

*** Keywords ***
get success response from lotus
    set test variable    ${headers_lotus}   Content-Type=application/json   x-request-id=1
    Create session  lotus_api  ${url_lotus}  headers=${headers_lotus}    verify=true
    ${response_lotus}   GET On Session  cat_api  ${path_lotus}
    set test variable     ${response_lotus}
    set test variable    ${response_body_lotus}     evaluate  json.loads('''${response_lotus.content}''')  json
get response from bzb
    Create session  bzb_api  ${url_bzb}     verify=true
    ${response_bzb}   GET On Session  cat_api  ${path_bzb}
    set test variable     ${response_bzb}
    set test variable    ${response_body_bzb}     evaluate  json.loads('''${response_bzb.content}''')  json
response status code should be 200
    Status Should Be    200   ${response_lotus}
response body code should be 200
    should be equal    ${response_body_lotus}[code]     200
response body data should be equal bzb response
    should be equal    ${response_body_lotus}[data]     ${response_body_bzb}

*** Test Cases ***
Success request blahblahblah
    get success response from lotus
    get response from bzb
    response status code should be 200
    response body code should be 200
    response body data should be equal bzb response
