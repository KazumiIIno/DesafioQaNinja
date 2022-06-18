***Settings***
Documentation       Remover planos

Resource            ${EXECDIR}/resources/base.robot

Test Setup             Start Admin Session
Test Teardown           Take Screenshot


***Test Cases***
Cenario: Remover plano cadastrado

    &{plan}         Create Dictionary           title=Plano teste remocao           duration=12         price=1999         total=R$ 239,88

    Insert Plan                          ${plan}
    Go To Plans
    Search Plan By Title                 ${plan.title}
    Request Removal By Title             ${plan.title}
    Confirm Removal
    Toaster Text Should Be               Plano removido com sucesso
    Plan Should Note Visible             ${plan.title}
    [TearDown]                           Thinking And Take Screenshot         2

Cenario: Desistir da exclusao
    &{plan}         Create Dictionary           title=Plano teste remocao           duration=12         price=1999         total=R$ 239,88

    Insert Plan                      ${plan}
    Go To Plans
    Search Plan By Title             ${plan.title}
    Request Removal By Title         ${plan.title}
    Cancel Removal
    Plan Should Be Visible           ${plan.title}