*** Settings ***
Documentation     A test suite with a single Gherkin style test.
Resource          ../resources/Resources.robot
Library    SeleniumLibrary
Library    ../script.py


*** Keywords ***
Take Custom Screenshot
    [Arguments]    ${screen_shot_name}
    Capture Custom Screenshot   ${REPORTOUTPUTDIR}${screen_shot_name}
    Log    <img src=".${REPORTOUTPUTDIR}${screen_shot_name}.png">    HTML