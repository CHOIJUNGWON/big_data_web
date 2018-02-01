k = 9
a=int(input("원하는 단을 쓰세요 :"))

for k in range(9, 0, -1):
    print("%dX%d=%2d" % (a, k, a * k))
