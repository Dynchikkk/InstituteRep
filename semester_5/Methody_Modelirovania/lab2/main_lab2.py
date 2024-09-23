def cycle():
    y = 0
    while True:
        if y == 0:
            print("Yн/Aн (НАЧАЛО)")
            y = 1
        elif y == 1:
            print("Y1/A1")
            y = 2 if int(input("Input X1: ")) else 3
        elif y == 2:
            print("Y2/A2")
            y = 5 if int(input("Input X2: ")) else 4
        elif y == 3:
            print("Y3/A3")
            y = 13
        elif y == 4:
            print("Y4/A4")
            y = 6 if int(input("Input X3: ")) else 7
        elif y == 5:
            print("Y5/A5")
            y = 13
        elif y == 6:
            print("Y6/A6")
            y = 12 if int(input("Input X5: ")) else 10
        elif y == 7:
            print("Y7/A7")
            y = 8 if int(input("Input X4: ")) else 9
        elif y == 8:
            print("Y8/A8")
            y = 13
        elif y == 9:
            print("Y9/A9")
            y = 10 if int(input("Input X6: ")) else 11
        elif y == 10:
            print("Y10/A10")
            y = 13
        elif y == 11:
            print("Y11/A11")
            y = 14
        elif y == 12:
            print("Y12/A12")
            y = 15
        elif y == 13:
            print("Y13/A13")
            y = 15
        elif y == 14:
            print("Y14/A14")
            y = 13
        elif y == 15:
            print("Yk/Ak (КОНЕЦ)")
            break
        print("-->")


if __name__ == "__main__":
    cycle()
