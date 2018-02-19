library(ggplot2)
ggplot2
install.packages(ggplot2)
library(ggplot2)
ggplot2
exam%in%select(id, math)%>%head  
var1<-c(1,2,3,4,5)
plot(var1)
x<-1:3
y<-3:1
plot(x,y)
x<-1:3
y<-3:1
plot(x,y,xlim = c(1,10),ylim=c(1,5))
v1<-c(100,130,120,160,150)
plot(v1,type='o',col='red',ylim=c(0,200),
     axes=FALSE,ann=FALSE)
axis(1,at=1:5,lab=c("MON","TUE","WED","THU","FRI"))
axis(2,ylim=c(0,200))
title(main ="FRUIT",col.main='red',font.main=4)
title(xlab="DAY",col.lab="black") 
title(ylab="PRICE",col.lab="blue")
v1
par(mfrow=c(1,3))
plot(v1,type='o')
plot(v1,type='s')
plot(v1,type='l')
pie(v1)
plot(v1,type='o')
barplot(v1)
a<-c(1,2,3)
plot(a,xlab='aaa')
par(mgp=c(2,1,5))
plot(a,xlab='aaa')
par(oma=c(2,1,0,0))
plot(a,xlab='aaa')
par(mfrow=c(1,1))
v1<-c(1,2,3,4,5)
v2<-c(5,4,3,2,1)
v3<-c(3,4,5,6,7)
plot(v1,type='s',col='red',ylim=c(1,5))
par(new=T)
plot(v2,type='o',col='blue',ylim=c(1,5))
par(new=T)
plot(v3,type='l',col='green')
plot(v1,type='s',col='red',ylim=c(1,10))
lines(v2,type='o',col='blue',ylim=c(1,5))
lines(v3,type='l',col='green',ylim=c(1,15))
legend(4,9,c('v1','v2','v3'),cex=0.9,col='red','blue','green')

v1<-c(100,120,140,160,180)
v2<-c(120,130,150,140,170)
v3<-c(140,170,120,110,160)
qty<-data.frame(BANANA=v1,CHERRY=v2,ORANGE=v3)
qty
barplot(as.matrix(qty),main="fruit's Sales QTY",
        beside=T,col = rainbow(nrow(qty)),ylim=c(0,400))
legend(14,400,c("MON","TUE","WED","THU","FRI"),cex=0.8,fill=rainbow(nrow(qty)))

barplot(t(qty),main="fruit's Sales QTY",ylim=c(0,900),
        col = rainbow(nrow(qty)),space=0.1,cex.axis=0.8,las=1,names.arg=c("MON","TUE","WED","THU","FRI"),cex=0.8)
legend(0.2,800,names(qty),cex=0.7,fill=rainbow(length(qty)))
peach<-c(180,200,250,198,170)
colors<-c()
for (i in 1:length(peach)){if (peach[i]>=200)
{colors<-c(colors.'red')}
  else if (peach[i]>=180)
  {colors<-c(colors.'yellow')}  
  else
  {colors<-c(colors,'green')}
}

height<-c(182,175,167,172,163,178,181,166,159,155)
hist(height,main='histogram of height')
par(mfrow=c(1,2),oma=c(2,2,0.1,0.1))
hist<-c(1,1,2,3,3,3)
hist(hist)
plot(hist,main='Plot')
par(mfrow=c(1,1),oma=c(0.5,0.5,0.1,0.1))
p1<-c(10,20,30,40)
pie(p1,radius =1,init.angle = 90,col=rainbow(length(p1)),label=c('Week1','Week2','Week3','Week4'))
pct<-round(p1/sum(p1)*100,1)
lab<-paste(pct,'%')
pie(p1,radius = 1,init.angle = 90,col=rainbow(length(p1)),label=lab)
install.packages('plotrix')
library(plotrix)
p1<-c(10,20,30,40,50)
f_day<-round(p1/sum(p1)*100,1)
f_label<-paste(f_day,'%')
pie3D(p1,main='3DPieChart',col=rainbow(length(p1)),cex=0.5,labels=f_label,explode = 0.05)
legend(0.5,1,c("MON","TUE","WED","THU","FRI"),cex=0.6,fill=rainbow(length(p1)))
v1<-c(10,12,15,11,20)
v1<-c(5,7,15,8,9)
v1<-c(11,20,15,18,13)
       boxplot(v1,v2,v3,col=c('blue','yellow','pink'),names=c('Blue','Yellow','Pink'),horizontal = T)