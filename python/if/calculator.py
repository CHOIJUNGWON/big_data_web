select, answer, numstr, num1, num2 = 0, 0, ..., 0, 0

select = int(input("1.수식계산기 2.두 수 사이 합계 :"))

if select == 1:
    numstr = input("***수식을 입력하세요 :")
    answer = eval(numstr)
    print("%s결과는 %5.1f입니다." % (numstr, answer))
elif select == 2:
    num1 = int(input("***첫번째 숫자을 입력하세요 :"))
    num2 = int(input("***두번째 숫자를 입력하세요 :"))
    for i in range(num1, num2 + 1):
        answer = answer + i
    print("%d+...+%d는 %d입니다." % (num1, num2, answer))
else:
    print("1또는 2만 입력해야합니다.")