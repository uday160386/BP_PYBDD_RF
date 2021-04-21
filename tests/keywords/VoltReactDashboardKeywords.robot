*** Settings ***
Documentation     A test suite with a single Gherkin style test.
Resource          ../resources/Resources.robot
Resource          ../resources/App_Resources.robot
Resource          ../keywords/Common.robot
Resource          ../data/testdata.robot
Library    SeleniumLibrary
Library    OperatingSystem

*** Keywords ***
Open Browser To Volt React Page
    ${chrome_options}=  Evaluate  sys.modules['selenium.webdriver'].ChromeOptions()  sys, selenium.webdriver
    Call Method    ${chrome_options}    add_argument    --no-sandbox
    Call Method    ${chrome_options}    add_argument    --headless
#    Open Browser   ${LOGIN URL}   ${BROWSER}   options=${chrome_options}      executable_path=${CHROMEDRIVER_PATH}
    Open Browser   ${LOGIN URL}   ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

#
Volt React Page Should Be Open
    Title Should Be    Volt React Dashboard
    Take Custom Screenshot   HomePage

Browser is opened to Volt React Main page
    Open Browser To Volt React Page
    Volt React Page Should Be Open

I Click on dashboard button
    Click Link    ${HOME_DASHBOARD_BUTTON}
    Element Should Be Visible    ${OVERVIEW_DASHBOARD_LABEL}    timeout=${WAIT_TIMEOUT}

I should see dashboard page
    Page Should Contain Element     ${OVERVIEW_DASHBOARD_LABEL}
    Take Custom Screenshot   DashboardHomePage

When I enter text in search box
    Input Text  ${SEARCH_TEXTBOX}   ${SEARCH_TEXT}

And I click on enter button
    Press Keys    ${SEARCH_TEXTBOX}    ENTER
