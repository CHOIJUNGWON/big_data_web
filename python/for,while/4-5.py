a=[]
for i in range(0,5):
    a.append(input("과일입력"))

    if len(a) < 6:
        continue
    else:
        print(0)
a.reverse()
print(a)

