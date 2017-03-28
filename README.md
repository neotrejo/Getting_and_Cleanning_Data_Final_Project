# COURSERA: Getting and Cleaning Data - Final Project

This is the final projec of the course Getting and Cleaning Data.

## For each record it is provided

* The test subject identifier. The data comes from 30 test subject.
* The name of of the activity performed to measure the data.
* The average per test subject and activity of the mean and std measurements
both in time and frequency domain. 

## The data-cleaning project includes the following files

* 'README.md'
* 'CodeBook.md': Description of the tidy data set.
* 'features_info.txt': Shows information about the variables used on the feature vector.
* 'tidy_dataset.txt': text file containing the tidy data set. 
* 'features.txt': List of all features.
* 'run_analysis.R': R code for cleaning the raw data and produce a tidy data set. 


## Data units

* Inertial Signals (Total acceleration): The acceleration signal in standard gravity 
units 'g' for X, Y, and Z axis. 
* Inertial Signals (body_acceleration): The body acceleration signal obtained by subtracting the gravity from the total acceleration, the units are 'g'. 
* Inertial Signals (body gyroscope): The angular velocity vector measured by the gyroscope. The units are radians/second. 

## Notes 

* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

## R Script description
The run_analysis.R script performs the following actions to clean the data. 

1. Create a "data" directory if it does not exists already.
2. Download the compressed dataset if it does not already exist in the working directory.
3. Extract the compressed data files. 
4. Load the activities and features data.
5. Loads both the training and test datasets and cleans up the variables names from
special caracters.
6. Creates a variable called 'objservationtype' to identify whether a row corresponds 
to a test or a training measurement.
7. For both the training and test data sets, it merges the subjectid, activityid,
activityname, and the corresponding measurements.
8. The script merges the two datasets by rows.
9. Selects the subjectid, activityname and columns of variables corresponding to 
mean and std of the measurements. 
10. Converts the subjectid and activityname columsn to factors
11. Melts the data set with id = (subjectid, activityname )
12. Creates a tidy dataset taking the average value of all 
   variables per subjectid and activityname.
13. Saves the tidy data set in the file 'tidy_dataset.txt'.
