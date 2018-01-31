hex = input("16진수 한 글자를 입력하세요.  ")

# if hex >= 0 and hex <= 9
if hex.isdigit():
    print("10진수 ==> %d" % int(hex, 16))
elif ord("a") <= ord(hex) <= ord("e") or ord("A") <= ord(hex) <= ord("E"):
    print("10진수 ==> %d" % int(hex, 16))
else:
    print("16진수가 아닙니다.")
