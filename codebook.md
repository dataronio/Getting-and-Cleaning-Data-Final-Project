codebook.md
=============================

Introduction:
---------------------------------------------------------------

Refer to the README.md file for details regarding the data collection and overall format of the project.  This project entailed analyzing **subjectid**, **activity** and 66 other measurement variables by taking the grouped mean of the measurement variables over all combinations of **subjectid** and **activity**.  Details regarding the data can be found in [UCI-machine-Learning-Repository Human Activity Recognition] (https://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).  Relevant research papers can be referenced at the above website for greater detail regarding the units of the measurement variables.

Variable details:
---------------------------------------------------------------

**subjectid** is an integer from 1 to 30 and represents the test volunteers in the smartphone experiment.

The **activity** variable represents six categories of human activity. They are:

1. walking
2. walkingupstairs
3. walkingdownstairs
4. sitting
5. standing
6. laying

The names above are substituted for the integers 1-6 to represent the **activity** category.

The following **measurement** variables are used in the data analysis.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

Note that variables that end in "-XYZ" are really 3 separate variables that measure the X-axis, Y-axis and the Z-axis.  There are a total of 33 variables in the above list.  A mean value (mean()) and a standard deviation (std()) were measured from the above 33 variables.  This makes a total of 66 feature variable columns that were subsetted from the train and test datasets.

For step 4 of the analysis, the following substitutions were made in the above variable names to improve understandability.

A leading t --> "timeDomain"
A leading f --> "frequencyDomain"
"Acc" --> "acceleration"
"Mag" --> "magnitude"

Finally, the **value** variable contains the grouped mean over **subjectid** and **activity**.

