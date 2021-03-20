#User name: maria.shishkina@iths.se
#password: Sverige2021
#phone number: 0707070707
*** Settings ***
Documentation           This is a test of Infotiv's car booking system
Resource                ../Resources/Maria_Keywords_VG.robot
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
${CARD NUMBER}              1234567891234567
${CARD HOLDER}              ITHS
${CARD CCV}                 123

*** Test Cases ***
User can access website and book a car
    [Documentation]             This is a test to see if a user can book a Audi Q7 for trip between 15th and 16th March 2021
    [Tags]                      VG_Test_Maria
    GIVEN Web page is open at start page
    WHEN User sees login window
    AND User types username    ${VALID USER}
    AND User types password    ${VALID PASSWORD}
    AND User pushes a button "Login"
    AND User gets a welcome massege
    AND User sees a calender for booking
    AND User selects date for start of trip     ${VALID_MONTH}      ${VALID_START_DAY}
    AND User selects date for end of trip       ${VALID_MONTH}      ${VALID_END_DAY}
    AND User pushes the buttun "Continue"
    AND User sees a list of cars
    AND User sees Audi Q7 in menue
    AND User pushes on button "Book" for Audi Q7
    AND A new page with text "Confirm booking of Audi Q7" will appear
    AND User types card number      ${CARD NUMBER}
    AND User types Name of card holder      ${CARD HOLDER}
    AND User types valid month for card
    AND User types valid year for card
    AND User types ccv number for card      ${CARD CCV}
    AND user pushes the button Confirm
    THEN User gets confirmation of booking