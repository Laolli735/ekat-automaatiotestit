import os
import shutil
import email
from datetime import datetime
from email.message import EmailMessage

def luo_testisahkopostit(saapuneet_kansio):
    """Luo 3 simuloitua sähköpostiviestiä (.eml) harjoittelua varten."""
    os.makedirs(saapuneet_kansio, exist_ok=True)

    viestit = [
        {
            "tiedosto": "viesti_1.eml",
            "lahettaja": "laskutus@sahkoyhtio.fi",
            "otsikko": "Lasku: Sähkönkulutus marraskuu 2026",
            "sisalto": "Hei, ohessa marraskuun sähkölasku.",
            "liite_nimi": "sahkolasku_11_2026.pdf",
            "liite_data": b"%PDF-1.4 Simuloitu sahkolaskun sisalto"
        },
        {
            "tiedosto": "viesti_2.eml",
            "lahettaja": "tarjoukset@verkkokauppa.fi",
            "otsikko": "Viikonlopun parhaat tarjoukset!",
            "sisalto": "Nyt kaikki tuotteet -20%!",
            "liite_nimi": None,
            "liite_data": None
        },
        {
            "tiedosto": "viesti_3.eml",
            "lahettaja": "myynti@it-palvelut.fi",
            "otsikko": "Lasku #98765 - Pilvipalvelut",
            "sisalto": "Kiitos tilauksesta. Lasku liitteenä.",
            "liite_nimi": "lasku_98765.pdf",
            "liite_data": b"%PDF-1.4 Simuloitu IT-laskun sisalto"
        }
    ]

    for v in viestit:
        msg = EmailMessage()
        msg["From"] = v["lahettaja"]
        msg["To"] = "lauri@esimerkki.fi"
        msg["Subject"] = v["otsikko"]
        msg.set_content(v["sisalto"])

        if v["liite_nimi"]:
            msg.add_attachment(
                v["liite_data"],
                maintype="application",
                subtype="pdf",
                filename=v["liite_nimi"]
            )

        polku = os.path.join(saapuneet_kansio, v["tiedosto"])
        with open(polku, "wb") as f:
            f.write(bytes(msg))


def kasittele_laskut_kansiosta(saapuneet_kansio, kohdekansio, kasitellyt_kansio, hakusana="Lasku"):
    """Etsii laskut, nimeää PDF-liitteet päivämäärällä ja siirtää käsitellyt viestit."""
    os.makedirs(kohdekansio, exist_ok=True)
    os.makedirs(kasitellyt_kansio, exist_ok=True)
    tallennetut = []
    paivamaara = datetime.now().strftime("%Y-%m-%d")

    for tiedostonimi in os.listdir(saapuneet_kansio):
        if not tiedostonimi.endswith(".eml"):
            continue

        polku = os.path.join(saapuneet_kansio, tiedostonimi)
        with open(polku, "rb") as f:
            viesti = email.message_from_binary_file(f)

        otsikko = viesti["Subject"] or ""
        if hakusana.lower() in otsikko.lower():
            for osa in viesti.walk():
                if osa.get_content_maintype() == "multipart":
                    continue
                if osa.get("Content-Disposition") is None:
                    continue

                liite = osa.get_filename()
                if liite and liite.lower().endswith(".pdf"):
                    uusi_nimi = f"{paivamaara}_{liite}"
                    kohdepolku = os.path.join(kohdekansio, uusi_nimi)
                    with open(kohdepolku, "wb") as pdf_tiedosto:
                        pdf_tiedosto.write(osa.get_payload(decode=True))
                    tallennetut.append(uusi_nimi)

            # Siirretään käsitelty laskuviesti pois saapuneista
            shutil.move(polku, os.path.join(kasitellyt_kansio, tiedostonimi))

    return tallennetut