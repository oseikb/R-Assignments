corr <- function (directory, threshold = 0)
{
  #take directory and set it as working directory
  setwd("C:/Users/saintlyson/Documents/R Assignments/rprog-data-specdata")
  cur_dir = getwd()
  setwd (paste(cur_dir, directory, sep = "/"))
  
  #get all files in WD and then select files needed
  AllFiles <- dir()
  correlation <- numeric(length = 0L)
  print(length(AllFiles))
  
  for (i in 1:length(AllFiles))
  {
    df <- read.csv(AllFiles[i])
    temp <- sum(complete.cases(df))
    
    
    if (temp > threshold)
    {
      #subset df into completed cases and save correlation
      df_s <- subset (df, complete.cases(df))
      correlation[i] <- cor(df_s["sulfate"], df_s["nitrate"], use = "complete.obs")
    }
  }
  setwd("C:/Users/saintlyson/Documents/R Assignments/rprog-data-specdata")
  correlation #NA is showing up.. needs to be fixed but use of cor() seems to be sound
  
}
#NA only showing up. I believe this may be caused when a file either has no completes obs or didnt meet the threshold
#the counter 'i' in the for loop still incrememts so that will cause gaps.