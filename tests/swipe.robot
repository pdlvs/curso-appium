*** Settings ***
Resource     ../resources/base.resource

*** Test Cases ***
Deve poder remover o Darth Vader
    Start session
    Get started

    Navigate to    Star Wars
    Go to item     Lista    Darth Vader
    #busca o elemento que será feito o movimento de swipe
    ${positions}   Get Element Location    xpath=//android.widget.TextView[@text="@darthvader"]/../../..//*[contains(@resource-id, "indicator")]

    ${start_x}    Set Variable    ${positions}[x]
    ${start_y}    Set Variable    ${positions}[y]
    ${offset_x}   Evaluate        ${positions}[x] - 650     #faz a subtração do start x para setar o valor exato do inicio do swipe
    ${offset_y}   Set Variable    ${positions}[y]

    Swipe    ${start_x}   ${start_y}    ${offset_x}    ${offset_y}    1000

    Click Element    id=com.qaxperience.yodapp:id/btnRemove

    Wait Until Page Does Not Contain    Darth Vader

    Close session