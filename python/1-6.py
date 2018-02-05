def high_score():
    score = []
    index = 0
    t = 0
    for i in range(0, 6):
        score.append(int(input("%d번째 학생의 시험점수를 입력하세요 :" % (index + 1))))

        if t < score[i]:
            t = score[i]
        index += 1
    return t


print("최고 점수는 %d" % high_score())
