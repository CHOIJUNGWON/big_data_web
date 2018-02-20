install.packages('foreign')
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
#데이터준비하기
setwd('c:\\easy_r')
raw_welfare<-read.spss(file='Koweps_hpc10_2015_beta1.sav',to.data.frame=T)
#데이터 복사본 만들기
welfare <- raw_welfare
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

#5연령대 및 성별 월급 평균표만들기
class(welfare$sex)
table(welfare$sex)
welfare$sex<-ifelse(welfare$sex==1,"male","female")
table(is.na(welfare$sex))
welfare$age <- 2018 - welfare$birth + 1
summary(welfare$age)
welfare<-welfare%>%mutate(ageg=ifelse(age<30,'young',
                                      ifelse(age<=59,'middle','old')))
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(ageg, sex) %>%
  summarise(mean_income = mean(income))
sex_income
#그래프만들기
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col() +
  scale_x_discrete(limits = c("young", "middle", "old"))
#성별 막대 분리
ggplot(data = sex_income, aes(x = ageg, y = mean_income, fill = sex)) +
  geom_col(position = "dodge") +
  scale_x_discrete(limits = c("young", "middle", "old"))
#나이 및 성별 월급차이 분석
#성별 연령별 월급 평균표 만들기
sex_age <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(age, sex) %>%
  summarise(mean_income = mean(income))
head(sex_age)
#그래프 만들기
ggplot(data = sex_age, aes(x = age, y = mean_income, col = sex)) + geom_line()

