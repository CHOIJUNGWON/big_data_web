h,i=0,0

for i in range(1,101):
    if i%2==1:
        continue
    h+=i

print("합은 %d"%h)
