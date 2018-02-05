button = 0


def machine(button):
    print()
    print("#1.(자동으로)뜨거운 물을 준비한다.")
    print("#2.(자동으로)종이컵을 준비한다.")

    if button == 1:
        print("#3.(자동으로)아메리카노를 탄다.")
    elif button == 2:
        print("#3.(자동으로)카페라떼를 탄다.")
    elif button == 3:
        print("#3.(자동으로)카푸치노를 탄다.")
    elif button == 4:
        print("#3.(자동으로)에스프레소커피를 탄다.")
    else:
        print("#3.(자동으로)아무거나 탄다.\n")

    print("#4.(자동으로)물을붓는다.")
    print("#5.(자동으로)스푼으로 저어 녹임.")
    print()


button = int(input("철수님 어떤커피드릴까요?(1:아메리카노,2:카페라떼,3:카푸치노,4:에스프레소)"))
machine(button)
print("철수님 커피여기있습니다.")
print()

button = int(input("영희님 어떤커피드릴까요?(1:아메리카노,2:카페라떼,3:카푸치노,4:에스프레소)"))
machine(button)
print("영희님 커피여기있습니다.")
print()

button = int(input("길동님 어떤커피드릴까요?(1:아메리카노,2:카페라떼,3:카푸치노,4:에스프레소)"))
machine(button)
print("길동님 커피여기있습니다.")
print()

button = int(input("민수님 어떤커피드릴까요?(1:아메리카노,2:카페라떼,3:카푸치노,4:에스프레소)"))
machine(button)
print("민수님 커피여기있습니다.")
print()
