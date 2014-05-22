## This script called run_analysis.R does the following.
## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive activity names. 
## Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Create variables for all the Test file names to be read in
testfile <- "./UCI HAR Dataset/test/X_test.txt"
testactfile <- "./UCI HAR Dataset/test/y_test.txt"
testsubfile <- "./UCI HAR Dataset/test/subject_test.txt"

## Create variables for all the Training file names to be read in
trainfile <- "./UCI HAR Dataset/train/X_train.txt"
trainactfile <- "./UCI HAR Dataset/train/y_train.txt"
trainsubfile <- "./UCI HAR Dataset/train/subject_train.txt"

## Create variables for the activity labels and column headings to be read in
headingfile <-"./UCI HAR Dataset/features.txt"
activityfile <- "./UCI HAR Dataset/activity_labels.txt"
obs <- rep.int(16,561)

## Read in each file for the Test group and column-bind them together
## and select only the standard deviation and mean for each measurement
headings <- read.table(headingfile,sep=" ",colClasses="character")
testa <- read.table(testactfile,sep=" ",colClasses="factor")
levels(testa$V1) <- list( WALKING="1",WALKING_UPSTAIRS="2",WALKING_DOWNSTAIRS="3",SITTING="4",STANDING="5",LAYING="6")
testsub <- read.table(testsubfile,sep=" ",colClasses="character")
testab <- cbind(testsub,testa)
names(testab) <- c("subject","activity")
testab[,2] <- as.character(testab[,2])
testds <- read.fwf(testfile,obs,colClasses="numeric",col.names=headings[,2],buffersize=200)
testds <- cbind(testds[,grep("mean", colnames(testds),ignore.case=TRUE)],testds[,grep("std", colnames(testds),ignore.case=TRUE)])
testds <- cbind(testab,testds)

## Read in each file for the Training group and column-bind them together
## and select only the standard deviation and mean for each measurement
traina <- read.table(trainactfile,sep=" ",colClasses="factor")
levels(traina$V1) <- list( WALKING="1",WALKING_UPSTAIRS="2",WALKING_DOWNSTAIRS="3",SITTING="4",STANDING="5",LAYING="6")
trainsub <- read.table(trainsubfile,sep=" ",colClasses="character")
trainab <- cbind(trainsub,traina)
names(trainab) <- c("subject","activity")
trainab[,2] <- as.character(trainab[,2])
trainds <- read.fwf(trainfile,obs,colClasses="numeric",col.names=headings[,2],buffersize=200)
trainds <- cbind(trainds[,grep("mean", colnames(trainds),ignore.case=TRUE)],trainds[,grep("std", colnames(trainds),ignore.case=TRUE)])
trainds <- cbind(trainab,trainds)

## Bind the two data frames together and write it out to a file
testds <- rbind(testds,trainds)
write.table(testds,file="xy_test_train.csv",row.names=FALSE,append=FALSE,sep=",",quote=FALSE)

## Calculate the mean and standard deviation for each measurement by activity and
## subject, then write the tidy dataset out to a file
aggrdataset <- aggregate(testds[,c(3:88)],list(testds$subject,testds$activity),mean)
write.table(aggrdataset,file="accelerometer_mean_std.csv",row.names=FALSE,append=FALSE,sep=",",quote=FALSE)
