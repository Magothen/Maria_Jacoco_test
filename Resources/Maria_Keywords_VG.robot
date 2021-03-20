*** Keywords ***
BEGIN WEB TEST
    Open browser                about:blank     ${BROWSER}

GIVEN Web page is open at start page
    Load Page
    Verify Page Loaded
Load Page
    Go to                       ${URL}
Verify Page Loaded
    ${link_text}                Get Title
    Should Be Equal             ${link_text}    Infotiv Car Rental

WHEN User sees login window
    wait until page contains    Login

AND User types username
    [Arguments]                 ${VALID USER}
    Input text                  id:email    ${VALID USER}

AND User types password
    [Arguments]                 ${VALID PASSWORD}
    Input text                  id:password    ${VALID PASSWORD}

AND User pushes a button "Login"
     press keys                  xpath://*[@id="login"]      RETURN

AND User gets a welcome massege
    wait until page contains    You are signed in as Maria
    page should contain         You are signed in as Maria

AND User sees a calender for booking
    wait until page contains    When do you want to make your trip?

AND User selects date for start of trip
    [Arguments]             ${VALID_MONTH}     ${VALID_START_DAY}
    press keys              xpath://*[@id="reset"]  RETURN
    Input text              id:start    ${VALID_MONTH}
    Input text              id:start    ${VALID_START_DAY}

AND User selects date for end of trip
    [Arguments]             ${VALID_MONTH}     ${VALID_END_DAY}
    Input text              id:end      ${VALID_MONTH}
    Input text              id:end      ${VALID_END_DAY}

AND User pushes the buttun "Continue"
    press keys              xpath://*[@id="continue"]   RETURN

AND User sees a list of cars
    wait until page contains        What would you like to drive?
    page should contain             What would you like to drive?

AND User sees Audi Q7 in menue
    wait until page contains        Audi
    wait until page contains        Q7

AND User pushes on button "Book" for Audi Q7
    press keys          xpath://*[@id="bookQ7pass5"]    RETURN

AND A new page with text "Confirm booking of Audi Q7" will appear
     wait until page contains      Confirm booking of Audi Q7
     page should contain           Confirm booking of Audi Q7

AND User types card number
    [Arguments]             ${CARD NUMBER}
    Input text              id:cardNum      ${CARD NUMBER}

AND User types Name of card holder
    [Arguments]             ${CARD HOLDER}
    Input text              id:fullName     ${CARD HOLDER}

AND User types valid month for card
    click element              xpath://*[@id="confirmSelection"]/form/select[1]
    click element             xpath://*[@id="month1"]

AND User types valid year for card
    click element              xpath://*[@id="confirmSelection"]/form/select[2]
    click element              xpath://*[@id="month2022"]

AND User types ccv number for card
    [Arguments]             ${CARD CCV}
    Input text              id:cvc      ${CARD CCV}

AND user pushes the button Confirm
    press keys          xpath://*[@id="confirm"]    RETURN

THEN User gets confirmation of booking
    wait until page contains        A Audi Q7 is now ready for pickup 2021-04-15
    page should contain             A Audi Q7 is now ready for pickup 2021-04-15


END WEB TEST
        Close Browser