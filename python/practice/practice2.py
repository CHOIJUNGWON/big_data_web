def func(*para):
    result=0
    for num in para :
        result = result+num

    return result

# 변수 선언부분
hap=0
##메인코드부분
hap=func(10,20)
print("매개변수 2개 결과 %d"%hap)
hap=func(10,20,30)
print("매개변수 3개 결과 %d"%hap)