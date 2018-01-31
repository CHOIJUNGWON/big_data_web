instr="<<<파<<이>>썬>>>"
outstr=""

for i in range(0, len(instr)) :
    if instr[i]!='<'and instr[i]!='>' :
        outstr+=instr[i]

print("원 문자열==>"+'['+instr+']')
print("공백제거==>"+'['+outstr+']')