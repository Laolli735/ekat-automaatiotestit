*** Settings ***
Resource          resurssit.resource
Test Setup        Avaa Verkkokauppa
Test Teardown     Close Browser

*** Test Cases ***
Kasittele Massatilaukset Tiedostosta
    [Documentation]    Lukee tilaukset CSV-tiedostosta ja vie jokaisen tilauksen kassan läpi.
    Syota Tunnukset Ja Kirjaudu    ${KAYTTAJA}    ${SALASANA}
    ${tilaukset}=    Lue Tilaukset Csv    tilaukset.csv
    FOR    ${tilaus}    IN    @{tilaukset}
        Tee Yksittainen Tilaus
        ...    ${tilaus}[etunimi]
        ...    ${tilaus}[sukunimi]
        ...    ${tilaus}[postinumero]
        ...    ${tilaus}[tuote]
    END

*** Keywords ***
Tee Yksittainen Tilaus
    [Arguments]    ${etunimi}    ${sukunimi}    ${postinumero}    ${tuote}
    # 1. Lisää tuote koriin ja siirry ostoskoriin
    Click          css=#add-to-cart-${tuote}
    Click          css=.shopping_cart_link
    # 2. Siirry kassalle ja täytä asiakkaan tiedot
    Click          css=#checkout
    Fill Text      css=#first-name     ${etunimi}
    Fill Text      css=#last-name      ${sukunimi}
    Fill Text      css=#postal-code    ${postinumero}
    Click          css=#continue
    # 3. Vahvista tilaus ja palaa takaisin tuotesivulle seuraavaa tilausta varten
    Click          css=#finish
    Get Text       css=.complete-header    ==    Thank you for your order!
    Click          css=#back-to-products