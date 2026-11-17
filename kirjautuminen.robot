*** Settings ***
Resource          resurssit.resource
Test Setup        Avaa Verkkokauppa
Test Teardown     Close Browser

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