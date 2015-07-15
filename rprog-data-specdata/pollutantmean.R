pollutantmean <- function (directory, pollutant, id = 1:332){
  
  #take directory and set it as working directory
  setwd("C:/Users/saintlyson/Documents/R-Assignments/rprog-data-specdata")
  cur_dir = getwd()
  setwd (paste(cur_dir, directory, sep = "/"))
  
  #get all files in WD and then select files needed
  AllFiles <- dir()
  SomeFiles <- AllFiles[id]
  
  pol_s <- data.frame()
  x <- length(id)
  
   for (i in 1:x) 
   {
     #merge all the pollutant columns in one data frame
     df <- read.csv(SomeFiles[i])
     pol_s <- rbind(pol_s, df[pollutant])
   }

  setwd("C:/Users/saintlyson/Documents/R-Assignments/rprog-data-specdata")
  mn <- colMeans (pol_s, na.rm =  TRUE)
}