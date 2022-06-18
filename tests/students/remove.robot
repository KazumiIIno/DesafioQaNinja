***Settings***
Documentation       Remover alunos

Resource            ${EXECDIR}/resources/base.robot

Test Setup             Start Admin Session
Test Teardown           Take Screenshot


***Test Cases***
Cenario: Remover aluno cadastrado

    &{student}              Create Dictionary           name=Robert Parttison             email=batman@gmail.com              age=28         weight=70               feet_tall=1.80

    Insert Student                      ${student}
    Go To Students
    Search Student By Name              ${student.name}
    Request Removal By Email            ${student.email}
    Confirm Removal
    Toaster Text Should Be              Aluno removido com sucesso.
    Student Should Note Visible         ${student.email}
    [TearDown]                         Thinking And Take Screenshot         2

Cenario: Desistir da exclusao
    &{student}              Create Dictionary           name=Robert Downey Jr             email=ironman@gmail.com              age=28         weight=70               feet_tall=1.80

    Insert Student                      ${student}
    Go To Students
    Search Student By Name              ${student.name}
    Request Removal By Email            ${student.email}
    Cancel Removal
    Student Should Be Visible           ${student.email}

