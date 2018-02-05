a = int(input("첫번째 수 :"))
b = int(input("두번째 수 :"))
c = int(input("세번째 수 :"))

m = [a, b, c]
t = m[0]

for i in range(1, len(m)):
    if t < m[i]:
        t = m[i]
print(t)
