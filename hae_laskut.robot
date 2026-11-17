*** Settings ***
Library           laskurobotti.py
Library           OperatingSystem
Library           Collections

*** Variables ***
${SAAPUNEET}      saapuneet_postit
${ARKISTO}        tallennetut_laskut

*** Tasks ***
Lajittele Saapuneet Laskut Arkistoon
    [Documentation]    Simuloi sähköpostien saapumisen, poimii laskut ja tallentaa PDF-liitteet.
    # 1. Alustetaan harjoitusympäristö luomalla 3 testiviestiä
    Luo Testisahkopostit    ${SAAPUNEET}

    # 2. Ajetaan varsinainen laskurobotti
    ${loytyneet_laskut}=    Kasittele Laskut Kansiosta    ${SAAPUNEET}    ${ARKISTO}    hakusana=Lasku

    # 3. Varmistetaan ja lokitetaan lopputulos
    Log    Arkistoon tallennettiin seuraavat tiedostot: ${loytyneet_laskut}
    Length Should Be    ${loytyneet_laskut}    2
    File Should Exist    ${ARKISTO}/sahkolasku_11_2026.pdf
    File Should Exist    ${ARKISTO}/lasku_98765.pdf