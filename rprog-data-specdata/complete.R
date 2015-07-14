complete <- function (directory, id = 1:332)
{
  #take directory and set it as working directory
  setwd("C:/Users/saintlyson/Documents/R Assignments/rprog-data-specdata")
  cur_dir = getwd()
  setwd (paste(cur_dir, directory, sep = "/"))
  
  #get all files in WD and then select files needed
  AllFiles <- dir()
  SomeFiles <- AllFiles[id]
  
  
  comp <- data.frame("id" = integer(0), "nobs" = integer(0))
  x <- length(id)
  
  for (i in 1:x) 
  {
    df <- read.csv(SomeFiles[i])
    temp <- c(df[1,4], sum(complete.cases(df)))
    comp <- rbind(comp, temp)
  }
  
  setwd("C:/Users/saintlyson/Documents/R Assignments/rprog-data-specdata")
  names(comp) <- c("id", "nobs")
  comp
}
