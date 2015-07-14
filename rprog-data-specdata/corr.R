corr <- function (directory, threshold = 0)
{
  #take directory and set it as working directory
  setwd("C:/Users/saintlyson/Documents/R-Assignments/rprog-data-specdata")
  cur_dir = getwd()
  setwd (paste(cur_dir, directory, sep = "/"))
  
  #get all files in WD and then select files needed
  AllFiles <- dir()
  correlation <- numeric(length = 0L)
  corr_id = 0L
  
  for (i in 1:length(AllFiles))
  {
    df <- read.csv(AllFiles[i])
    temp <- sum(complete.cases(df))
    
    
    if (temp > threshold)
    {
      corr_id = corr_id + 1L
      #subset df into completed cases and save correlation
      df_s <- subset (df, complete.cases(df))
      correlation[corr_id] <- cor(df_s["sulfate"], df_s["nitrate"], use = "complete.obs")
    }
  }
  setwd("C:/Users/saintlyson/Documents/R-Assignments/rprog-data-specdata")
  correlation 
  
}