##변수 선언 부분
instr, outstr = "", ""
ch = ""
count, i = 0, 0

##메인코드부분
instr = input("문자열을 입력하세요 : ")
count = len(instr)

for i in range(0, count):
    ch = instr[i]
    if (ord(ch) >= ord("A") and ord(ch) <= ord("Z")):
        newch = ch.lower()
    elif (ord(ch) >= ord("a") and ord(ch) <= ord("z")):
        newch = ch.upper()
    else:
        newch = ch

    outstr += newch

print("대소문자 변환 결과 --> %s" % outstr)
#ord()=아스키코드