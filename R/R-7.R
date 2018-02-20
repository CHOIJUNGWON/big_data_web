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

#7성별직업빈도
library(readxl)
list_job <- read_excel("Koweps_Codebook.xlsx", col_names = T, sheet = 2)
head(list_job)
dim(list_job)

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

job_male <- welfare %>%filter(!is.na(job) & sex=='male') %>%group_by(job) %>%summarise(n=n())%>%arrange(desc(n))%>%head(10)
job_male
#여성직업 빈도 상위 10개 추출
job_female <- welfare %>%filter(!is.na(job) & sex=='female') %>%group_by(job) %>%summarise(n=n())%>%arrange(desc(n))%>%head(10)
job_female
#그래프만들기
# 남성 직업 빈도 상위 10개 직업
ggplot(data = job_male, aes(x = reorder(job, n), y = n)) +geom_col() +coord_flip()

# 여성 직업 빈도 상위 10개 직업
ggplot(data = job_female, aes(x = reorder(job, n), y = n)) +geom_col() +coord_flip()

