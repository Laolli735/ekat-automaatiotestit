*** Settings ***
Library           Browser
Library           apufunktiot.py

*** Variables ***
${URL}            https://www.saucedemo.com/
${KAYTTAJA}       standard_user
${SALASANA}       secret_sauce

*** Keywords ***
Avaa Verkkokauppa
    New Browser    chromium    headless=False
    New Page       ${URL}

Syota Tunnukset Ja Kirjaudu
    [Arguments]    ${tunnus}    ${salasana}
    Fill Text      css=#user-name    ${tunnus}
    Fill Text      css=#password     ${salasana}
    Click          css=#login-button