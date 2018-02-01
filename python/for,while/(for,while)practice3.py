h,i=0,0

for i in range(1,101):
    if i%2==0:
        continue
    h+=i

    if h>=1000:
        break

print("합이 1000을 넘는 위치 %d"%i)
