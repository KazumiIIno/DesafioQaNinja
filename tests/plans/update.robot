***Settings***
Documentation       Atualizar plano

Resource            ${EXECDIR}/resources/base.robot

Suite Setup             Start Admin Session
Test Teardown           Take Screenshot

***Test Cases***
Cenario: Atualizar um plano já cadastrado
    ${fixture}          Get JSON    plans-update.json

    ${plan}      Set Variable        ${fixture['before']}
    ${updateplan}         Set Variable        ${fixture['after']}

    Remove Plan By Title                  ${plan['title']}

    Insert Plan                          ${plan}
    Go To Plans
    Search Plan By Title                  ${plan['title']}

    Go To Plan Update Form              ${plan['title']} 

    Update A Plan                        ${updateplan}

    Toaster Text Should Be                  Plano atualizado com sucesso
    [TearDown]                              Thinking And Take Screenshot         2