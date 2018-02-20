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



#2성별에 따른 월급차이
#변수검토하기
class(welfare$sex)
#이상치확인
table(welfare$sex)
#이상치 결측처리
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
#결측치확인
table(is.na(welfare$sex))
#성별 항목 이름 부여
welfare$sex<-ifelse(welfare$sex==1,"male","female")
table(is.na(welfare$sex))

#변수검토하기
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income) + xlim(0, 1000)
#이상치확인
summary(welfare$income)
#그래프
qplot(welfare$income)
#전처리
summary(welfare$income)
#이상치 결측 처리
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)
#결측치확인
table(is.na(welfare$income))
#성별 월급 평균표 만들기
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))
sex_income

#그래프 만들기
ggplot(data=sex_income,aes(x=sex, y=mean_income))+geom_col()

