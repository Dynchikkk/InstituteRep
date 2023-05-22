a = 10000
b = -2000
c = -600
y = ((4 * (a - int(5/4 * b) + int(c/4))) * c) / (5*b)
chast = int(y)
ost = str(((4 * (a - int(5/4 * b) + int(c/4))) * c) - chast*5*b)
print("chast = ", chast, "ost = ", ost)
