*** Settings ***
Documentation        Admin can enroll new students

Resource        ../resources/base.resource

*** Test Cases ***
Deve matricular um aluno

    # Falcão Não mexer
    # Smart
    # 11/10/2022

    ${admin}    Create Dictionary
    ...         name=Admin
    ...         email=admin@smartbit.com
    ...         pass=qacademy

    Do Login    ${admin}
    
    Go To Enrolls
    Go To Enroll Form
    Select Student    Arabella
    Select Plan       Smart
    Fill Start Date
