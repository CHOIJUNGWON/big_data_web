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

#4(연령대에 따른 월급차이)
#파생변수 만들기 -연령대
welfare$age <- 2018 - welfare$birth + 1
summary(welfare$age)
welfare<-welfare%>%mutate(ageg=ifelse(age<30,'young',
                                      ifelse(age<=59,'middle','old')))
table(welfare$ageg)
#연령대별 월급 평균표만들기
ageg_income<-welfare%>%filter(!is.na(income))%>%group_by(ageg)%>%summarise(mean_income=mean(income))
ageg_income
#그래프
ggplot(data=ageg_income,aes(x=ageg,y=mean_income))+geom_col()
#막대정렬:나이순
ggplot(data=ageg_income,aes(x=ageg,y=mean_income))+geom_col()+scale_x_discrete(limits = c('young','middle','old'))

