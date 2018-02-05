def calc(v1, v2, op):
    result = 0
    if op == '+':
        result = v1 + v2
    elif op == '-':
        result = v1 - v2
    elif op == '*':
        result = v1 * v2
    elif op == '/':
        result = v1 / v2
    elif op == '**':
        result = v1 ** v2

    return result


# 변수 선언부분
res = 0
var1, var2, oper = 0, 0, ""

##메인코드부분
var1 = int(input("첫번째 숫자 :"))
oper = input("계산입력(+,-,*,/,**) :")
var2 = int(input("두번째 숫자 :"))

if (var2 == 0) and (oper == '/'):
    print("계산불가")
else:
    res = calc(var1, var2, oper)
    print("##계산기 : %d %s %d= %d" % (var1, oper, var2, res))
