import os
import sys
import urllib.request
# import csv (얜 안씀)
from bs4 import BeautifulSoup

os.chdir("c:\\python36")  # 경로 변경

# csv파일 읽기
data = open("동대문통합단독다가구(매매)_실거래가_20180220124129.csv")
data.seek(0)
list1 = []
list2 = []
list3 = []

while True:
    v = data.readline().replace("\n", "")  # csv 한 줄씩 불러오되, 이중으로 줄바꿈이 되어있으므로 이를 replace를 통해 수정함.
    if v == '':
        break
    s = v.split(',')
    list1.append(v)

data.close()

del (list1[0])  # 이 부분은 제목 부분인데, 추후에 뭔가 추가할 수 있도록 이 부분을 수정해야 함.

# writer = csv.writer(csvFile) - 얘도 안씀.

client_id = "W5tvrmWw8tbNlg9CdT4V"
client_secret = "e1lEzqjAn8"

# 여기부터는 url 요청해서 주소와 위도,경도 값을 가져오도록 하는 부분.

for i in list1:
    encText = urllib.parse.quote(i)
    url = "https://openapi.naver.com/v1/map/geocode.xml?query=" + encText
    request = urllib.request.Request(url)
    request.add_header("X-Naver-Client-Id", client_id)
    request.add_header("X-Naver-Client-Secret", client_secret)
    response = urllib.request.urlopen(request)
    rescode = response.getcode()
    if (rescode == 200):
        response_body = response.read()
        bs = BeautifulSoup(response_body.decode('utf-8'), 'html.parser')
        a = bs.find('address')
        b = bs.find('x')
        c = bs.find('y')
        # print('%s, %s, %s ' %(a.string,b.string,c.string))
        list3 = [a.string, b.string, c.string]  # 내가 필요한 정보를 list3에 담음
        list2.append(list3)  # 이를 다시 list2에 append시킴.

    else:
        print("Error Code:" + rescode)

csvFile = open("LATLON.csv", "wt")

# for문 돌려서, list2 속에 list3를 반복적으로 write시킴(이때, 콤마는 join함수를 통해서 없애 준다).
for list3 in list2:
    csvFile.write(",".join(list3) + '\n')

csvFile.close()