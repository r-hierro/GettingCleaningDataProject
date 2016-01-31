# Code Book

This Code Book provides information about the source (raw data), the 
transformations which have been made to the data to analyze it and the variables
found in the outcome data file.

## Source

The data set is collected from the accelerometers from the Samsung Galaxy S 
smartphone, available at UC Irvine Machine Learning Repository.

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip


## Study design

As it is explained in the repository above:

The experiments have been carried out with a group of 30 volunteers within an 
age bracket of 19-48 years. Each person performed six activities (WALKING, 
WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a 
smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer 
and gyroscope, we captured 3-axial linear acceleration and 3-axial angular 
velocity at a constant rate of 50Hz. The experiments have been video-recorded to 
label the data manually. The obtained dataset has been randomly partitioned into 
two sets, where 70% of the volunteers was selected for generating the training 
data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying 
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is 
assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain.

### Attribute Information:

For each record in the dataset it is provided: 
* Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
* Triaxial Angular velocity from the gyroscope. 
* A 561-feature vector with time and frequency domain variables. 
* Its activity label. 
* An identifier of the subject who carried out the experiment.


## Raw dataset

The dataset includes the following files which I will use (there are other files
which are not use for the purpose of this project):

* 'README.txt': which details information about the data set.
* 'features_info.txt': Shows information about the variables used on the feature 
vector.
* 'features.txt': List of all features.
* 'activity_labels.txt': Links the class labels with their activity name.
* 'train/X_train.txt': Training set.
* 'train/y_train.txt': Training labels.
* 'train/subject_train.txt': links the subject with the data collection
* 'test/X_test.txt': Test set.
* 'test/y_test.txt': Test labels.
* 'test/subject_test.txt': links the subject with the data collection.


## Transformations:

I have created an script, called run_analysis.R, which will perform the 
following tasks/transformations:

* Clean the R environment
* Install and load required packages
* Create a directory, downloaded the raw data and unzip it.
* Read the raw data (from the test and train data, features and subjects).
* Merge the data with each variable from the test and training data set.
* Merge the training and test data.
* Extract the measurements for the mean and standard deviation.
* Use the adequate activity names instead of the numbers assigned to each 
activity.
* Tidy the dataset modifying the names of the variables:
        - removing the "."
        - substitutes the abbreviation by the name (i.e. 'f' by 'frequency')
        - adding the word "Axis" to the names of the axis (X,Y,Z)

* Get a tidy dataset, summarizing by subject and activiy.
* Saves the file as 'tidy_dataset.txt'.

The scripts has dependencies from the following R packages (this packages will 
be installed if not present when running the scripts):

* data.table
* dplyr

When running the R script, this will create an specific folder to store the
downloaded raw data and the tidy data set.


## Outcome data set

The outcome data set will contain a data set data set with the average of each 
variable (mean and standard deviation) for each activity and each subject.

for the purpose of the project, I leave out the meanFreq() variables as this is 
the Weighted average of the frequency components to obtain a mean frequency.

The data set coints 180 observations (30 subjects which each performs 5 different
activities) and 75 variables, which are explained in the following section.


## Variables and units

The final data set, called summarizedDataset (if you run the R script 
'run_analysis.R'), which you can find in the file 'tidy_dataset.txt' contains
the average of the variables for each activity and subject.

The features selected for this database come from the accelerometer and gyroscope 
3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals were 
captured at a constant rate of 50 Hz. Then they were filtered using a median 
filter and a 3rd order low pass Butterworth filter with a corner frequency of 
20 Hz to remove noise. Similarly, the acceleration signal was then separated 
into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) 
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in 
time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the 
magnitude of these three-dimensional signals were calculated using the Euclidean 
norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, 
tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals 
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, 
fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain 
signals). 

These signals were used to estimate variables of the feature vector for each 
pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


The variables of this data set are:

* subject: integer - identifies the subject of the experiment (30)
* activity: identifies the activity which the subject was doing - "WALKING",
"WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".

All the following variables are the average of each subject and activity, 
expressed in seconds (so they are numerical):

