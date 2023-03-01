def calc_sr_znach(name, n, znach):
    sr_znach = 0
    for i in range(n):
        sr_znach += znach[i]
    sr_znach = round(sr_znach / n, 3)
    str_znach = list(map(str, znach))
    print(f"{name}[cp] = ({' + '.join(str_znach)}) / {n} = {sr_znach}")
    return sr_znach


def calc_slych_pogr(name, n, znach, sr_znach):
    dov_ver = {1: 0,  2: 12.7, 3: 4.30, 4: 3.18,
               5: 2.77, 6: 2.57, 7: 2.45, 8: 2.36,
               9: 2.31, 10: 2.26}
    koef_std = 0
    if n <= 0:
        print(f"Δ{name}[сл] = 0")
        return 0
    elif n > 10:
        koef_std = 1.96
    elif n in dov_ver.keys():
        koef_std = dov_ver[n]

    slych_pogr = 0
    for i in range(n):
        slych_pogr += (znach[i] - sr_znach) ** 2
    slych_pogr = round(koef_std * ((slych_pogr / (n * (n - 1))) ** 0.5), 3)
    exit_str = f"Δ{name}[сл] = {koef_std} * √("
    for i in range(n):
        exit_str += f"({znach[i]} - {sr_znach}) ^ 2"
        if i + 1 < n:
            exit_str += " + "
    exit_str += f") / {n * (n - 1)} = {slych_pogr}"
    print(exit_str)
    return slych_pogr


def calc_sist_pogr(name, cd):
    sist_pogr = cd / 2
    print(f"Δ{name}[сис] = {sist_pogr}")
    return sist_pogr


def calc_absolut_pogr(name, sist_pogr, slych_pogr):
    absolut_pogr = (sist_pogr ** 2 + slych_pogr ** 2) ** 0.5
    print(f"Δ{name} = √({sist_pogr} ^ 2 + {slych_pogr} ^ 2) = {absolut_pogr}")
    return absolut_pogr


def calc_otnos_pogr(name, absolut_pogr, sr_znach):
    otnos_pogr = round(absolut_pogr / sr_znach, 3)
    print(f"δ{name} = {absolut_pogr} / {sr_znach} = {otnos_pogr}")
    return otnos_pogr


name = input("Введите название переменной: ")
znach = list(map(float, input("Введите результаты измерений через пробел: ").split()))
n = len(znach)
cd = float(input("Введите цену деления: "))
sr_znach = calc_sr_znach(name, n, znach)
slych_pogr = calc_slych_pogr(name, n, znach, sr_znach)
sist_pogr = calc_sist_pogr(name, cd)
absolut_pogr = calc_absolut_pogr(name, sist_pogr, slych_pogr)
otnos_pogr = calc_otnos_pogr(name, absolut_pogr, sr_znach)
print(f"{name} = {sr_znach} +- {round(absolut_pogr, 2)}; δ{name} = {round(otnos_pogr, 2)}")
