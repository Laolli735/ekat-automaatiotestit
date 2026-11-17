# Testiautomaatio & Ohjelmistorobotiikka (Robot Framework & Python)

![Robot Framework Testit](https://github.com/Laolli735/ekat-automaatiotestit/actions/workflows/testit.yml/badge.svg)

Tämä portfolio-projekti esittelee **Robot Frameworkin** ja **Pythonin** hyödyntämistä sekä selainpohjaisessa testiautomaatiossa (UI Testing) että ohjelmistorobotiikassa (RPA). Kaikki automaatiot ajetaan automaattisesti pilvessä GitHub Actions -putken kautta jokaisen päivityksen yhteydessä.

## Käytetyt teknologiat
* **Robot Framework** – Testitapausten (`Test Cases`), RPA-tehtävien (`Tasks`) ja uudelleenkäytettävien avainsanojen määrittely
* **Browser Library (Playwright)** – Moderni selainautomaatio (Chromium)
* **Python 3.12** – Omat apukirjastot, CSV-tiedon käsittely, sähköpostien (`.eml`) jäsentäminen ja testidatan generointi
* **GitHub Actions** – Jatkuva integraatio (CI) ja automaattinen suoritus Linux-ympäristössä

## Projektin sisältö ja rakenne

### 1. UI-testiautomaatio (SauceDemo-verkkokauppa)
* `kirjautuminen.robot` – Kirjautumistoiminnallisuuden positiiviset ja negatiiviset testitapaukset
* `ostoskori.robot` – Tuotteiden ostoskoriin lisäämisen ja poistamisen testitapaukset
* `resurssit.resource` – Yhteiset muuttujat ja uudelleenkäytettävät avainsanat (DRY-periaate)
* `apufunktiot.py` – Python-apukirjasto dynaamiseen testidatan luontiin ja CSV-tiedostojen lukemiseen

### 2. Ohjelmistorobotiikka (RPA-harjoitukset)
* `massatilaus.robot` & `tilaukset.csv` – Tiedostopohjainen (Data-Driven) tilausrobotti, joka lukee tilausrivit CSV-tiedostosta ja syöttää ne verkkokaupan kassalle
* `hae_laskut.robot` & `laskurobotti.py` – Sähköpostien käsittelyrobotti, joka suodattaa saapuneista viesteistä laskut ja arkistoi niiden PDF-liitteet automaattisesti

### 3. CI/CD ja konfiguraatio
* `.github/workflows/testit.yml` – GitHub Actions -työnkulku, joka ajaa testit ja robotit headless-tilassa
* `.gitignore` – Pitää testiraportit ja robotin luomat väliaikaiset kansiot poissa versionhallinnasta

## Automaatioiden ajaminen omalla koneella

### Esivaatimukset
* Python 3.12+
* Node.js (LTS-versio)

### Asennus
1. Kloonaa repositorio ja siirry projektikansioon:
   ```bash
   git clone [https://github.com/Laolli735/ekat-automaatiotestit.git](https://github.com/Laolli735/ekat-automaatiotestit.git)
   cd ekat-automaatiotestit