*** Keywords ***
BEGIN WEB TEST
    Open browser                about:blank     ${BROWSER}

GO TO WEB PAGE
    Load Page
    Verify Page Loaded
Load Page
    Go to                       ${URL}
Verify Page Loaded
    ${link_text}                Get Title
    Should Be Equal             ${link_text}    Infotiv Car Rental

#20201-02-15 TILL 2021-03-16
DATE BEFORE
    [Arguments]             ${INVALID_START_MONTH}   ${VALID_START_DAY}     ${VALID_MONTH}      ${VALID_END_DAY}
    press keys              xpath://*[@id="reset"]  RETURN
    Input text              id:start    ${INVALID_START_MONTH}
    Input text              id:start    ${VALID_START_DAY}
    Input text              id:end      ${VALID_MONTH}
    Input text              id:end      ${VALID_END_DAY}
    press keys              xpath://*[@id="continue"]   RETURN
    page should contain     When do you want to make your trip?
    press keys              xpath://*[@id="reset"]  RETURN


#2021-03-15 TILL 2021-05-16
DATE AFTER
    [Arguments]             ${VALID_MONTH}    ${VALID_START_DAY}    ${INVALID_END_MONTH}    ${VALID_END_DAY}
    press keys              xpath://*[@id="reset"]  RETURN
    Input text              id:start    ${VALID_MONTH}
    Input text              id:start    ${VALID_START_DAY}
    Input text              id:end      ${INVALID_END_MONTH}
    Input text              id:end      ${VALID_END_DAY}
    press keys              xpath://*[@id="continue"]   RETURN
    page should contain     When do you want to make your trip?
    press keys              xpath://*[@id="reset"]  RETURN


#2021-03-15 TILL 2021-03-16
VALID DATE
    [Arguments]             ${VALID_MONTH}     ${VALID_START_DAY}   ${VALID_END_DAY}
    press keys              xpath://*[@id="reset"]  RETURN
    Input text              id:start    ${VALID_MONTH}
    Input text              id:start    ${VALID_START_DAY}
    Input text              id:end      ${VALID_MONTH}
    Input text              id:end      ${VALID_END_DAY}
    press keys              xpath://*[@id="continue"]   RETURN
    wait until page contains        What would you like to drive?
    page should contain          What would you like to drive?


END WEB TEST
        Close Browser