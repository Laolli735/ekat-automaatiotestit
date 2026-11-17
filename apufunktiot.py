import csv
import random
import string

def luo_vaara_salasana(pituus=10):
    merkit = string.ascii_letters + string.digits
    return ''.join(random.choice(merkit) for _ in range(int(pituus)))

def lue_tilaukset_csv(tiedostopolku):
    tilaukset = []
    with open(tiedostopolku, mode='r', encoding='utf-8') as tiedosto:
        lukija = csv.DictReader(tiedosto)
        for rivi in lukija:
            tilaukset.append(dict(rivi))
    return tilaukset