df<-data.frame(sex=c('M','F',NA,'M','F'),
               score = c(5,4,3,4,NA))
df
is.na(df)
table(is.na(df))
library(dplyr)
df%>%filter(is.na(score))
df_nomiss<-df%>%filter(!is.na(score)&!is.na(sex))
df_nomiss
mean(df_nomiss$score)
df_nomiss2<-na.omit(df)
df_nomiss2
mean(df$score,na.rm=T)
sum(df$score,na.rm=T)

exam<-read.csv('csv_exam.csv')
exam[c(3,8,15),'math']<-NA
exam%>%summarise(mean_math = mean(math))
exam%>%summarise(mean_math = mean(math,na.rm=T),
                 sum_math = sum(math,na.rm=T),
                 median_math = median(math,na.rm=T))
exam$math<-ifelse(is.na(exam$math),55,exam$math)
table(is.na(exam$math))

outlier<-data.frame(sex = c(1,2,1,3,2,1),
                    score= c(5,1,3,4,2,6))
table(outlier$sex)
outlier$sex<-ifelse(outlier$sex==3,NA,outlier$sex)
outlier%>%filter(!is.na(sex)&!is.na(score))%>%group_by(sex)%>%summarise(mean_score=mean(score))

mpg<-as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
mpg$hwy<-ifelse(mpg$hwy<12|mpg$hwy>37,NA,mpg$hwy)
table(is.na(mpg$hwy))
mpg%>%group_by(drv)%>%summarise(mean_hwy=mean(hwy,na.rm=T))
mpg[c(10,14,58,93),'drv']<-'k'
mpg[c(29,43,129,203),'cty']<-c(3,4,39,42)
mpg<-as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
mpg$sex<-ifelse(mpg$drv==k,NA,outlier$sex)
mpg%>%filter(!is.na(drv)&!is.na(score))%>%group_by(sex)%>%summarise(mean_score=mean(score))

