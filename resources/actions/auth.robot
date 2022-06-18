***Settings***
Documentation       Ações de autorização

***Keywords***
Go To Login Page
    Go To               https://bodytest-web-robotframe.herokuapp.com/

Login With
    #ele vai receber argumentos dentro de colchetes. Quais são os argumentos? email e senha
    #agora ele tem a responsabilidade de fazer o login
    [Arguments]         ${email}            ${pass}

    Fill Text           css=input[name=email]                                   ${email}
    Fill Text           css=input[placeholder*="senha"]                         ${pass} 
    Click               text=Entrar