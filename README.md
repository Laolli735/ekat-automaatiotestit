# Verkkokaupan testiautomaatio (Robot Framework & Python)

Tämä projekti sisältää automatisoituja UI-testejä [SauceDemo](https://www.saucedemo.com/) -esimerkkiverkkokauppaan. Projekti on toteutettu osana ohjelmistotestauksen ja testiautomaation oppimista.

## Käytetyt teknologiat
* **Robot Framework** – Testitapausten ja avainsanojen määrittely
* **Browser Library (Playwright)** – Moderni selainautomaatio (Chromium)
* **Python 3.12** – Omat apufunktiot ja testidatan generointi

## Projektin rakenne
* `kirjautuminen.robot` – Kirjautumistoiminnallisuuden positiiviset ja negatiiviset testitapaukset
* `apufunktiot.py` – Pythonilla toteutettu apukirjasto dynaamisen testidatan (kuten satunnaisten salasanojen) luontiin
* `.gitignore` – Pitää testiraportit (`log.html`, `report.html`) ja väliaikaistiedostot poissa versionhallinnasta

## Testien ajaminen omalla koneella

### Esivaatimukset
* Python 3.12+
* Node.js (LTS-versio)

### Asennus ja ajo
1. Kloonaa repositorio ja siirry projektikansioon:
   ```bash
   git clone [https://github.com/Laolli735/ekat-automaatiotestit.git](https://github.com/Laolli735/ekat-automaatiotestit.git)
   cd ekat-automaatiotestit