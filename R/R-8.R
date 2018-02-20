install.packages('foreign')
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
#데이터준비하기
setwd('c:\\easy_r')
raw_welfare<-read.spss(file='Koweps_hpc10_2015_beta1.sav',to.data.frame=T)
#데이터 복사본 만들기
welfare<-raw_welfare
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)
#변수명바꾸기
welfare<-rename(welfare, 
                sex = h10_g3, #성별
                birth= h10_g4, #태어난 연도
                marriage= h10_g10, #혼인상태
                religion= h10_g11, #종교
                income= p1002_8aq1, #월급
                code_job= h10_eco9, #직종코드
                code_region= h10_reg7) #지역코드

#8종교 유무에 따른 이혼율
class(welfare$religion)
table(welfare$religion)
#종교 유무 이름 부여
welfare$religion<-ifelse(welfare$religion==1,'yes','no')
table(welfare$religion)
qplot(welfare$religion)
#혼인 상태 변수 검토 및 전처리
class(welfare$marriage)
table(welfare$marriage)
# 이혼 여부 변수 만들기
welfare$group_marriage <- ifelse(welfare$marriage == 1, "marriage",ifelse(welfare$marriage == 3, "divorce", NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
qplot(welfare$group_marriage)
#종교유무에 따른 이혼율 분석
#표만들기
religion_marriage <- welfare %>%filter(!is.na(group_marriage)) %>%group_by(religion, group_marriage) %>%summarise(n = n()) %>%mutate(tot_group = sum(n)) %>%mutate(pct = round(n/tot_group*100, 1))
religion_marriage
#count()활용
religion_marriage <- welfare %>%filter(!is.na(group_marriage)) %>%count(religion, group_marriage) %>% group_by(religion) %>% mutate(pct = round(n/sum(n)*100, 1))
# 이혼 추출
divorce <- religion_marriage %>%filter(group_marriage == "divorce") %>% select(religion, pct)
divorce
#그래프
ggplot(data = divorce, aes(x = religion, y = pct)) + geom_col()
#연령대별 이혼율 표 만들기
ageg_marriage <- welfare %>%filter(!is.na(group_marriage)) %>%group_by(ageg, group_marriage) %>%summarise(n = n()) %>%mutate(tot_group = sum(n)) %>%mutate(pct = round(n/tot_group*100, 1))
ageg_marriage
#count활용
ageg_marriage <- welfare %>%filter(!is.na(group_marriage)) %>%count(ageg, group_marriage) %>% group_by(ageg) %>% 
  mutate(pct = round(n/sum(n)*100, 1))
#연령대별 이혼율 그래프 만들기
# 초년 제외, 이혼 추출
ageg_divorce <- ageg_marriage %>% filter(ageg != "young" & group_marriage == "divorce") %>% select(ageg, pct)
ageg_divorce
# 그래프 만들기
ggplot(data = ageg_divorce, aes(x = ageg, y = pct)) + geom_col()
#연령대 및 종교 유무에 따른 이혼율 표 만들기
# 연령대, 종교유무, 결혼상태별 비율표 만들기
ageg_religion_marriage <- welfare %>%filter(!is.na(group_marriage) & ageg != "young") %>%group_by(ageg, religion, group_marriage) %>%summarise(n = n()) %>%mutate(tot_group = sum(n)) %>%mutate(pct = round(n/tot_group*100, 1))
ageg_religion_marriage
#count()활용
ageg_religion_marriage <- welfare %>%filter(!is.na(group_marriage) & ageg != "young") %>%count(ageg, religion, group_marriage) %>%group_by(ageg, religion) %>% mutate(pct = round(n/sum(n)*100, 1))
# 연령대 및 종교 유무별 이혼율 표 만들기
df_divorce <- ageg_religion_marriage %>%filter(group_marriage == "divorce") %>% select(ageg, religion, pct)
df_divorce
#그래프
ggplot(data = df_divorce, aes(x = ageg, y = pct, fill = religion )) +geom_col(position = "dodge")

