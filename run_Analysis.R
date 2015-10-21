# set the working directory
setwd("C:/1/Trainings Document Database/1. Repository X/Data Analytics/Coursera/3. Getting and cleaning data/Project Assignment/UCI HAR Dataset");
getwd()
library(dplyr)

# Read in the Test data from files
xFeatureTest <- read.table('./test/X_test.txt',header=FALSE,comment.char="",colClasses = "numeric");
yActivityTest <- read.table('./test/y_test.txt',header=FALSE,comment.char="",colClasses = "numeric");
subjectTest <- read.table('./test/subject_test.txt',header=FALSE,comment.char="",colClasses = "numeric");


# Read in the Train data from files
xFeatureTrain <- read.table('./train/x_train.txt',header=FALSE,comment.char="",colClasses = "numeric");
yActivityTrain <- read.table('./train/y_train.txt',header=FALSE,comment.char="",colClasses = "numeric");
subjectTrain <- read.table('./train/subject_train.txt',header=FALSE,comment.char="",colClasses = "numeric");

# concatenate the data by rows
Data_XFeature <- rbind(xFeatureTest,xFeatureTrain)
Data_YActivity <- rbind(yActivityTest,yActivityTrain)
Data_Subject <- rbind(subjectTest,subjectTrain)

# assign names to columns
colnames(Data_Subject) = "SUBJECT ID"
colnames(Data_YActivity) = "ACTIVITY ID"

#list of all features
features <- read.table('./features.txt',header=FALSE,comment.char="");
# assign names to columns
colnames(Data_XFeature) = features[,2]

# column Bind
CombinedSubject_Activity <- cbind(Data_Subject,Data_YActivity)
CombinedDataSet <- cbind(CombinedSubject_Activity, Data_XFeature)


# extract fields with mean and standard deviation only
FeatureNamesSTdMean <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
selectedNames <- c(as.character(FeatureNamesSTdMean), "SUBJECT ID", "ACTIVITY ID" )
DataMeanStd <- subset(CombinedDataSet,select=selectedNames)

# Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table('./activity_labels.txt',header=FALSE,comment.char="")
names(DataMeanStd) <- gsub("^t", "time", names(DataMeanStd))
names(DataMeanStd) <- gsub("^f", "frequency", names(DataMeanStd))
names(DataMeanStd) <- gsub("Acc", "Accelerometer", names(DataMeanStd))
names(DataMeanStd) <- gsub("Gyro", "Gyroscope", names(DataMeanStd))
names(DataMeanStd) <- gsub("Mag", "Magnitude", names(DataMeanStd))
names(DataMeanStd) <- gsub("BodyBody", "Body", names(DataMeanStd))

#  independent tidy data set with the average of each variable for each activity and each subject.
TidyData <- lapply(DataMeanStd,mean,by='SUBJECT ID, ACTIVITY ID')
write.table(TidyData, file = "Tidy.txt",row.names = FALSE)




        
