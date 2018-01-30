t, a, b, c, d = 0, 0, 0, 0, 0

t = int(input("교환할 돈은 얼마 ? "))

a = t // 500
t %= 500
b = t // 100
t %= 100
c = t // 50
t %= 50
d = t // 10
t %= 10
print("오백원짜리 ==> %d" % a)

print("백원짜리 ==> %d" % b)

print("오십원짜리 ==> %d" % c)

print("십원짜리 ==> %d" % d)
