import urllib.request
import urllib.parse
from bs4 import BeautifulSoup
import re
import os
import time
import random

url1 = "http://movie.naver.com/movie/bi/mi/pointWriteFormList.nhn?code="
url2 = "&type=after&isActualPointWriteExcute=false&isMileageSubscriptionAlready=false&isMileageSubscriptionReject=false&page="

hdr = {
    'User_Agent': 'Mozilla/5.0(Window NT 6.3; WOW64) AppleWebKit/537.36(KHTML, like Gecko)Chrome/46.0.2490.86Safari/537.36',
    'Host': 'movie.naver.com',
    'Connection': 'keep-alive',
    'referer': 'http://m.naver.com'
    }


def split_url():
    url = input('url을 입력하세요 :')
    code_str = re.search('code=[0-9]*', url).group()
    code = re.search('[0-9]+', code_str).group()

    return code
#url에서 'code=[0-9]*'에 해당한 문자열을 리턴.


def fetch_score_result(URL):
    print(URL)
    result = {}
    result_list = []
    #입력받았던 URL을 받아 각각 딕셔너리와 리스트로 만든다.
    res = urllib.request.Request(URL, headers=hdr)
    response = urllib.request.urlopen(res)
    html = response.read()
    #URL에서 header값이 hdr인 값을 요청해 res로 넣고 입력된url을 입력
    soup = BeautifulSoup(html, 'html.parser')

    score_result = soup.find('div', class_='score_result').find('ul')
    lis = score_result.find_all('li')
    #ul부분에서 div를 찾고 클래스를 score_result로 지정해서 li값을 lis에 입력

    
    for li in lis:
        score = li.find('div', class_='star_score').find('em').get_text()

        spectator = li.find('div', class_='score_reple').find('span').get_text()
        review = li.find('div', class_='score_reple').find('p').get_text()
        #lis리스트에서 em,span,p가 들어간 단어에서 div를 찾고 변수지정
        if spectator == '관람객':
            review = review[3:]
        #spectator가 관람객일때 3부터 지정
        result['score'] = score
        result['review'] = review

        result_list.append({
            'score': score,
            'review': review
            })
        #딕셔너리의 key와 value지정
    return result_list

def input_save_path():
    save_path = str(input("input save path :"))
    save_path = save_path.replace("\\", "/")
    if not os.path.isdir(os.path.split(save_path)[0]):
        os.mkdir(os.path.split(save_path)[0])
    return save_path
#경로를 입력하면 \\를 /로 바꾸고 0번째 리스트에서 경로가 존재하지
#않으면 생성해서 출력


def fetch_reviews():
    code = split_url()
    f = open(input_save_path(), 'w', encoding='utf-8')
    #split_url함수에서 code를 받고 지정된 경로의 파일을 연다.
    page = 1
    while True:
        count = int(input('게시물의 검색 개수를 입력하세요(10단위): '))
        if count % 10 == 0:
            break
        #게시물의 검색개수를 10개단위로 입력받아 10개단위가 되면 break
        #while문으로 무한반복을 실행하고 url1과 출력된
        #code와url2, 페이지의 문자열을 합쳐 URl로 놓고, fetch_score_result함수를 실행한다
    I_count = 1
    isLoop = True
    while isLoop:
        URL = url1 + code + url2 + str(page)
        result_list = fetch_score_result(URL)

        for r in result_list:
            f.write('==' * 40 + "\n")
            f.write('영화평점:' + r['score'] + "\n")
            f.write('리뷰내용:' + r['review'] + "\n")
            f.write('==' * 40 + "\n")
            I_count += 1
            if I_count > count:
                isLoop = False
                break
        page += 1

        if not isLoop or I_count == count:
            isLoop = False
            break
        #출력된 result_list로 for문을 시행해 지정한 경로로 입력하는데 하나씩 올라가는
        # I_count값이 입력된 게시물의 검색개수보다 많아지면 for문을 멈추고
        #isLoop또는 I_count가 검색게시물의 수와 같아지면 while문을 멈춘다

        sleepTime = random.randint(4, 10)
        time.sleep(sleepTime)
        print(str(sleepTime) + '초 기다렸습니다.')
        #Time.sleep함수를 이용해 페이지마다 파이썬 프로그램이 멈췄던 시간을 사용자에게 알려준다.
    f.close()


fetch_reviews()
