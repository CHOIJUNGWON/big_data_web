import random

# e=['true','false']
t = random.randint(0, 23)
w = random.choice([True, False])
print("%d 시, %s" % (t, w))
if (t >= 6 and t <= 9) and (w == True):
    print("노래")
else:
    print("노래안함")