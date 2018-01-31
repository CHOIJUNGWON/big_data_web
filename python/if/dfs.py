print("%d" % 123)
print("%5d" % 123)
print("%05d" % 123)

print("%f" % 123.45)
print("%7.1f" % 123.45)
print("%7.3f" % 123.45)

print("%s" % "python")
print("%10s" % "python")

print("{0:d} {1:5d} {2:05d}".format(123, 123, 123))
up_rate = 30
print("우와! 급여가 %s%%나 올랐네~!!" % up_rate)
a = 10000
b = 1000
msg = "고객님의 이번달 결제 금액은 %s원이고, 결제후 잔액은 %s원입니다,"
print(msg % (a, b))

a = 10
a += 5
print(a)
a -= 5
print(a)
a *= 5
print(a)
a /= 5
print(a)
a //= 5
print(a)
a %= 5
print(a)
a **= 5
print(a)
