***Settings***
Documentation       Cadastro de alunos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup             Start Admin Session
Test Teardown           Take Screenshot


***Test Cases***
Cenario: Novo aluno

    &{student}              Create Dictionary           name=Teste Cadastro             email=teste_cadastro@gmail.com              age=38          weight=92               feet_tall=1.70

    Remove Student              ${student.email}
    Go To Students
    Go To Form Student
    # ações do cenário
    New Student         ${student}
    #validação
    Toaster Text Should Be          Aluno cadastrado com sucesso.

    [TearDown]                         Thinking And Take Screenshot         2

Cenario: Nao deve permirtir email duplicado
    [Tags]                  dup
    &{student}              Create Dictionary           name=Teste Cadastro 2             email=teste_cadastro2@gmail.com              age=40          weight=72               feet_tall=1.80

    Set Strict Mode                     false
    Insert Student          ${student}

    Go To Students
    Go To Form Student
    # ações do cenário
    New Student         ${student}
    #validação
    Toaster Text Should Be          Email já existe no sistema.

    [TearDown]                         Thinking And Take Screenshot         2

Cenario: Todos os campos devem ser obrigatórios
    @{expected_alerts}          Set Variable            Nome é obrigatório          O e-mail é obrigatório          idade é obrigatória         o peso é obrigatório         a Altura é obrigatória
    @{got_alerts}               Create List

    Go To Students
    Go To Form Student
    Submit Student Form
    
    #FOR         ${alert}        IN          @{expected_alerts}
        #Alert Text should Be            ${alert}      
    #END

    FOR         ${index}        IN RANGE        1   6
        ${span}                 Get Required Alerts          ${index}
        Append To List          ${got_alerts}                ${span}
    END

    Log         ${expected_alerts}
    Log         ${got_alerts}

    Lists Should Be Equal           ${expected_alerts}              ${got_alerts}

Cenario: Validacao dos campos numericos
    [Tags]                  temp
    [Template]              Check Type Field On Student Form        
    ${AGE_FIELD}             number
    ${WEIGHT_FIELD}          number
    ${FEET_TALL}       number

Cenario: Validar campo do tipo email
    [Tags]                  temp
    [Template]          Check Type Field On Student Form        
    ${EMAIL_FIELD}       email

Cenario: Menor de 14 anos nao pode fazer cadastro
    &{student}              Create Dictionary           name=Kaue Oliveira             email=kaue@yahoo.com              age=13          weight=55               feet_tall=1.50
    Go To Students
    Go To Form Student
    New Student                     ${student}
    Alert Text should Be            A idade deve ser maior ou igual 14 anos 

***Keywords***
Check Type Field On Student Form
    [Arguments]                         ${element}          ${type}
    Set Strict Mode                     false
    Go To Students
    Go To Form Student
    Field Should Be Type              ${element}            ${type}