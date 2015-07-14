pollutantmean <- function (directory, pollutant, id = 1:332){
  
  #take directory and set it as working directory
  setwd("C:/Users/saintlyson/Documents/R Assignments/rprog-data-specdata")
  cur_dir = getwd()
  setwd (paste(cur_dir, directory, sep = "/"))
  
  #get all files in WD and then select files needed
  AllFiles <- dir()
  SomeFiles <- AllFiles[id]
  
  
  mn <- vector ("numeric", length(id))
  x <- length(id)
  
   for (i in 1:x) 
   {
     df <- read.csv(SomeFiles[i])
     mn[i] <- colMeans (df[pollutant], na.rm =  TRUE)
   }
   print(length(mn))
   print(mn)
  setwd("C:/Users/saintlyson/Documents/R Assignments/rprog-data-specdata")
  mean(mn, na.rm = TRUE)
}