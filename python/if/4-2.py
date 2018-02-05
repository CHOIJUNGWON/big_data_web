a=int(input("이수 학기 :"))
b=int(input("이수 학점 :"))

if (8>a) and (b>=140):
    print("귀하는 조기졸업자 입니다")
elif (a==8) and (b>=140):
    print("귀하는 정상졸업자 입니다")
else :
    print("귀하는 졸업대상자가 아닙니다")
