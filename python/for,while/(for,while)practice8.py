k = 0

a=int(input("출력하고 싶은 단수 입력 :"))

for k in range(1, 10, 1):
        print("%dX%d=%2d" % (a, k, a * k))
