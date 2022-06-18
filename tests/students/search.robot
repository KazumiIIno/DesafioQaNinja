***Settings***
Documentation       Buscar alunos

Resource            ${EXECDIR}/resources/base.robot

Test Setup             Start Admin Session
Test Teardown           Take Screenshot


***Test Cases***
Cenario: Busca Exata

    &{student}         Create Dictionary       name=Steve Jobs         email=jobs@apple.com        age=45      weight=80       feet_tall=1.80

    Remove Student By Name              ${student.name}

    #agora o que vou fazer? Inserir essa massa no ambiente de teste
    #Chamando a keyword Insert Student que é a keyword que insere através do banco de dados, a massa
    #tem que estar lá para que eu possa testar
    Insert Student          ${student}
    #na sequencia chamar Go To Students
    Go To Students
    #Como faço essa busca? Eu tenho que preencher o campo de busca
    Search Student By Name          ${student.name}
    #Validação. Temos 2 pontos de validação: O primeiro é garantir que o Steve Jobs apareça na tabela
    #O segundo é verificar se o total é 1
    #Já estou validando e garantindo que o Steve Jobs aparece na busca
    Student Name Should Be Visible      ${student.name}
    #Agora vou validar que ao pesquisar o Steve Jobs ele vai trazer um único registro
    Total Items Should Be               1

Cenario: Registro nao encontrado
    ${name}         Set Variable            Barão Zemo
    Remove Student By Name          ${name}
    Go To Students
    Search Student By Name          ${name}
    Register Should Not Be Found

Cenario: Buscar alunos por um unico termo
    [tags]              json

    ${fixute}           Get JSON        students-search.json
    ${students}         Set Variable          ${fixute['students']}   

    ${word}             Set Variable           ${fixute['word']}
    ${total}             Set Variable           ${fixute['total']}
    #Log To Console              ${json_object['students']}

    Remove Student By Name          ${word}

    FOR         ${item}     IN      @{students}
        Insert Student          ${item}
    END

    Go To Students
    Search Student By Name              ${word}

    FOR         ${item}     IN      @{students}
        Student Name Should Be Visible              ${item['name']}
    END

    Total Items Should Be               ${total}
