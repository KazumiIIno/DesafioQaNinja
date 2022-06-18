***Settings***
Documentation       Suite de testes de login do Administrador

Resource            ${EXECDIR}/resources/base.robot

Suite Setup             Start Browser Session
Test Teardown           Take Screenshot

***Test Cases***
Cenario: Login do Administrador
    Go To Login Page

    Login With                          admin@bodytest.com  pwd123

    User Should Be Logged In             Administrador

    [TearDown]                              Clear LS And Take Screenshot
    

Cenario: Senha incorreta
    Go To Login Page

    Login With                          admin@bodytest.com  abc123

    Toaster Text Should Be              Usuário e/ou senha inválidos.
    [TearDown]                         Thinking And Take Screenshot         2

Cenario: Email não cadastrado
    Go To Login Page

    Login With                          teste@gmail.com  abc123

    Toaster Text Should Be              Usuário e/ou senha inválidos.
    [TearDown]                         Thinking And Take Screenshot         2

Cenario: Email invalido
    Go To Login Page

    Login With                  admin&bodytest.com  pwd123

    Alert Text should Be        Informe um e-mail válido

Cenario: Senha nao informada
    Go To Login Page

    Login With                  admin@bodytest.com  ${EMPTY}

    Alert Text should Be         A senha é obrigatória


Cenario: Email nao informado
    Go To Login Page

    Login With                      ${EMPTY}  abc123

    Alert Text should Be            O e-mail é obrigatório


Cenario: Email e senha nao informados
    Go To Login Page

    Login With  ${EMPTY}  ${EMPTY}
    
    Alert Text should Be                    O e-mail é obrigatório
    Alert Text should Be                    A senha é obrigatória  
