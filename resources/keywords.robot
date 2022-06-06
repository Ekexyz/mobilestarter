*** Settings ***
Library   QMobile   configs=${CURDIR}${/}${/}config${/}config.yaml
Library   DebugLibrary

*** Variables ***
${First_Run}   ${True}

*** Keywords ***

Calculator
    Run Keyword IF    ${First_Run}==${True}         Open Mobile App
    ...    ELSE       Launch Application

Open Mobile App
    OpenApp
    Set Suite Variable  ${First_Run}   ${False}

Launch Application
    [Documentation]   Launch app on non-Browserstack provider

    ${appPackage}=    GetConfig      capabilities.appPackage
    ${appActivity}=   GetConfig      capabilities.appActivity
    StartActivity     ${appPackage}  ${appActivity}
