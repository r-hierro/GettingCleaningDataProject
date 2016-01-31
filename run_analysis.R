## This script is mean for the Coursera Getting and Cleaning Data course project,
## from Johns Hopkins University.

## Date: 2016-01-30 / Author: Rafael Hierro.

## This script downloads data collected from the accelerometers from the 
## Samsung Galaxy S smartphone (UC Irvine Machine Learning Repository) and:
##  1.Merges the training and the test sets to create one data set.
##  2. Extracts only the measurements on the mean and standard deviation for 
##     each measurement.
##  3. Uses descriptive activity names to name the activities in the data set.
##  4. Appropriately labels the data set with descriptive variable names.
##  5. From the data set in step 4, creates a second, independent tidy data set 
##     with the average of each variable for each activity and each subject.


## Clear the environment and load the required R packages used in the script
## (if the packages are not installed, the scripts does it).

rm(list=ls())

if (!require("data.table")) {
        install.packages("data.table")
        require("data.table")
        }
if (!require("dplyr")) {
        install.packages("dplyr")
        require("dplyr")
        }

## Create a directory, download the dataset and unzip it.

if(!file.exists("./wearable")){dir.create("./wearable")}

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

download.file(fileUrl,destfile=".//wearable//dataset.zip")

unzip(".//wearable//dataset.zip", exdir = ".//wearable")


## Reads the test and train data files and the files with the names of the 
## features and activities.

activities <- read.table("./wearable/UCI HAR Dataset/activity_labels.txt",
                        col.names = c("index", "activity"))
variables <- read.table("./wearable/UCI HAR Dataset/features.txt",
                        col.names = c("index", "feature"))

testData <- read.table("./wearable/UCI HAR Dataset/test/X_test.txt",
                        col.names = variables$feature)
testActivity <- read.table("./wearable/UCI HAR Dataset/test/y_test.txt",
                        col.names = "activity")
testSubject <- read.table("./wearable/UCI HAR Dataset/test/subject_test.txt",
                        col.names = "subject")

trainData <- read.table("./wearable/UCI HAR Dataset/train/X_train.txt",
                        col.names = variables$feature)
trainActivity <- read.table("./wearable/UCI HAR Dataset/train/y_train.txt",
                        col.names = "activity")
trainSubject <- read.table("./wearable/UCI HAR Dataset/train/subject_train.txt", 
                        col.names = "subject")

## Merge the test and train datasets with the activites and the subjects data.

testSubjectData <- cbind(testSubject, testActivity, testData)
trainSubjectData <- cbind(trainSubject, trainActivity, trainData)

## 1.Merges the training and the test sets to create one data set.

mergeData <- rbind(testSubjectData, trainSubjectData)

##  2. Extracts only the measurements on the mean and standard deviation for 
##     each measurement (for the purpose of the project, I leave out the 
##     meanFreq() variables as this is the Weighted average of the frequency 
##     components to obtain a mean frequency.

requiredDataset <- mergeData %>% select (subject, activity, contains("mean"),
                                         contains("std"), -contains("meanFreq"))

## 3. Uses descriptive activity names to name the activities in the data set:

requiredDataset$activity <- factor(requiredDataset$activity,levels = 
                                activities$index, labels=activities$activity)

##  4. Appropriately labels the data set with descriptive variable names:
##     - remove the "."
##     - substitute the abbreviation by the name
##     - add the word "Axis" to the names of the axis (X,Y,Z)

names(requiredDataset) <- gsub("\\.", "", names(requiredDataset))
names(requiredDataset) <- gsub("^t", "time", names(requiredDataset))
names(requiredDataset) <- gsub("^f", "frequency", names(requiredDataset))
names(requiredDataset) <- gsub("\\Acc", "Accelerometer", names(requiredDataset))
names(requiredDataset) <- gsub("\\Gyro", "Gyroscope", names(requiredDataset))
names(requiredDataset) <- gsub("\\Mag", "Magnitude", names(requiredDataset))
names(requiredDataset) <- gsub("X$", "Xaxis", names(requiredDataset))
names(requiredDataset) <- gsub("Y$", "Yaxis", names(requiredDataset))
names(requiredDataset) <- gsub("Z$", "Zaxis", names(requiredDataset))

##  5. From the data set in step 4, creates a second, independent tidy data set 
##     with the average of each variable for each activity and each subject.
##     For this, I use the dplyr package

summarizeDataset <- requiredDataset %>% group_by(subject, activity) %>% 
        summarise_each(funs(mean))

## Save the tidy data set created in step 5 as a txt file in the directory where 
## the raw data is.created with write.table(), using row.name=FALSE, 

write.table(summarizeDataset, file = "./wearable/tidy_dataset.txt", 
            row.names=FALSE)
