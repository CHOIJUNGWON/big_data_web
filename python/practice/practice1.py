def func1():
    result=100
    return result

def func2():
    print("반환값 없는 함수 실행")

#변수 선언부분
hap =0

##메인코드부분
hap= func1()
print("func1()에서 돌려준값==>%d"%hap)
func2()
