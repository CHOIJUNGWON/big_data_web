i, k = 0, 0

for i in range(2, 10, 1):
    print("-%d단-" % i)
    for k in range(1, 10, 1):
        print("%dX%d=%2d" % (i, k, i * k))
