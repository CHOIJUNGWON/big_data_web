a=int(input("첫번째과목: "))
b=int(input("두번째과목: "))
c=int(input("세번째과목: "))

avg=(a+b+c)/3

if avg >=60:
    if a>40 and b>40 and c>40 :
        print("합격")
    else :
        print("과락")
else :
    print("불합격")