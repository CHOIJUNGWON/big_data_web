mpg<-as.data.frame(ggplot2::mpg)
head(mpg)
library(ggplot2)
audi1<-mpg%>%filter(manufacturer=='audi')
audi1%>%arrange(hwy)%>%head(5)


mpg1<-mpg
a<-mpg1%>%mutate(plus=(cty+hwy))
a1<-a%>%mutate(plusmean=(cty+hwy)/2)
a1
a2<-a1%>%arrange(desc(plusmean))%>%head(3)
a2
b<-mpg%>%mutate(plus=(cty+hwy),plusmean=(cty+hwy)/2)%>%arrange(desc(plusmean))%>%head(3)
b

mpg%>%group_by(manufacturer, drv)%>%summarise(mean_cty = mean(cty))%>%head(10)
mpg%>%group_by(manufacturer)%>%filter(class=='suv')%>%mutate(totalmean=(cty+hwy)/2)%>%summarise(mean_totalmean = mean(totalmean))%>%arrange(desc(mean_totalmean))%>%head(10)

mpg%>%group_by(class)%>%summarise(mean_cty=mean(cty))%>%arrange(desc(mean_cty))
mpg%>%group_by(manufacturer)%>%summarise(mean_hwy=mean(hwy))%>%arrange(desc(mean_hwy))%>%head(3)
mpg%>%group_by(manufacturer)%>%filter(class=='compact')%>%summarise(n=n())%>%arrange(desc(n))


fuel<-data.frame(fl=c('c','d','e','p','r'),
                 price_fl = c(2.35, 2.38,2.11,2.76,2.22),
                 stringsAsFactors = F)
fuel
q1<-left_join(mpg,fuel,by='fl')
q1
q1%>%select(model,fl,price_fl)%>%head(5)


m1<-midwest%>%mutate(not_adult=(1-(popadults/poptotal))*100)
m2<-m1%>%select(county,not_adult)%>%arrange(desc(not_adult))%>%head(5)
m2
m2%>%mutate(size= ifelse(county>=40, 'large',ifelse(county>=30,'middle','small')),n=n())
