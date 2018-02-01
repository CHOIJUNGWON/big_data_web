i = 1

a=int(input("숫자를 입력해주세요 :"))

while i<a+1:
    if i%3==0:
        print("짝")
    else:
        print("%d"%i)
    i+=1
