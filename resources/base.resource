*** Settings ***
Documentation       Tudo começa aqui

Resource            components/navbar.resource
Resource            components/toast.resource
Resource            pages/login.resource
Resource            pages/enroll.resource
Resource            database.resource
Resource            ../resources/services/sessions.resource
Resource            ../resources/services/student.resource
Library             JSONLibrary


*** Keywords ***
# Helpers
Do Login
    [Arguments]    ${user}

    Go To Login Page
    Fill Credentials    ${user}[email]    ${user}[password]
    Submit Credentials
    User Should Be Looged In    ${user}[name]

Get Fixture
    [Arguments]    ${fixture_file}

    ${fixture}    Load JSON From File
    ...    ${EXECDIR}/resources/fixtures/${fixture_file}.json
    RETURN    ${fixture}

