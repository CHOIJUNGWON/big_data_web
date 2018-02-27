setwd('C:\\easy_r')
install.packages('foreign')
install.packages('readxl')
install.packages('dplyr')
install.packages('ggplot2')
install.packages('foreign')
install.packages('outliers')
install.packages('mapview')
library(mapview)
library(readxl)
library(foreign)
library(dplyr)
library(ggplot2)
library(outliers)
#1. Î∂ÑÏÑùÏ§ÄÎπ?
raw_welfare <- read.csv('sbg2.csv', header=T)

welfare <- raw_welfare
# boxplot ±◊∏Æ±‚
ggplot(data= welfare, aes(x= sgg, y = ym)) + geom_boxplot()
# 3/4π¯¬∞ ºˆ ªÍ√‚
well2 <- welfare %>% 
  filter(!is.na(ym)) %>% 
  group_by(sgg) %>% summarise(quantile_ym= quantile(ym,3/4))
well2
####
library(ggplot2)
library(ggmap)
data = data.frame(
  ID = as.numeric(c(1:6)),
  latitude = as.numeric(c(37.611252, 37.615447, 37.591193, 37.584692, 37.604916, 37.606932)),
  longitude = as.numeric(c(126.996516 , 127.013071 , 127.022518 ,127.026165,127.056667 ,127.042072))
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
myCircles <- make_circles(data, 0.8)
island = get_map(location=c(lon=127.026840, lat=37.603341), zoom = 14, maptype = "roadmap")
islandMap = ggmap(island, extent = "panel", legend = "bottomright")
RL = geom_point(aes(x = longitude, y = latitude), data = data, color = "#ff0000", size = 2)
islandMap + RL + 
  #scale_x_continuous(limits = c(126, 127.1), expand = c(0, 0)) + 
  #scale_y_continuous(limits = c(37, 38), expand = c(0, 0)) + 
  ########### add circles
  geom_polygon(data = myCircles, aes(lon, lat, group = ID), color = "red", alpha = 0)

