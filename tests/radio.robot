*** Settings ***
Resource    ../resources/base.resource

*** Test Cases ***
Deve selecionar a opção Javascript
    Start session
    Get Started
    Navigate to     Check e Radio
    Go to item      Botões de radio    Escolha sua linguagem preferida
   
    Click Element   xpath=//android.widget.RadioButton[contains(@text,"Javascript")]
    Sleep           3

    Close session