#Cookbook

This code book helps describe the run_analysis function created to analyze the "Human Activity Recognition Using Smartphones Dataset" and create a tidy dataset that computes the average of each variable for each activity and subject.


Dataset can be downloaded here:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The run_analysis function will process the both the data subjects and activities to create a single data set.  Next, it will get/set the activity/feature labels.  Then it will calcuate the mean and standard deviation for each activity and subject.  
Ultimately, providing a tidy set for further review.

#Required Files
train/subject_train.txt
test_subject_test.txt
train/y_train.txt
test/y_test.txt
activity_labels.txt
test/x_test.txt
train/x_train.txt
features.txt

#Variables
Subject -  The subject who performed the activity for each window sample. Its range is from 1 to 30.

Activity - Integer from 1 to 6 representing an activity e.g.,
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING




#Calculations
This function will calculate the average for each variable on activity and subject. 

