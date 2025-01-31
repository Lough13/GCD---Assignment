#Peer-graded assignment Getting and Cleaning Data by K. Loughlin

#zipfile uploaded to server home directory as "UCI HAR Dataset"

#Merge training and test sets to create one dataset
#load training data
setwd("~/UCI HAR Dataset/train")
train_data <- read.table("X_train.txt", header = FALSE, sep = "") 
train_data_subjects <- read.table("subject_train.txt", header = FALSE, sep = "")
train_data_labels <- read.table("y_train.txt", header = FALSE, sep = "")

#load test data 
setwd("~/UCI HAR Dataset/test")
test_data <- read.table("X_test.txt", header = FALSE, sep = "")
test_data_subjects <- read.table("subject_test.txt", header = FALSE, sep = "")
test_data_labels <- read.table("y_test.txt", header = FALSE, sep = "")

#add column with activity labels 
train_data <- cbind(ActivityLabel = train_data_labels$V1, train_data)
test_data <- cbind(ActivityLabel = test_data_labels$V1, test_data)

#add column with SubjectID 
train_data <- cbind(SubjectID = train_data_subjects$V1, train_data)
test_data <- cbind(SubjectID = test_data_subjects$V1, test_data)

#merge datasets 
merged_data <- merge(train_data, test_data, all = TRUE)

#Use descriptive activity names to name the activities in the data set 
#appropriately label the data set with descriptive variable names
#load features 
setwd("~/UCI HAR Dataset")
features <- read.table("features.txt", header = FALSE, sep = "") 

#change column names to features
cols <- c(features$V2)
colnames(merged_data)[3:563] <- cols

#format names to make them look nicer 
colnames(merged_data) <- gsub("[()]", "", colnames(merged_data))
colnames(merged_data) <- gsub("-", "_", colnames(merged_data))

#add label to ActivityLabel to describe the 6 levels 
levels <- c("1", "2", "3", "4", "5", "6")
labels <- c("Walking", "Walking_Upstairs", "Walking_Downstairs", "Sitting", "Standing", "Laying")
merged_data$ActivityLabel <- factor(merged_data$ActivityLabel, levels =  levels, labels = labels)

#Extract only the measurements on the mean and standard deviation for each measurement
#check which variables contain the mean
grep("mean", colnames(merged_data), value = TRUE) #46
#same for std
grep("std", colnames(merged_data), value = TRUE) #33
#So, including SampleID should create new dataset with 80 variables 

merged_data2 <- merged_data[, grep("SubjectID|ActivityLabel|mean|std", colnames(merged_data), value = TRUE)] 

#Create independent tidy data set with the average of each variable for each activity and each subject
library(dplyr)

tidy_dataset <- merged_data2 %>%
  group_by(SubjectID, ActivityLabel) %>%
  summarise(across(everything(), mean, na.rm = TRUE))

#create txt file of tidy dataset and safe in home directory  
write.table(tidy_dataset, file = "~/tidydataKL.txt", row.names = FALSE)
  
  
  