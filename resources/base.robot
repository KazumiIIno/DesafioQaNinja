#O arquivo base é uma estratégia para poder carregar os meus recursos
***Settings***
Documentation           Tudo começa aqui, meu arquivo base do projeto de automação

Library             Browser
Library             libs/DeloreanLibray.py
Library             Collections
Library             OperatingSystem

Resource            actions/auth.robot
Resource            actions/students.robot
Resource            actions/plans.robot

Resource            actions/nav.robot
Resource            actions/components.robot

***Keywords***
Start Browser Session
    New Browser         chromium        False
    New Page            about:blank

Start Admin Session
    Start Browser Session
    Go To Login Page
    Login With                          admin@bodytest.com  pwd123
    User Should Be Logged In             Administrador

Clear LS And Take Screenshot
    Take Screenshot
    LocalStorage Clear

Thinking And Take Screenshot
    [Arguments]         ${timeout}
    Sleep               ${timeout}
    Take Screenshot

###Helpers
Get JSON
    [Arguments]         ${file_name}
    #Aqui eu consigo ler o conteúdo desse arquivo através do Get File. E se estou lendo o conteúdo do arquivo e a minha keyword é do tipo get quer dizer que 
    #ela vai retornar o conteúdo do arquivo para mim. E posso armazenar em uma variável. Colocar em uma variável simples
    ${file}=            Get File                ${EXECDIR}/resources/fixtures/${file_name}
    ${json_object}          Evaluate            json.loads($file)            json

    [return]            ${json_object}