p = int(input("진수(2/8/10/16)를 선택하시오.  "))
x = (input("수를 입력하세요.  "))
y = (input("다른 수를 입력하세요.  "))

if p == 16:
    xc = int(x, 16)
    yc = int(y, 16)
if p == 10:
    xc = int(x, 10)
    yc = int(y, 10)
if p == 8:
    xc = int(x, 8)
    yc = int(y, 8)
if p == 2:
    xc = int(x, 2)
    yc = int(y, 2)

o = xc & yc

print('''
두 수의 & 연산 결과
16진수 => %s
8진수 => %s
10진수=> %s
2진수=> %s
'''
      % ((hex(o)), oct(o), o, bin(o)))

t = xc | yc

print('''
두 수의 | 연산 결과
16진수 => %s
8진수 => %s
10진수=> %s
2진수=> %s
'''
      % ((hex(t)), oct(t), t, bin(t)))

i = xc ^ yc

print('''
두 수의 ^ 연산 결과
16진수 => %s
8진수 => %s
10진수=> %s
2진수=> %s
'''
      % ((hex(i)), oct(i), i, bin(i)))