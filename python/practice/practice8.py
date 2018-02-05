def hello_korean():
    print('안녕하세요.')


def hello_english():
    print('hello.')


def greet(hello):
    hello()


greet(hello_korean)
greet(hello_english)
