*** Settings ***
Documentation       Admin can enroll new students

Resource            ../resources/base.resource


*** Test Cases ***
Should enroll an student
    ${admin}    Create Dictionary
    ...    name=Admin
    ...    email=admin@smartbit.com
    ...    pass=qacademy

    Do Login    ${admin}

    Go To Enrolls
    Go To Enroll Form
    Select Student    Arabella
    Select Plan    Smart
    Fill Start Date    2022-11-14
    Click    css=button[type=submit]
    Verify Toaster    Matrícula cadastrada com sucesso

