*** Settings ***
Resource    ../resources/base.resource

*** Test Cases ***
Deve realizar um clique simples
    Start session
    Get Started
    Navigate to     Clique em Botões
    Go to item      Clique simples    Botão clique simples

    Click Text                      CLIQUE SIMPLES
    Wait Until Page Contains        Isso é um clique simples

    Close session

Deve realizar um clique longo
    [Tags]    long

    Start session
    Get Started
    Navigate to     Clique em Botões
    Go to item      Clique longo    Botão clique longo

    ${locator}      Set Variable            id=com.qaxperience.yodapp:id/long_click  #busca o botão que será clicado
    ${positions}    Get Element Location    ${locator}    #pega o valor de x e y em qualquer tamanho de tela


    Tap With Positions    ${1000}    ${${positions}[x], ${positions}[y]}    #ira clicar no botão de acordo com as coordenadas obtidas no passo anterior                 
    Wait Until Page Contains        Isso é um clique longo

    Close session