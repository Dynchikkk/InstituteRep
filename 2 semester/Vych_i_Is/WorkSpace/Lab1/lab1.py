def add_num_razr(sign, num):
    if("." in num):
        m = num.split(".")
        ln = 0
        if int(m[0]) > int(m[1]):
            ln = len(m[0])
        else:
            ln = len(m[1])
        for i in range(1, 31):
            if 2 ** i - ln >= 0:
                if sign == "+":
                    return ("0" * (2 ** i - len(m[0]))) + num + ("0" * (2 ** i - len(m[1])))
                else:
                    return ("1" * (2 ** i - len(m[0]))) + num + ("0" * (2 ** i - len(m[1])))
    else:
        for i in range(1, 31):
            if 2 ** i - len(num) >= 0:
                if sign == "+":
                    return ("0" * (2 ** i - len(num))) + num
                else:
                    return ("1" * (2 ** i - len(num))) + num
    return "Value too big or too small"


# 10 -> 2
def translate(num):
    if "." in num:
        return translate_dot(num)

    if num.lstrip("-+").isdigit() is False:
        return "Not int"

    if int(num) <= -(2 ** 30):
        return "Num too small"

    if int(num) >= 2 ** 30:
        return "Num too big"

    num_int = int(num)
    num_int_abs = abs(num_int)
    num_bin_list = list()
    while num_int_abs > 0:
        num_bin_list.append(str(num_int_abs % 2))
        num_int_abs //= 2
    num_bin_list = list(map(str, (" ".join(num_bin_list)[::-1]).split()))
    if num_int >= 0:
        return add_num_razr("+", translate_plus(num_bin_list))
    else:
        return add_num_razr("-", translate_minus(num_bin_list))


def translate_dot(num):
    st, ml = num.split(".")

    if st.lstrip("-+").isdigit() is False:
        return "Not int"

    if ml.lstrip("-+").isdigit() is False:
        return "Not int"

    if float(num) <= -(2 ** 30):
        return "Num too small"

    if float(num) >= 2 ** 30:
        return "Num too big"

    itog = list()

    st_int = int(st)
    st_int_abs = abs(st_int)
    st_int_list = list()
    while st_int_abs > 0:
        st_int_list.append(str(st_int_abs % 2))
        st_int_abs //= 2

    st_int_list = " ".join(st_int_list).split()[::-1]
    itog.append(" ".join(st_int_list))

    itog.append(".")

    ml_int = int(ml)
    ml_int_abs = float("0." + str(abs(ml_int)))
    ml_int_list = list()
    counter = 0
    checker = int(str(ml_int_abs).split(".")[1]) > 0
    while checker and counter < 20:
        checker = int(str(ml_int_abs).split(".")[1]) > 0
        ml_int_abs *= 2
        ml_int_list.append(str(ml_int_abs).split(".")[0])
        ml_int_abs = float("0." + str(ml_int_abs).split(".")[1])
        counter += 1

    itog.append(" ".join(ml_int_list))
    itog = " ".join(itog).split()

    if(st_int > 0):
        return add_num_razr("+", translate_plus(itog))
    else:
        return add_num_razr("-", translate_minus(itog))


def translate_plus(num_bin_list):
    return "".join(num_bin_list)


def translate_minus(num_bin_list):
    for i in range(len(num_bin_list)):
        if num_bin_list[i] == ".":
            continue
        num_bin_list[i] = "1" if num_bin_list[i] == "0" else "0"
    for i in range(len(num_bin_list) - 1, -1, -1):
        if num_bin_list[i] == ".":
            continue
        if num_bin_list[i] == "0":
            num_bin_list[i] = "1"
            return "".join(num_bin_list)
        else:
            num_bin_list[i] = "0"
    if num_bin_list[0] == "0":
        return "1" + "".join(num_bin_list)
    return "".join(num_bin_list)


num = input("Insert num: ")
print(translate(num))
