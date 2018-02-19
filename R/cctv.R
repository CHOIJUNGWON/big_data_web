setwd("c:\\easy_r")
install.packages("ggmap")
library(ggmap)
gangbuk<-read.csv('서울특별시 강북구_CCTV_20170206.csv',header=T)
g_m<-get_map('gangbukgu',zoom=13,maptype = 'roadmap')
gang.map<-ggmap(g_m)+geom_point(data=gangbuk,aes(x=경도,y=위도),size=2,alpha=0.7,color='#980000')
gang.map
