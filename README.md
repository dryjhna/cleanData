##Introduction

This assignment uses data from  
[Dataset] (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)[59.6Mb]


##Description

One of the most exciting areas in all of data science right now is wearable computing - see for example this article. Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract  new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained from.
[Human Activity Recognition Using Smartphones] (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##How script works
As a starting point all datasets required to be present in the working directory.

###step 1:
Load all datasets
All sets of test and train datasets are compiled while loading them, thus no extra steps for combining test and train sets are required.
Note: datasets inside "Inertial Signals" are not required as they have already been summarized in 561 measurement columns

###step 2:
Remove the special characters from second column of "features.txt", this would provide us clean variables.
The variables obtained above are used as column labels for dataset x 


###step 3:
We transpose the dataset from step 2 and keep only the required rows, which have "mean" & "std" in their names

###step 4:
Transpose the datasets again to get required measurements as columns, now add subject no. from "subject" and activity no. from "Y".
Merge in activity description using activity code from "activity_labels"

###step 4:
Transpose the datasets again to get required measurements as columns, now add subject no. from "subject" and activity no. from "Y".
Merge in activity description using activity code from "activity_labels"
 
###step 5:
Summarise all the measurements at activity and subject level, using functions from dplyr
Output the final file "summarizedMeasurements.txt"
