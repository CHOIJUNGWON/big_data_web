mpg<-as.data.frame(ggplot2::mpg)
head(mpg)
library(ggplot2)
displ1<-mpg%>%filter(displ<=4)
displ2<-mpg%>%filter(displ>=5)
mean(displ1$hwy)
mean(displ2$hwy)
cty1<-mpg%>%filter(manufacturer=='audi')
cty2<-mpg%>%filter(manufacturer=='toyota')
mean(cty1$cty)
mean(cty2$cty)
hwy1<-mpg%>%filter(manufacturer=='chevrolet'|manufacturer=='ford'|manufacturer=='honda')
hwy1
mean(hwy1$hwy)


mpg<-as.data.frame(ggplot2::mpg)
head(mpg)
library(ggplot2)
a<-mpg%>%select(class, cty)
suv1<-a%>%filter(class=='suv')
compact1<-a%>%filter(class=='compact')
mean(suv1$cty)
mean(compact1$cty)


mpg<-as.data.frame(ggplot2::mpg)
mpg[c(65,124,131,153,212),'hwy']<-NA
table(is.na(mpg$hwy))
table(is.na(mpg$drv))
a<-mpg%>%filter(!is.na(hwy))%>%group_by(drv)%>%summarise(mean_hwy=mean(hwy))
a
