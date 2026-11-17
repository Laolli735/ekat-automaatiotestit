*** Settings ***
Library           laskurobotti.py
Library           OperatingSystem
Library           Collections
Library           DateTime

*** Variables ***
${SAAPUNEET}      saapuneet_postit
${ARKISTO}        tallennetut_laskut
${KASITELLYT}     kasitellyt_postit

*** Tasks ***
Lajittele Saapuneet Laskut Arkistoon
    [Documentation]    Poimii laskut, nimeää PDF-liitteet päivämäärällä ja siirtää käsitellyt viestit.
    # 1. Alustetaan harjoitusympäristö luomalla 3 testiviestiä
    Luo Testisahkopostit    ${SAAPUNEET}

    # 2. Ajetaan laskurobotti
    ${loytyneet_laskut}=    Kasittele Laskut Kansiosta
    ...    ${SAAPUNEET}
    ...    ${ARKISTO}
    ...    ${KASITELLYT}
    ...    hakusana=Lasku

    # 3. Haetaan kuluva päivämäärä tarkistuksia varten (esim. 2026-11-17)
    ${tanaan}=    Get Current Date    result_format=%Y-%m-%d

    # 4. Varmistetaan PDF-tiedostojen nimeäminen ja viestien siirto
    Log    Arkistoon tallennettiin: ${loytyneet_laskut}
    Length Should Be    ${loytyneet_laskut}    2
    File Should Exist    ${ARKISTO}/${tanaan}_sahkolasku_11_2026.pdf
    File Should Exist    ${ARKISTO}/${tanaan}_lasku_98765.pdf
    File Should Exist    ${KASITELLYT}/viesti_1.eml
    File Should Exist    ${KASITELLYT}/viesti_3.eml
    File Should Not Exist    ${SAAPUNEET}/viesti_1.eml