***Settings***
Documentation       Cadastro de planos

Resource            ${EXECDIR}/resources/base.robot

Suite Setup             Start Admin Session
Test Teardown           Take Screenshot


***Test Cases***
Cenario: Calcular o preco total do plano
    &{plan}         Create Dictionary           title=Plano teste           duration=12         price=19,99         total=R$ 239,88
    Go To Plans
    Go To Form Plan
    Fill Plan Form          ${plan}
    Total Plan Should Be   ${plan.total}

Cenario: Criar um plano
    &{plan}         Create Dictionary           title=Plano teste           duration=12         price=19,99         total=R$ 239,88
    Set Strict Mode                     false
    Go To Plans
    Go To Form Plan
    Fill Plan Form          ${plan}
    Total Plan Should Be   ${plan.total}
    Submit Plan Form
    Toaster Text Should Be          Plano cadastrado com sucesso

    [TearDown]                         Thinking And Take Screenshot         2

Cenario: Validar campos obrigatorios
    @{expected_alerts}          Set Variable        Informe o título do plano           Informe a duração do plano em meses
    @{got_alerts}               Create List
    Go To Plans
    Go To Form Plan
    Submit Plan Form
    FOR         ${index}        IN RANGE        1   3
        ${span}                 Get Required Alerts          ${index}
        Append To List          ${got_alerts}                ${span}
    END

    Log         ${expected_alerts}
    Log         ${got_alerts}

    Lists Should Be Equal           ${expected_alerts}              ${got_alerts}