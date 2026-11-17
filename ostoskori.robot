*** Settings ***
Resource          resurssit.resource
Test Setup        Avaa Verkkokauppa
Test Teardown     Close Browser

*** Test Cases ***
Tuotteen Lisaaminen Ostoskoriin Ja Poistaminen
    [Documentation]    Testaa, että tuotteen lisääminen ja poistaminen päivittää ostoskorin laskurin.
    Syota Tunnukset Ja Kirjaudu    ${KAYTTAJA}    ${SALASANA}
    Click    css=#add-to-cart-sauce-labs-backpack
    Get Text    .shopping_cart_badge    ==    1
    Click    css=#remove-sauce-labs-backpack
    Get Element Count    .shopping_cart_badge    ==    0