library(ggplot2)
library(ggmap)
setwd("c://easy_r")
ddm<-read.csv("성북 위경도.csv",header=T)

data = data.frame(
  ID = as.numeric(c(1:3)),
  latitude = as.numeric(c(37.615447, 37.584692, 37.606932)),
  longitude = as.numeric(c(127.013071, 127.026165 ,127.042072))
)

#################################################################################
# create circles data frame from the centers data frame
make_circles <- function(centers, radius, nPoints = 100){
  # centers: the data frame of centers with ID
  # radius: radius measured in kilometer
  #
  meanLat <- mean(centers$latitude)
  # length per longitude changes with lattitude, so need correction
  radiusLon <- radius /111 / cos(meanLat/57.3) 
  radiusLat <- radius / 111
  circleDF <- data.frame(ID = rep(centers$ID, each = nPoints))
  angle <- seq(0,2*pi,length.out = nPoints)
  
  circleDF$lon <- unlist(lapply(centers$longitude, function(x) x + radiusLon * cos(angle)))
  circleDF$lat <- unlist(lapply(centers$latitude, function(x) x + radiusLat * sin(angle)))
  return(circleDF)
}

# here is the data frame for all circles
myCircles <- make_circles(data, 2.35)
island = get_map(location=c(lon=127.026840, lat=37.603341), zoom = 13, maptype = "roadmap")
islandMap = ggmap(island, extent = "panel", legend = "bottomright")
ddmMap=geom_point(aes(x=LON,y=LAT),data=ddm, color="black", size = 3)
RL = geom_point(aes(x = longitude, y = latitude), data = data, color = "#ff0000", size = 4)
islandMap + RL + ddmMap +
  #scale_x_continuous(limits = c(126, 127.1), expand = c(0, 0)) + 
  #scale_y_continuous(limits = c(37, 38), expand = c(0, 0)) + 
  ########### add circles
  geom_polygon(data = myCircles, aes(lon, lat, group = ID), color = "red", alpha = 0)

