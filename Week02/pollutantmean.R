## Set workign directory to pull the specadata data set
setwd("~/Documents/Git/Coursera-DataScience/Week02")

pollutantmean <- function(directory, pollutant, id = 1:332) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)
  
  # set working directory
  if(grep("specdata", directory) == 1) {
    directory <- ("./specdata/")
  }
  
  # initialize a vector to hold the pollutant data
  meanVector <- c()
  
  # find all files in the specdata folder
  allFiles <- as.character( list.files(directory) )
  filePaths <- paste(directory, allFiles, sep="")
  for(i in id) {
    currentFile <- read.csv(filePaths[i], header=T, sep=",")
    head(currentFile)
    pollutant
    naRemoved <- currentFile[!is.na(currentFile[, pollutant]), pollutant]
    meanVector <- c(meanVector, naRemoved)
  }
  
  ## Get the mean of the data
  result <- mean(meanVector)
  return(round(result, 3)) 
}

# tests
pollutantmean("specdata", "sulfate", 1:10) == 4.064
pollutantmean("specdata", "nitrate", 70:72) == 1.706
pollutantmean("specdata", "nitrate", 23) == 1.281