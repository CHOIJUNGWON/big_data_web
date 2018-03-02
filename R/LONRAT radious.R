install('ggplot2')
install('ggmap')
library(ggplot2)
library(ggmap)
setwd("c://easy_r")
ddm<-read.csv("addressfile.csv",header=T)
#반경의 중심점지정
data = data.frame(
  ID = as.numeric(c(1:4)),
  latitude = as.numeric(c(37.615447, 37.591193, 37.584692, 37.606932)),
  longitude = as.numeric(c(127.013071 , 127.022518 ,127.026165 ,127.042072))
)

#################################################################################
# 데이터프레임으로부터 원만들기
make_circles <- function(centers, radius, nPoints = 100){
  # centers: 중심점
  # radius: 킬로미터정단위로 반경지정
  meanLat <- mean(centers$latitude)
  # 위도당 경도 변화
  radiusLon <- radius /111 / cos(meanLat/57.3) 
  radiusLat <- radius / 111
  circleDF <- data.frame(ID = rep(centers$ID, each = nPoints))
  angle <- seq(0,2*pi,length.out = nPoints)
  
  circleDF$lon <- unlist(lapply(centers$longitude, function(x) x + radiusLon * cos(angle)))
  circleDF$lat <- unlist(lapply(centers$latitude, function(x) x + radiusLat * sin(angle)))
  return(circleDF)
}

myCircles <- make_circles(data, 1)
island = get_map(location=c(lon=127.026840, lat=37.603341), zoom = 14, maptype = "roadmap")
islandMap = ggmap(island, extent = "panel", legend = "bottomright")
ddmMap=geom_point(aes(x=LON,y=LAT),data=ddm, color="#1d427c", size = 3)
RL = geom_point(aes(x = longitude, y = latitude), data = data, color = "#ff0000", size = 4)
islandMap + RL + ddmMap +
  #x값범위(limits = c(126, 127.1), expand = c(0, 0)) + 
  #y값범위(limits = c(37, 38), expand = c(0, 0)) + 
  ########### add circles
  geom_polygon(data = myCircles, aes(lon, lat, group = ID), color = "red", alpha = 0)
