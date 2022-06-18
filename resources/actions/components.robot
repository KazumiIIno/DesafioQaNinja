***Settings***
Documentation           Ações de componentes genéricos


***Keywords***
## Validations
Toaster Text Should Be
#e ele vai receber um argumento
    [Arguments]         ${expect_text}
    Wait For Elements State         css=.Toastify__toast-body >> text=${expect_text}     visible             5

Alert Text should Be
    #que recebe uma variável de argumento com o seguinte nome: expect_text
    [Arguments]                     ${expect_text}
    Wait For Elements State         css=form span >> text=${expect_text}              visible             5

Field Should Be Type
    [Arguments]         ${element}          ${type}
    ${attr}        Get Attribute            ${element}        type
    Should Be Equal             ${attr}         ${type}

Register Should Not Be Found
    Wait For Elements State         css=div >> text=Nenhum registro encontrado.             visible         5
    Wait For Elements State         css=table               detached            5

Total Items Should Be
    [Arguments]             ${number}

    ${element}          Set Variable            css=#pagination .total

    Wait For Elements State         ${element}          visible             5
    Get Text                        ${element}          ==                  Total: ${number}

## Return elements & Texts
Get Required Alerts
    [Arguments]             ${index}
    ${span}     Get Text            xpath=(//form//span)[${index}]

    [return]        ${span}

