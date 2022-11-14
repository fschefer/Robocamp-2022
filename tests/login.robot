*** Settings ***
Documentation        Suite de testes de autenticação
...                  Administrador deve acessar o portal de gestão de academias

Resource        ../resources/base.resource

*** Test Cases ***
    
Admin login

    Go To Login Page
    Fill Credentials    admin@smartbit.com       qacademy
    Submit Credentials
    User Should Be Looged In    Admin

Incorrect Email
    Go To Login Page
    Fill Credentials      404@smartbit.com        qacademy
    Submit Credentials
    Verify Toaster        Suas credenciais são inválidas, por favor tente novamente!

Incorrect password
    Go To Login Page
    Fill Credentials        admin@smartbit.com    abc123
    Submit Credentials
    Verify Toaster        Suas credenciais são inválidas, por favor tente novamente!

Email in incorrect format
    Go To Login Page
    Fill Credentials        @com.br        abc123
    Submit Credentials
    Field Type Should Be Email 

Blank password
    Go To Login Page
    Fill Credentials    admin@smartbit.com       ${EMPTY}
    Submit Credentials
    Alert Text Should Be        password    A senha é obrigatória

Blank email    
    Go To Login Page
    Fill Credentials    ${EMPTY}       qacademy
    Submit Credentials
    Alert Text Should Be        email       O e-mail é obrigatório

Blank email and password

    Go To Login Page
    Submit Credentials
    Alert Text Should Be        email       O e-mail é obrigatório
    Alert Text Should Be        password    A senha é obrigatória
