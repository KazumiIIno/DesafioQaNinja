***Settings***
Documentation       Atualizar alunos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup             Start Admin Session
Test Teardown           Take Screenshot


***Test Cases***
Cenario: Atualizar um aluno já cadastrado
    ${fixture}          Get JSON    students-update.json

    ${khamalakhan}      Set Variable        ${fixture['before']}
    ${msmarvel}         Set Variable        ${fixture['after']}

    Remove Student By Name                  ${khamalakhan['name']}
    Remove Student By Name                  ${msmarvel['name']}

    Insert Student                          ${khamalakhan}
    Go To Students
    Search Student By Name                  ${khamalakhan['name']}

    Go To Student Update Form               ${khamalakhan['email']} 

    Update A Student                        ${msmarvel}

    Toaster Text Should Be                  Aluno atualizado com sucesso.
    [TearDown]                              Thinking And Take Screenshot         2

