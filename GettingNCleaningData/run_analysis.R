mergeData <- function(dataFile, subjectFile, activityFile, activityNameFile) {
  
  ## Read dataFile containing the training or testing data
  ## Read the subjectFile corresponding to the data file
  ## Read the activityFile corresponding to the data file
  ## Read the activityNameFile to get the descriptive activity names
  ## Merge all the columns in dataFile, subjectFile & activityFile & replace the activity with descriptive name
  
  data           <- read.table(dataFile)
  activity       <- read.table(activityFile)
  activityNames  <- read.table(activityNameFile)
  subject        <- read.table(subjectFile)
  names(subject) <- c("subject")
  
  activityNames <- as.character(activityNames$V2)
  activity      <- apply(activity, 1, function(a) activityNames[a])
  
  data <- cbind(data, subject, activity)
  data
}


data <- rbind(
  mergeData("./data/train/X_train.txt", "./data/train/subject_train.txt", "./data/train/y_train.txt", "./data/activity_labels.txt"),
  mergeData("./data/test/X_test.txt", "./data/test/subject_test.txt", "./data/test/y_test.txt", "./data/activity_labels.txt")
)

#Create a vector storing all the feature/column names in the merged data.
f <- read.table("./data/features.txt")
f <- as.character(f[,2])
f <- c(f, "subject", "activity")

#Alongwith the subject & activity columns only the features/columns representing the mean 
#and standard deviation of a measurement are kept & rest all are dropped
columnsToKeep <- grep("mean\\(\\)|std\\(\\)|^subject$|^activity$", f)
data          <- data[, columnsToKeep]
names(data)   <- f[columnsToKeep]

#Removing the "()","-" from the column names, so that the column names can be directly used as function args
#for grouping and then summarizing the mean for the creation of tidy data set.
names(data) <- gsub("\\(\\)", "", names(data))
names(data) <- gsub("mean", "Mean", names(data))
names(data) <- gsub("std", "Std", names(data))
names(data) <- gsub("-", "", names(data))

write.table(data, "./data/merged_data.txt")

#Creating a new independent tidy data set with the average of each variable for each activity and each subject
#and dumping it in tidy_data.txt
library(dplyr)
data <- tbl_df(data) %>% group_by("subject", "activity") %>% summarise_each(funs(mean))
write.table(data, "./data/tidy_data.txt", row.name=FALSE)