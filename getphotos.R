#### load R packages ####
# devtools::install_github("remi-daigle/flickRgeotag")
library(flickRgeotag)
library(rgdal)

api_key <- '' # if you want to run this again, get your own API key from flickr

### load Jotunheimen (and neighbours) ###
parks <- readOGR("shapefiles","jotunheimen")
plot(parks)
parks$NAME

#### set search parameters ####
bbox <- paste0(as.character(bbox(parks)), collapse = ",")


#### download photo metadata ####
sub_bbox_Norway <- splitbbox(api_key, bbox)
writeLines(sub_bbox_Norway,"sub_bbox_Norway")
sub_bbox_Norway <- readLines("sub_bbox_Norway")
photos <- flickr.meta.dl(api_key, sub_bbox_Norway)

#### get user location ####
photos <- flickr.people.dl(photos)

write.csv(photos,'photos.csv')

#### exploratory plot ####
qflickr.plot(photos)
