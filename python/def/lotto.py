import random


##함수 정의 부분
def getnumber():
    return random.randrange(1, 46)


##변수 선언
lotto = []
num = 0
##메인 코드부분
print("**로또 추첨을 시작합니다.**\n")

while True:
    num = getnumber()

    if lotto.count(num) == 0:
        lotto.append(num)

    if len(lotto) >= 6:
        break

print("추첨된 로또 번호==>", end='')
lotto.sort()
for i in range(0, 6):
    print("%d  " % lotto[i], end='')
