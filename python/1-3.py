a = int(input("첫번째 변 :"))
b = int(input("두번째 변 :"))
c = int(input("가장 긴 세번째 변 :"))

if (a + b) <= c:
    print("삼각형이 아니다")
elif (a == b) and (b == c):
    print("정삼각형")
elif (a == b) or (a == c):
    print("이등변삼각형")
elif (a ** 2 + b ** 2) == c ** 2:
    print("직각삼각형")
else:
    print("삼각형")
