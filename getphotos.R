#### load R packages ####
# devtools::install_github("remi-daigle/flickRgeotag")
library(flickRgeotag)

api_key <- ''

#### set search parameters ####
bbox <- '3,57,31,72'

#### download photo metadata ####
sub_bbox_Norway <- splitbbox(api_key, bbox)
writeLines(sub_bbox_Norway,"sub_bbox_Norway")
sub_bbox_Norway <- readLines("sub_bbox_Norway")
photos <- flickr.meta.dl(api_key, sub_bbox_Norway)
