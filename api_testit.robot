*** Settings ***
Library           RequestsLibrary
Library           Collections

*** Variables ***
${BASE_URL}       https://jsonplaceholder.typicode.com

*** Test Cases ***
Hae Kayttajan Tiedot Rajapinnasta (GET)
    [Documentation]    Hakee käyttäjän ID 1 tiedot ja tarkistaa HTTP 200 -tilakoodin sekä JSON-sisällön.
    Create Session    api_sessio    ${BASE_URL}    verify=${True}
    ${vastaus}=       GET On Session    api_sessio    /users/1

    # Tarkistetaan HTTP-vastauskoodi
    Status Should Be    200    ${vastaus}

    # Puretaan JSON-vastaus sanakirjaksi ja tarkistetaan kentät
    ${json_data}=     Set Variable    ${vastaus.json()}
    Should Be Equal As Strings    ${json_data}[username]    VaaraNimi
    Should Be Equal As Strings    ${json_data}[email]       Sincere@april.biz

Luo Uusi Tehtava Rajapintaan (POST)
    [Documentation]    Lähettää uuden JSON-tietueen rajapintaan ja varmistaa HTTP 201 Created -vastauksen.
    Create Session    api_sessio    ${BASE_URL}    verify=${True}
    ${uusi_data}=     Create Dictionary
    ...               title=Tarkista linjaston anturit
    ...               body=PLC-yhteys ja paine-anturit ok
    ...               userId=${1}

    ${vastaus}=       POST On Session    api_sessio    /posts    json=${uusi_data}

    # 201 = Created
    Status Should Be    201    ${vastaus}
    ${vastaus_json}=  Set Variable    ${vastaus.json()}
    Should Be Equal As Strings    ${vastaus_json}[title]    Tarkista linjaston anturit