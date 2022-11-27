*** Settings ***
Documentation       Admin can enroll new students

Resource            ../resources/base.resource


*** Test Cases ***
Should enroll an student
    ${admin}    Get Fixture    admin

    ${student}    Get Fixture    student

    Connect to Postgres

    Delete Enrollment By E-mail    ${student}[email]

    Disconnect From Database

    Do Login    ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student    ${student}[name]
    Select Plan    ${student}[enroll][plan]
    Fill Start Date    2022-11-14
    Click    css=button[type=submit]
    Verify Toaster    Matrícula cadastrada com sucesso

Should enroll a student through the API
    ${admin}    Get Fixture    admin
    ${suelen}    Get Fixture    suelen

    ${token}    Get Service Token    ${admin}

    POST New Student    ${token}    ${suelen}[student]

