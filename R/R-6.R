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

#6직업별 월급차이
#변수검토
class(welfare$code_job)
table(welfare$code_job)
#전처리

library(readxl)
list_job <- read_excel("Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)
dim(list_job)
#직업명결합
welfare <- left_join(welfare, list_job, id = "code_job")

welfare %>%
  filter(!is.na(code_job)) %>%
  select(code_job, job) %>%
  head(10)
#직업별 월급 차이 분석하기
job_income <- welfare %>%filter(!is.na(job) & !is.na(income)) %>%group_by(job) %>%summarise(mean_income = mean(income))
head(job_income)
#상위10개추출
top10 <- job_income %>%arrange(desc(mean_income)) %>%head(10)
top10
#그래프 만들기
ggplot(data = top10, aes(x = reorder(job, mean_income), y = mean_income)) + geom_col() + coord_flip()
# 하위 10위 추출
bottom10 <- job_income %>%arrange(mean_income) %>%head(10)
bottom10
#그래프 만들기
ggplot(data = bottom10, aes(x = reorder(job, -mean_income), y = mean_income)) + geom_col() + coord_flip()+ylim(0,850)

