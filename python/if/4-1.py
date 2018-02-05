a=int(input("첫번째 수 :"))
b=int(input("두번째 수 :"))

if ((a<0) and (b>0)) or ((a>0) and (b<0)):
    print("음수")
else :
    print("양수")