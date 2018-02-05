b = {"사과": 1000, "포도": 3000, "배": 2000, "귤": 500}
u=[]
k=0
while (True):
    a=(input("과일의 이름 입력 :"))
    if a == "q":
        break
    else:
        c = int(input("구입하려는 과일의 개수 :"))
        u.append(a)
        t = b[(a)]
        k = (t * c) + k
if '포도' in a:
    print(0.9)
else:
    print(1)


