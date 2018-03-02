import random_num

a = random_num.randint(1, 7)
b = random_num.randint(1, 7)

print("a=%d"%a)
print("b=%d"%b)

if a > b:
    print("a가 승리")
elif a<b:
    print("b가 승리")
else:
    print("무승부")