a = int(input("높이를 입력하세요 :"))
i = 0
while (True):
    a = a / 2
    i = i + 1
    if a < 0.00001:
        break
print("공이 튀긴 횟수는 %d입니다" % i)
