fruit = {'사과': 1000, '포도': 3000, '배': 2000, '귤': 500}
f1,n1,p1=[],[],[]
while (True):
    f = input("과일의 이름 입력 :")
    if f == 'q':
        break
    f1.append(f)
    m=int(input("개수를 입력"))
    n1.append(m)

for i in range(0,len(f1)):
    if f1[i]=='포도' and n1[i]>=3:
        p1.append(n1[i]*fruit[f1[i]]*0.7)
    else:
        p1.append(n1[i]*fruit[f1[i]])
print("귀하는 ", end='')

for i in range(0,len(f1)):
    if f1[i]=='귤' and n1[i]%10==0:
        print("%s->%d : 금액 %d"%(f1[i], n1[i]+2*n1[i]//10,p1[i]),end='')
    else:
        print("%s->%d : 금액 %d" % (f1[i], n1[i], p1[i]),end='')
print(" 총금액 %d"%(sum(p1)))