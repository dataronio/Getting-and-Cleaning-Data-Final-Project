Getting-and-Cleaning-Data-Final-Project
================================

Introduction:
----------------------------------------------------------------------

The dataset for this project comes from a Human Activity Recognition database built from
the recordings of 30 subjects performing activities of daily living while carrying a waist-mounted
smartphone (Samsung Galaxy S II) with embedded inertial sensors.   The experiments were carried out by a group of 30 volunteers, all were within 19-48 years of age.  Each person performed six activities (laying, sitting, standing, walking, walking upstairs and walking downstairs).  The smartphone contains an accelerometer and gyroscope and the dataset was created by sampling and filtering the output from these instruments.  Details can be found in [UCI-machine-Learning-Repository Human Activity Recognition] (https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

Project Details:
-----------------------------------------------------------------------

This project encompasses five tasks:

1. Merge the training and test scripts to create one dataset
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive names for the activities in the data set.
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a tidy data set with the average of each variable over each activity and subject.

Project Contents:
----------------------------------------------------------------------

* README.md
* run_analysis.R
* codebook.md
* tidydata.txt

run_analysis.R:
----------------------------------------------------------------------

To run this script you must have installed both the dplyr and tidyr libraries.  You must download the data set which can be obtained from [Coursera Cleaning Data Final Project Data] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).  Then you must unzip it into your working directory.  The script must also be in your working directory.  The script is commented and completes the five tasks above.  You have the option to output a wide version of the tidy dataset by uncommenting a line.  The default for the script is to output a long narrow tidy dataset.  This form of the dataset is more convenient for filtering rows by (**subject** X **activity** X **measurement**).  The measurement value output is the mean of the variables grouped by subjectid and activity of the measurements.

codebook.md:
-----------------------------------------------------------------------

A short description and listing of the variables that are used and/or modified by the code file run_analysis.R.

tidydata.txt
-----------------------------------------------------------------------

A space delimited tidy output file with header that is the objective of this project.  This file contains four columns [**subjectid**, **activity**, measurement variable and measurement value].

