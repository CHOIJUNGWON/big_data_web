setwd("c:\\easy_r")
exam<-read.csv("csv_exam.csv")
exam%>%select(id, math)%>%head
exam%>%select(id, math)%>%head(10)
exam%>%mutate(total = math+english+science,
              mean =(math+english+ science)/3)%>%head
exam%>%mutate(test= ifelse(science>=60, "pass","fail"))%>%head
exam%>%group_by(class)%>%summarise(mean_math=mean(math),
                                   sum_math=sum(math),
                                   median_math=median(math),
                                   n=n())
test1<- data.frame(id = c(1,2,3,4,5),
                   midterm =c(60,80,70,90,85))
test2<- data.frame(id = c(1,2,3,4,5),
                   midterm =c(70,83,65,95,80))
total<- left_join(test1, test2, by='id')
total
name<-data.frame(class=c(1,2,3,4,5),
                 teacher = c('kim','lee','park','choi','jung'))
name
group_a<-data.frame(id = c(1,2,3,4,5),test =c(60,80,70,90,85))
group_b<-data.frame(id = c(6,7,8,9,10),test =c(70,83,65,95,80))
group_all<-bind_rows(group_a,group_b)
group_all
