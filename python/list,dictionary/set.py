product = {'비누', '칫솔', '샴푸', '치약', '로션'}
sale = {'비누', '칫솔', '치약', '로션'}
costomer = {'칫솔', '치약', '로션'}

bad = product - sale - costomer
good = sale | costomer
print("good=%s" % good)
b = '로션' in bad
print("로션 판매중지해당여부 %s" % b)