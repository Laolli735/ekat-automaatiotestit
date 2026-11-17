import random
import string

def luo_vaara_salasana(pituus=10):
    """Luo satunnaisen merkkijonon vääräksi salasanaksi."""
    merkit = string.ascii_letters + string.digits
    return ''.join(random.choice(merkit) for _ in range(int(pituus)))