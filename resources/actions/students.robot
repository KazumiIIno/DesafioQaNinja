***Settings***
Documentation       Ações da feature de gestão de alunos

***Variables***
${NAME_FIELD}           css=input[name=name]
${EMAIL_FIELD}         css=input[name=email]
${AGE_FIELD}            css=input[name=age]
${WEIGHT_FIELD}         css=input[name=weight]
${FEET_TALL}            css=input[name=feet_tall]

***Keywords***
## Forms
Submit Student Form
    Click               xpath=//button[contains(text(), "Salvar")]

New Student
    [Arguments]         ${student}
    Fill Text           ${NAME_FIELD}                ${student.name}
    Fill Text           ${EMAIL_FIELD}               ${student.email}
    Fill Text           ${AGE_FIELD}                 ${student.age}
    Fill Text           ${WEIGHT_FIELD}              ${student.weight}
    Fill Text           ${FEET_TALL}                 ${student.feet_tall}
    Submit Student Form

Update A Student
    [Arguments]         ${student}
    Fill Text           ${NAME_FIELD}                ${student['name']}
    Fill Text           ${EMAIL_FIELD}               ${student['email']}
    Fill Text           ${AGE_FIELD}                 ${student['age']}
    Fill Text           ${WEIGHT_FIELD}              ${student['weight']}
    Fill Text           ${FEET_TALL}                 ${student['feet_tall']}
    Submit Student Form

Search Student By Name
    [Arguments]         ${name}
    Fill Text 	    css=input[placeholder="Buscar aluno"] 	    ${name}

## Links & Buttons        
Go To Form Student
    Click               css=a[href$="alunos/new"]
    Wait For Elements State             css=h1 >> text=Novo aluno             visible         5

Go To Student Update Form
    [Arguments]         ${email}
    Click           xpath=//td[contains(text(), "${email}")]/..//a[@class="edit"]
    Wait For Elements State             css=h1 >> text=Edição de aluno             visible         5

Request Removal By Email
    [Arguments]     ${email}
    Click       xpath=//td[contains(text(), "${email}")]/../td/button[@id="trash"]

Confirm Removal
    Click           text=SIM, pode apagar! 

Cancel Removal
    Click           text=NÃO

## Validations
Student Should Note Visible
    [Arguments]     ${email}
    Wait For Elements State             xpath=//td[contains(text(), "${email}")]        detached            5

Student Should Be Visible
    [Arguments]     ${email}
    Wait For Elements State             xpath=//td[contains(text(), "${email}")]        visible            5

Student Name Should Be Visible
#eu faço a busca pelo nome e o nome deve estar visivel, já que o nome é o contexto criar um argumento, esse argumento
#é representado pela variável name. 
    [Arguments]         ${name}
#Fazer a validação usando a keyword Wait For Elements State
    Wait For Elements State             css=table tbody tr >> text=${name}              visible             5



