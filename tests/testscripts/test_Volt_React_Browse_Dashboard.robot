*** Settings ***
Documentation     A test suite with a single Gherkin style test.
Resource          ../keywords/VoltReactDashboardKeywords.robot
Resource          ../resources/App_Resources.robot
Test Teardown     Close Browser

*** Test Cases ***
Browse Volt React
    Given browser is opened to Volt React Main page
    When I click on dashboard button
    Then I should see dashboard page
    When I enter text in search box
    And I click on enter button
