#User name: maria.shishkina@iths.se
#password: Sverige2021
#phone number: 0707070707
*** Settings ***
Documentation           This is a test of Infotiv's car booking system
Resource                ../Resources/Maria_Keywords_G_2.robot
Library                 SeleniumLibrary
Test Setup              BEGIN WEB TEST
Test Teardown           END WEB TEST

*** Variables ***
${BROWSER}          chrome
${URL}              http://rental20.infotiv.net/
${VALID USER}       maria.shishkina@iths.se
${VALID PASSWORD}   Sverige2021
${VALID_MONTH}              04
${VALID_START_DAY}          15
${VALID_END_DAY}            16
${INVALID_START_MONTH}      03
${INVALID_END_MONTH}        06


*** Test Cases ***
User can access website and choose a date in calender to book a car
    [Documentation]             This is a test to see if a user can login
    [Tags]                      G2_Test_Maria
    GO TO WEB PAGE
    DATE BEFORE                 ${INVALID_START_MONTH}   ${VALID_START_DAY}     ${VALID_MONTH}   ${VALID_END_DAY}
    DATE AFTER                  ${VALID_MONTH}    ${VALID_START_DAY}    ${INVALID_END_MONTH}    ${VALID_END_DAY}
    VALID DATE                  ${VALID_MONTH}     ${VALID_START_DAY}       ${VALID_END_DAY}