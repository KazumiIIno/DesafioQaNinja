***Settings***
Documentation       Buscar planos

Resource            ${EXECDIR}/resources/base.robot

Test Setup             Start Admin Session
Test Teardown           Take Screenshot


***Test Cases***
Cenario: Busca Exata
    &{plan}        Create Dictionary        title=Plano teste 2          duration=12         price=19.99         total=R$ 239,88
    Remove Plan By Title                    ${plan.title}
    Insert Plan                             ${plan}
    Go To Plans
    Search Plan By Title                    ${plan.title}
    Plan Title Should Be Visible            ${plan.title}
    Total Items Should Be                   1

Cenario: Registro nao encontrado
    ${title}            Set Variable         Blue I
    Remove Plan By Title                    ${title}
    Go To Plans
    Search Plan By Title                    ${title}
    Register Should Not Be Found

Cenario: Buscar alunos por um unico termo
    ${fixute}           Get JSON        plans-search.json
    ${plans}         Set Variable          ${fixute['plans']}   

    ${word}             Set Variable           ${fixute['word']}
    ${total}             Set Variable           ${fixute['total']}
    #Log To Console              ${json_object['students']}

    Remove Plan By Title          ${word}

    FOR         ${item}     IN      @{plans}
        Insert Plan          ${item}
    END

    Go To Plans
    Search Plan By Title          ${word}

    FOR         ${item}     IN      @{plans}
        Plan Title Should Be Visible             ${item['title']}
    END

    Total Items Should Be               ${total}