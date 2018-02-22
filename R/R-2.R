install.packages('foreign')
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
#�������غ��ϱ�
setwd('c:\\easy_r')
raw_welfare<-read.spss(file='Koweps_hpc10_2015_beta1.sav',to.data.frame=T)
#������ ���纻 �����
welfare <- raw_welfare
head(welfare)
tail(welfare)
View(welfare)
dim(welfare)
str(welfare)
summary(welfare)
#�������ٲٱ�
welfare<-rename(welfare, 
                sex = h10_g3, #����
                birth= h10_g4, #�¾ ����
                marriage= h10_g10, #ȥ�λ���
                religion= h10_g11, #����
                income= p1002_8aq1, #����
                code_job= h10_eco9, #�����ڵ�
                code_region= h10_reg7) #�����ڵ�



#2������ ���� ��������
#���������ϱ�
class(welfare$sex)
#�̻�ġȮ��
table(welfare$sex)
#�̻�ġ ����ó��
welfare$sex <- ifelse(welfare$sex == 9, NA, welfare$sex)
#����ġȮ��
table(is.na(welfare$sex))
#���� �׸� �̸� �ο�
welfare$sex<-ifelse(welfare$sex==1,"male","female")
table(is.na(welfare$sex))

#���������ϱ�
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income) + xlim(0, 1000)
#�̻�ġȮ��
summary(welfare$income)
#�׷���
qplot(welfare$income)
#��ó��
summary(welfare$income)
#�̻�ġ ���� ó��
welfare$income <- ifelse(welfare$income %in% c(0, 9999), NA, welfare$income)
#����ġȮ��
table(is.na(welfare$income))
#���� ���� ���ǥ �����
sex_income <- welfare %>%
  filter(!is.na(income)) %>%
  group_by(sex) %>%
  summarise(mean_income = mean(income))
sex_income

#�׷��� �����
ggplot(data=sex_income,aes(x=sex, y=mean_income))+geom_col()
