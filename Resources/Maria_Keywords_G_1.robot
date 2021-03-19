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

Invalid Username
    [Arguments]                 ${INVALID USER}   ${VALID PASSWORD}
    Input text                  id:email    ${INVALID USER}
    Input text                  id:password    ${VALID PASSWORD}
    press keys                  xpath://*[@id="login"]  RETURN
    wait until page contains    Wrong e-mail or password
    page should contain         Login

Invalid Password
    [Arguments]                 ${VALID USER}      ${INVALID PASSWORD}
    Input text                  id:email    ${VALID USER}
    Input text                  id:password    ${INVALID PASSWORD}
    press keys                  xpath://*[@id="login"]      RETURN
    wait until page contains    Wrong e-mail or password
    page should contain         Login

Invalid Username And Password
    [Arguments]                 ${INVALID USER}     ${INVALID PASSWORD}
    Input text                  id:email    ${INVALID USER}
    Input text                  id:password    ${INVALID PASSWORD}
    press keys                  xpath://*[@id="login"]      RETURN
    wait until page contains    Wrong e-mail or password
    page should contain         Login

Empty Username
    [Arguments]                 ${EMPTY USER}   ${VALID PASSWORD}
    Input text                  id:email    ${EMPTY USER}
    Input text                  id:password    ${VALID PASSWORD}
    press keys                  xpath://*[@id="login"]      RETURN
    wait until page contains    Wrong e-mail or password
    page should contain         Login

Empty Password
    [Arguments]                 ${VALID USER}   ${EMPTY PASSWORD}
    Input text                  id:email    ${VALID USER}
    Input text                  id:password    ${EMPTY PASSWORD}
    press keys                  xpath://*[@id="login"]      RETURN
    wait until page contains    Wrong e-mail or password
    page should contain         Login

Empty Username And Password
    [Arguments]                 ${EMPTY USER}   ${EMPTY PASSWORD}
    Input text                  id:email    ${EMPTY USER}
    Input text                  id:password    ${EMPTY PASSWORD}
    press keys                  xpath://*[@id="login"]      RETURN
    wait until page contains    Wrong e-mail or password
    page should contain         Login

Valid Username And Password
    [Arguments]                 ${VALID USER}   ${VALID PASSWORD}
    Input text                  id:email    ${VALID USER}
    Input text                  id:password    ${VALID PASSWORD}
    press keys                  xpath://*[@id="login"]      RETURN
    wait until page contains    You are signed in as Maria
    page should contain         You are signed in as Maria

END WEB TEST
        Close Browser
