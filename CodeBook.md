## Codebook for the Project

#Initial Data
2 data sets of 7.352 (training) and 2.947 (test) observations, each containing:
- 81 values of all monitored Features -> associated with the vector X -> Variables train_features and test_feature
- an activity code -> associated with the variable Y -> Variables train_activity and test_activity
- the subject id, who performed the activity -> Variables train_subjects and test_subjects

A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

#Processed Data
- total_features.desired (10.299 x 79) -> initial data merged and subsetted to the desired features (mean and std)
- total_activity (10.299 x 1) -> merged codes from training and test sets with the attached description
- total_subjects (10.299 x 1) -> merged subject ids from training and test sets
- subj_activ_feat (10.299 x 81) -> data for resulting computations, combination of features, activities and subjects in single data frame
- result (180 x 81) -> resulted data frame with the computed means of all measures, grouped by subject_id and by activity (30 subjects in 5 different activities produce 180 observations) 

 
