pencil = int(input("연필은 몇 개를 구입하시겠습니까? "))
pen = int(input("펜은 몇 개를 구입하시겠습니까? "))

price = 1000 * pencil + 2000 * pen
h = price * 0.7
print("가격은 %8.1f원입니다." % h)
