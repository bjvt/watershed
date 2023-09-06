#Volume 1
#Section 3
#Video 3

#Author: Dr. Fabio Veronesi

#Load the required packages
library(raster)
library(Watersheds)
data(WatershedsData)

# plotting river Weser basin
plot(WatershedsData["ctry"][[10]], col="gray60")
plot(WatershedsData["basin"][[1]], col="gray30", add=TRUE)
title("River Weser basin, Germany")

#ls()
#str(WatershedsData)
#str(WatershedsData["basin"])
str(WatershedsData$ctry)

#Setting the working directory
setwd("/home/bvt/Dropbox/eng_career/R/wd/shed")


#Create a list with all the files in the directory
#as we saw in video 1.3
ListFiles <- list.files(path=".", pattern=".tif", full.names=FALSE)


#Turn the list of files into a list of raster objects with lapply
ListRasters <- lapply(ListFiles, raster)

#Merge all the raster objects into one.
#NOTE: This step may be time-consuming!!
DTM <- do.call("merge", ListRasters)

#Plot the DTM to take a look at the result
plot(DTM)


#For more info please refer to:
#http://r-video-tutorial.blogspot.ch/2014/04/merge-asc-grids-with-r.html
