

The script, run_analysis.R, reads in the following fixed width files:
====================================================================
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.

  -+-Training data files-+-
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Training subjects

  -+-Test data files-+-
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Test subjects

The script creates the following output files:
===============================================
xy_test_train.csv
accelerometer_mean_std.csv


Transformation Process
==========================
Once these files have been read into R data frames, the y_test and y_train activity values are converted to labels using the levels utility on each factor value in the data frame.  Next, the Subjects data frames are merged with their corresponding activity data frames.  The Test and Training data sets are reduced to only contain the 86 mean and std measurements using the grep and cbind utilities.  This data set is then merged with the subject and activity data set using cbind.

Using the rbind utility, both the test and train data sets are merged together.  This data set of 86 measures and two dims is then written to a file named xy_test_train.csv

The last step in the script uses the combined dataset from above to aggregate the data by getting the average of each measurement. The aggregate utility simply calculates the measurement means for each subject and activity.  This dataset is then written to 'accelerometer_mean_std.csv' is the R working directory.  