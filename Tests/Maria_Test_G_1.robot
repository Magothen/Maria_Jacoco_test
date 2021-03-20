#User name: maria.shishkina@iths.se
#password: Sverige2021
#phone number: 0707070707
*** Settings ***
Documentation           This is a test of Infotiv's car booking system
Resource                ../Resources/Maria_Keywords_G_1.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}          chrome
${URL}              http://rental20.infotiv.net/
${VALID USER}       maria.shishkina@iths.se
${VALID PASSWORD}   Sverige2021
${INVALID USER}     invalid
${INVALID PASSWORD}  invalid
${EMPTY USER}
${EMPTY PASSWORD}

*** Test Cases ***                  # User Name        Password
User can access website and login
    [Documentation]             This is a test to see if a user can login
    [Tags]                      G1_Test_Maria
    GO TO WEB PAGE
    Invalid Username                 ${INVALID USER}    ${VALID PASSWORD}
    Invalid Password                 ${VALID USER}      ${INVALID PASSWORD}
    Invalid Username And Password    ${INVALID USER}    ${INVALID PASSWORD}
    Empty Username                   ${EMPTY USER}      ${VALID PASSWORD}
    Empty Password                   ${VALID USER}      ${EMPTY PASSWORD}
    Empty Username And Password      ${EMPTY USER}      ${EMPTY PASSWORD}
    Valid Username And Password      ${VALID USER}      ${VALID PASSWORD}

