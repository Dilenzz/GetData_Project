The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 

This project requires data collected from the accelerometers from the Samsung Galaxy S smartphone, which can be downloaded from
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A full description of the data is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

##Your steps:
- Unzip the downloaded data as 'UCI HAR Dataset' directory with its subfolders and put it into your working directory;
- Ensure that run_analysis.R is also in your working directory;
- Execute run_analysis.R script

##Steps performed during the cleaning of the oroginal data:

Step 1a: get the train and test feature sets 

Step 1b: get feature names and subset to the mean and std. Merge data sets and attach feature names as column names.

Step 2a: get train and test activity codes, merge them 

Step 2b: replace activity codes with descriptive actvity names

Step 3: get and merge the train and test subject ids

Step 4: combine subjects, activities and features; assign desired names to the columns

Step 5: from the resulted set, compute and report means of all measures, grouped by subject_id and by activity.