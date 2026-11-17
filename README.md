# Verkkokaupan testiautomaatio (Robot Framework & Python)

![Robot Framework Testit](https://github.com/Laolli735/ekat-automaatiotestit/actions/workflows/testit.yml/badge.svg)

Tämä projekti sisältää automatisoituja UI-testejä [SauceDemo](https://www.saucedemo.com/) -esimerkkiverkkokauppaan. Projekti on toteutettu osana ohjelmistotestauksen ja testiautomaation oppimista, ja testit ajetaan automaattisesti jokaisen muutoksen yhteydessä GitHub Actions -putkessa.

## Käytetyt teknologiat
* **Robot Framework** – Testitapausten ja avainsanojen määrittely
* **Browser Library (Playwright)** – Moderni selainautomaatio (Chromium)
* **Python 3.12** – Omat apufunktiot ja dynaamisen testidatan generointi
* **GitHub Actions** – Jatkuva integraatio (CI) ja automaattinen testiajo pilvessä

## Projektin rakenne
* `kirjautuminen.robot` – Kirjautumistoiminnallisuuden positiiviset ja negatiiviset testitapaukset
* `ostoskori.robot` – Tuotteen ostoskoriin lisäämisen ja poistamisen testitapaukset
* `resurssit.resource` – Yhteiset muuttujat ja uudelleenkäytettävät avainsanat
* `apufunktiot.py` – Pythonilla toteutettu apukirjasto satunnaisten salasanojen luontiin
* `.github/workflows/testit.yml` – GitHub Actions CI-työnkulun määrittely

## Testien ajaminen omalla koneella

### Esivaatimukset
* Python 3.12+
* Node.js (LTS-versio)

### Asennus ja ajo
1. Kloonaa repositorio ja siirry projektikansioon:
   ```bash
   git clone [https://github.com/Laolli735/ekat-automaatiotestit.git](https://github.com/Laolli735/ekat-automaatiotestit.git)
   cd ekat-automaatiotestit