## Clean and format AidData purpose and activity codes for data frame
## Matt DiLorenzo, 10/05/2016
library(dplyr)
setwd("~/Dropbox/AidData/tasks/sdg-method/")

## Load activity text, saved on 10-05-2016 from http://aiddata.org/dashboard
activity_file <- "activity-codes-descriptions.txt"
activity_texts <- readChar(activity_file, file.info(activity_file)$size)

## Clean and make data frame
activities <- strsplit(activity_texts, "\\n") %>%
  unlist() %>%
  strsplit(":") %>%
  unlist() %>%
  matrix(nrow = 544, ncol = 2, byrow = TRUE) %>%
  data.frame() %>%
  rename(activity_code = X1,
         description = X2)


## Load purpose code text, saved on 10-05-2016 from http://aiddata.org/dashboard
purpose_file <- "purpose-codes-descriptions.txt"
purpose_texts <- readChar(purpose_file, file.info(purpose_file)$size)

## Clean and make data frame
purposes <- strsplit(purpose_texts, "\\n") %>%
  unlist() %>%
  strsplit(":") %>%
  unlist() %>%
  matrix(nrow = 196, ncol = 2, byrow = TRUE) %>%
  data.frame() %>%
  rename(purpose_code = X1,
         description = X2)


## Write files
write.csv(activities, "activity-codes.csv")
write.csv(purposes, "purpose-codes.csv")
