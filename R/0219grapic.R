var1<-c(3,4,5,6,7)
plot(var1)
var1<-c(3,3,4,4)
plot(var1)
x<-c(3,3,3)
y<-c(2,3,4)
plot(x,y)
x<-c(10,20,30,40,50,60,70,80,90)
y<-c(10,9,8,7,6,5,4,3,2)
plot(x,y)
x<-c(2,4,6,8)
y<-c(16,17,19,18)
plot(x,y,xlab='asd',ylab ='xcv')

par(mgp=c(2,1,0))
par(mgp=c(4,2,0))
par(mgp=c(4,2,1))
plot(x,y,xlab='asd',ylab ='xcv')

par(oma=c(0,4,0,0))
plot(x,y,xlab='asd',ylab ='xcv')
x<-matrix(c(5,4,3,2),2,2)
barplot(x,beside = T,names=c(5,3),col=c('green','yellow'))
x
barplot(x,names=c(5,3),col=c('green','yellow'),ylim=c(0,12))
x
par(oma=c(1,0.5,1,0.5))
barplot(x,names=c(5,3),beside = T,col=c('green','yellow'),horiz=T)