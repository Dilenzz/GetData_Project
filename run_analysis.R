# You should create one R script called run_analysis.R that does the following. 
# 
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
 
# Step 1a: get the train and test feature sets 
train_features <- read.table("UCI HAR Dataset/train/X_train.txt")
test_features <- read.table("UCI HAR Dataset/test/X_test.txt")

# Step 1b: get feature names and subset to the mean and std. Merge data sets and attach feature names as column names.
feature.names <- read.table("UCI HAR Dataset/features.txt")
feature.desired <- grep("std|mean", feature.names$V2)
total_features.desired <- rbind(train_features[ , feature.desired], test_features[ , feature.desired])
colnames(total_features.desired) <- feature.names[feature.desired, 2]

# Step 2a: get train and test activity codes, merge them 
train_activity <- read.table("UCI HAR Dataset/train/y_train.txt")
test_activity <- read.table("UCI HAR Dataset/test/y_test.txt")
total_activity <- rbind(train_activity, test_activity)

# Step 2b: replace activity codes with descriptive actvity names
activity.labels <- read.table("UCI HAR Dataset/activity_labels.txt")
total_activity$activity <- factor(total_activity$V1, levels = activity.labels$V1, labels = activity.labels$V2)


# Step 3: get and merge the train and test subject ids
train_subjects <- read.table("UCI HAR Dataset/train/subject_train.txt")
test_subjects <- read.table("UCI HAR Dataset/test/subject_test.txt")
total_subjects <- rbind(train_subjects, test_subjects)

# Step 4: combine subjects, activities and features; assign desired names to the columns
subj_activ_feat <- cbind(total_subjects, total_activity$activity, total_features.desired)
colnames(subj_activ_feat) <- c("subject.id", "activity", colnames(total_features.desired))

# From the set produced for analysis, compute and report means of
# all measures, grouped by subject_id and by activity.
result <- aggregate(subj_activ_feat[,3:], by = list(subj_activ_feat$subject.id, subj_activ_feat$activity), FUN = mean)
colnames(result)[1:2] <- c("subject.id", "activity")
write.table(result.frame, file="mean_measures.txt", row.names = FALSE)
