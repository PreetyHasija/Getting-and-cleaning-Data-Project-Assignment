INTRODUCTION

The script run_analysis.Rperforms the 5 steps described in the course project's definition.

First, all the similar data is merged using the rbind() function. By similar, we address those files having the same number of columns and referring to the same entities.
Then, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.
As activity data is addressed with values 1:6, we take the activity names and IDs from activity_labels.txt and they are substituted in the dataset.
On the whole dataset, those columns with vague column names are corrected.
Finally, we generate a new dataset with all the average measures for each subject and activity type (30 subjects * 6 activities = 180 rows). The output file is called TidyData.txt, and uploaded to this repository.
Variables
xFeatureTest, yActivityTest, subjectTest, xFeatureTrain , yActivityTrain and subjectTrain contain the data from the downloaded files.
Data_XFeature, Data_YActivity and Data_Subject merge the previous datasets to further analysis.
features contains the correct names for the x_data dataset, which are applied to the column names stored in FeatureNamesSTdMean

A similar approach is taken with activity names through the activities variable.

DataMeanStd is subset on CombinedDataSet, to take only the measurements on the mean and standard deviation for each measurement. 
Finally, TidyData contains the relevant averages which will be later stored in a .txt file. 
lapply() from the dplyr package is used to apply mean() and ease the development.
