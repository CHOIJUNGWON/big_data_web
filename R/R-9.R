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

#9지역별 연령대 비율
class(welfare$code_region)
table(welfare$code_region)
# 지역 코드 목록 만들기
list_region <- data.frame(code_region = c(1:7),
                          region = c("서울",
                                     "수도권(인천/경기)",
                                     "부산/경남/울산",
                                     "대구/경북",
                                     "대전/충남",
                                     "강원/충북",
                                     "광주/전남/전북/제주도"))
list_region
# 지역명 변수 추가 
welfare <- left_join(welfare, list_region, id = "code_region")
welfare %>%select(code_region, region) %>%head


#지역별 연령대 비율 분석하기
#표만들기
welfare$age <- 2018 - welfare$birth + 1
summary(welfare$age)
welfare<-welfare%>%mutate(ageg=ifelse(age<30,'young',
                                      ifelse(age<=59,'middle','old')))
region_ageg <- welfare %>%group_by(region, ageg) %>%summarise(n = n()) %>%mutate(tot_group = sum(n)) %>% mutate(pct = round(n/tot_group*100, 2))
head(region_ageg)
#count() 활용
region_ageg <- welfare %>%count(region, ageg) %>%group_by(region) %>% mutate(pct = round(n/sum(n)*100, 2))
#그래프
ggplot(data = region_ageg, aes(x = region, y = pct, fill = ageg)) +geom_col() +coord_flip()
#막대정렬:노년층 비율 높은순
# 노년층 비율 내림차순 정렬
list_order_old <- region_ageg %>%filter(ageg == "old") %>%arrange(pct)
list_order_old
# 지역명 순서 변수 만들기
order <- list_order_old$region
order
#그래프
ggplot(data = region_ageg, aes(x = region,  y = pct, fill = ageg)) +geom_col() +coord_flip() +scale_x_discrete(limits = order)
#연령대 순으로 막대 색깔 나열
class(region_ageg$ageg)
levels(region_ageg$ageg)
region_ageg$ageg <- factor(region_ageg$ageg, level = c("old", "middle","young"))
class(region_ageg$ageg)
levels(region_ageg$ageg)
#그래프
ggplot(data = region_ageg, aes(x = region,  y = pct, fill = ageg)) +geom_col() +coord_flip() +scale_x_discrete(limits = order)

