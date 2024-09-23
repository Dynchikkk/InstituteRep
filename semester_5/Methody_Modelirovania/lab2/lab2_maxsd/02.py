def cycle():
    y = 0
    while True:
        if y == 0:
            print("Y0/A0 (НАЧАЛО)")
            y = 1
        elif y == 1:
            print("Y1/A1")
            y = 2
        elif y == 2:
            print("Y2/A2")
            y = 3
        elif y == 3:
            print("Y3/A3")
            y = 4
        elif y == 4:
            print("Y4/A4")
            y = 5
        elif y == 5:
            print("Y5/A5")
            x1 = int(input("Input X1 (0 or 1): "))
            y = 6 if x1 == 1 else 7
        elif y == 6:
            print("Y6/A6")
            x2 = int(input("Input X2 (0 or 1): "))
            y = 8 if x2 == 1 else 9
        elif y == 7:
            print("Y7/A7")
            x3 = int(input("Input X3 (0 or 1): "))
            y = 8 if x3 == 1 else 9
        elif y == 8:
            print("Y8/A8")
            x4 = int(input("Input X4 (0 or 1): "))
            y = 10 if x4 == 1 else 11
        elif y == 9:
            print("Y9/A9")
            y = 10
        elif y == 10:
            print("Y10/A10")
            x5 = int(input("Input X5 (0 or 1): "))
            y = 11 if x5 == 1 else 12
        elif y == 11:
            print("Y11/A11")
            y = 14
        elif y == 12:
            print("Y12/A12")
            y = 13
        elif y == 13:
            print("Y13/A13")
            y = 15
        elif y == 14:
            print("Y14/A14")
            x6 = int(input("Input X6 (0 or 1): "))
            y = 16 if x6 == 1 else 17
        elif y == 15:
            print("Y15/A15")
            x7 = int(input("Input X7 (0 or 1): "))
            y = 17 if x7 == 1 else 18
        elif y == 16:
            print("Y16/A16")
            y = 15
        elif y == 17:
            print("Y17/A17")
            x8 = int(input("Input X8 (0 or 1): "))
            y = 19 if x8 == 1 else 18
        elif y == 18:
            print("Y18/A18")
            x9 = int(input("Input X9 (0 or 1): "))
            y = 20 if x9 == 0 else 21
        elif y == 19:
            print("Y19/A19")
            y = 13
        elif y == 20:
            print("Y20/A20")
            y = 21
        elif y == 21:
            print("Y21/A21")
            y = 22
        elif y == 22:
            print("Y22/A22")
            y = 12
        elif y == 13:
            print("Y13/A13")
            break
        print("-->")

if __name__ == "__main__":
    cycle()