* timeBodyAccelerometermeanXaxis
* timeBodyAccelerometermeanYaxis
* timeBodyAccelerometermeanZaxis
* timeGravityAccelerometermeanXaxis
* timeGravityAccelerometermeanYaxis
* timeGravityAccelerometermeanZaxis
* timeBodyAccelerometerJerkmeanXaxis
* timeBodyAccelerometerJerkmeanYaxis
* timeBodyAccelerometerJerkmeanZaxis
* timeBodyGyroscopemeanXaxis
* timeBodyGyroscopemeanYaxis
* timeBodyGyroscopemeanZaxis
* timeBodyGyroscopeJerkmeanXaxis
* timeBodyGyroscopeJerkmeanYaxis
* timeBodyGyroscopeJerkmeanZaxis
* timeBodyAccelerometerMagnitudemean
* timeGravityAccelerometerMagnitudemean
* timeBodyAccelerometerJerkMagnitudemean
* timeBodyGyroscopeMagnitudemean
* timeBodyGyroscopeJerkMagnitudemean
* frequencyBodyAccelerometermeanXaxis
* frequencyBodyAccelerometermeanYaxis
* frequencyBodyAccelerometermeanZaxis
* frequencyBodyAccelerometerJerkmeanXaxis
* frequencyBodyAccelerometerJerkmeanYaxis
* frequencyBodyAccelerometerJerkmeanZaxis
* frequencyBodyGyroscopemeanXaxis
* frequencyBodyGyroscopemeanYaxis
* frequencyBodyGyroscopemeanZaxis
* frequencyBodyAccelerometerMagnitudemean
* frequencyBodyBodyAccelerometerJerkMagnitudemean
* frequencyBodyBodyGyroscopeMagnitudemean
* frequencyBodyBodyGyroscopeJerkMagnitudemean
* angletBodyAccelerometerMeangravity
* angletBodyAccelerometerJerkMeangravityMean
* angletBodyGyroscopeMeangravityMean
* angletBodyGyroscopeJerkMeangravityMean
* angleXgravityMean
* angleYgravityMean
* angleZgravityMean
* timeBodyAccelerometerstdXaxis
* timeBodyAccelerometerstdYaxis
* timeBodyAccelerometerstdZaxis
* timeGravityAccelerometerstdXaxis
* timeGravityAccelerometerstdYaxis
* timeGravityAccelerometerstdZaxis
* timeBodyAccelerometerJerkstdXaxis
* timeBodyAccelerometerJerkstdYaxis
* timeBodyAccelerometerJerkstdZaxis
* timeBodyGyroscopestdXaxis
* timeBodyGyroscopestdYaxis
* timeBodyGyroscopestdZaxis
* timeBodyGyroscopeJerkstdXaxis
* timeBodyGyroscopeJerkstdYaxis
* timeBodyGyroscopeJerkstdZaxis
* timeBodyAccelerometerMagnitudestd
* timeGravityAccelerometerMagnitudestd
* timeBodyAccelerometerJerkMagnitudestd
* timeBodyGyroscopeMagnitudestd
* timeBodyGyroscopeJerkMagnitudestd
* frequencyBodyAccelerometerstdXaxis
* frequencyBodyAccelerometerstdYaxis
* frequencyBodyAccelerometerstdZaxis
* frequencyBodyAccelerometerJerkstdXaxis
* frequencyBodyAccelerometerJerkstdYaxis
* frequencyBodyAccelerometerJerkstdZaxis
* frequencyBodyGyroscopestdXaxis
* frequencyBodyGyroscopestdYaxis
* frequencyBodyGyroscopestdZaxis
* frequencyBodyAccelerometerMagnitudestd
* frequencyBodyBodyAccelerometerJerkMagnitudestd
* frequencyBodyBodyGyroscopeMagnitudestd
* frequencyBodyBodyGyroscopeJerkMagnitudestd


## License

As specified in the dataset:

Use of this dataset in publications must be acknowledged by referencing the 
following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. 
Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass 
Hardware-Friendly Support Vector Machine. International Workshop of Ambient 
Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can 
be addressed to the authors or their institutions for its use or misuse. Any 
commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
