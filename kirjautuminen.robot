*** Settings ***
Library           Browser
Library           apufunktiot.py
Test Setup        Avaa Verkkokauppa
Test Teardown     Close Browser

*** Variables ***
${URL}            https://www.saucedemo.com/
${KAYTTAJA}       standard_user
${SALASANA}       secret_sauce

*** Test Cases ***
Onnistunut Kirjautuminen Verkkokauppaan
    [Documentation]    Testaa, että oikeilla tunnuksilla pääsee sisään.
    Syota Tunnukset Ja Kirjaudu    ${KAYTTAJA}    ${SALASANA}
    Get Text    .title    ==    Products

Epaonnistunut Kirjautuminen Vaaralla Salasanalla
    [Documentation]    Testaa, että väärä salasana näyttää virheilmoituksen.
    ${vaara_salasana}=    Luo Vaara Salasana    12
    Syota Tunnukset Ja Kirjaudu    ${KAYTTAJA}    ${vaara_salasana}
    Get Text    [data-test="error"]    *=    Username and password do not match

Tuotteen Lisaaminen Ostoskoriin Ja Poistaminen
    [Documentation]    Testaa, että tuotteen lisääminen ja poistaminen päivittää ostoskorin laskurin.
    Syota Tunnukset Ja Kirjaudu    ${KAYTTAJA}    ${SALASANA}
    Click    css=#add-to-cart-sauce-labs-backpack
    Get Text    .shopping_cart_badge    ==    1
    Click    css=#remove-sauce-labs-backpack
    Get Element Count    .shopping_cart_badge    ==    0

*** Keywords ***
Avaa Verkkokauppa
    # headless=False avaa selaimen näkyviin, jotta näet mitä tapahtuu
    New Browser    chromium    headless=False
    New Page       ${URL}

Syota Tunnukset Ja Kirjaudu
    [Arguments]    ${tunnus}    ${salasana}
    Fill Text      css=#user-name    ${tunnus}
    Fill Text      css=#password     ${salasana}
    Click          css=#login-button