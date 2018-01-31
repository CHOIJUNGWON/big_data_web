a = int(input("숫자를 입력해 주세요: "))

if a > 10:
    if a % 2 == 0:
        print("입력한 숫자%d는 10보다 큰 짝수입니다" % a)
    else:
        print("입력한 숫자%d는 10보다 큰 홀수입니다" % a)
else:
    if a % 2 == 0:
        print("입력한 숫자%d는 10보다 작은 짝수입니다" % a)
    else:
        print("입력한 숫자%d는 10보다 작은 홀수입니다" % a)