# Getting and Cleaning Data Course Project

The purpose of this project is to demonstrate my ability to collect, work with, 
and clean a data set. The goal is to prepare a tidy data that can be used for 
later analysis.


## Analysis of the data

To tidy the data as propose by the course project instructions, we create an 
R script called run_analysis.R that does the following.

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each 
measurement.
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names.
* From the data set in earlier step, creates a second, independent tidy data set 
with the average of each variable for each activity and each subject.


## Repo content

This repo contains the following files:

* Readme.md (this file), which explains the purpose of this repo.
* dataset.zip, raw data downloaded from the UC Irvine Machine Learning 
Repository
* run_analysis.R, script which executes a series of transformations over the raw 
data set, to tidy the data and get the required outcome for the course project.
* tidy_dataset.text, which contains the required data in a tidy dataset.
* CodeBook.md, which modifies and updates the available codebooks with the data 
to indicate all the variables and summaries calculated, along with units, and 
any other relevant information.


## Raw Data

The data linked to from the course website represent data collected from the 
accelerometers from the Samsung Galaxy S smartphone. A full description is 
available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data is also included in this repository: dataset.zip


## run_analysus.R scripts

The script will perform the following tasks/transformations:

* Clean the R environment
* Install and load required packages
* Create a directory, downloaded the raw data and unzip it.
* Read the raw data (from the test and train data, features and subjects).
* Merge the data with each variable from the test and training data set.
* Merge the training and test data.
* Extract the measurements for the mean and standard deviation.
* Use the adequate activity names instead of the numbers assigned to each 
activity.
* Tidy the dataset modifying the names of the variables.
* Get a tidy dataset, summarizing by subject and activiy.
* Saves the file as 'tidy_dataset.txt'.

The scripts has dependencies from the following R packages (this packages will 
be installed if not present when running the scripts):

* data.table
* dplyr

When running the R script, this will create an specific folder to store the
downloaded raw data and the tidy data set.


## CodeBook.md

The code book will provide information about:

* The variables, including units, in the data set contained in the tidy data.
* The summary choices I made to get the tidy dataset.

There is a section called "Study design" that has a description about the 
collected data, as it is explain in the course for best practice.


## Tidy Data

The tidy data set contains the data from the variables requested by the course
project instructions: the mean and standard deviation (I have not included the 
meanFreq() variable as this is "the Weighted average of the frequency components 
to obtain a mean frequency"", as specified in the descriptions of each feature),
summarize by subject and activity.

The result data set is save as a text file, called "tidy_dataset.txt".

The variables with the units which contains this dataset are described in the 
CodeBook.md file in this repo.

As best practrice, variables names:

* Are all lower case when possible
* Descriptive
* Not duplicated
* Not have underscores or dots or white spaces
* Variables with character values are made into factor variables




