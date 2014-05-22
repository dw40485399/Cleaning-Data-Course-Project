 This script called run_analysis.R does the following.
 Merges the training and the test sets to create one data set.
 Extracts only the measurements on the mean and standard deviation for each measurement. 
 Uses descriptive activity names to name the activities in the data set
 Appropriately labels the data set with descriptive activity names. 
 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
 
 This project uses the data acquired from the Human Activity study by Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto
Data sets produced by this analysis include
===========================================
- 'accelerometer_mean_std.csv': Contains the mean for each measurement aggregated by activity and subject dims
- 'xy_test_train.csv': Merges data from subject files, activity files, and measurement files.

From the 561 measurements, the script extracts only the measurements for mean and standard deviation.
The resulting 86 measures are merged with the test/training subjects and the activity.  The cbind method was used to combine the subjects activity and results into one data.frame.  This method is repeated for the training data sets and then both merged datasets are joined together with the rbind utility. This analysis is written to the file named 'xy_test_train.csv'.

Using the resulting dataset from above, an aggregation (mean) is performed on each measurement ordered by activity and subject
The mean for each measurement is then written to the tidy dataset named 'acceleromter_mean_std.csv'

Data acquired[1] for the project and used in this analysis includes:
=========================================
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.
- 'train/subject_train.txt': Each row identifies the training subject who performed the activity 
- 'test/subject_test.txt': Each row identifies the test subject who performed the activity 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012