library(reshape2)

# Set working directory
setwd("/Users/apple/DataScience/GCD/CourseProject")

# Function to download and unzip the data set
downloadAndUnzipData <- function()
{
        fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        zipFile <- "./UCI HAR Dataset.zip"
        download.file(fileUrl, zipFile, method="curl")
        unzip(zipFile)
}

# Function to merge test data
mergeTestData <- function()
{
        # Read Test Data
        subjectTest = read.table("UCI HAR Dataset/test/subject_test.txt")
        xTest = read.table("UCI HAR Dataset/test/X_test.txt")
        yTest = read.table("UCI HAR Dataset/test/y_test.txt")    

        cbind(xTest,subjectTest,yTest)
}

# Function to merge train data
mergeTrainData <- function()
{       
        # Read Training Data
        subjectTrain = read.table("UCI HAR Dataset/train/subject_train.txt")
        xTrain = read.table("UCI HAR Dataset/train/X_train.txt")
        yTrain = read.table("UCI HAR Dataset/train/y_train.txt")
        
        cbind(xTrain,subjectTrain,yTrain)
}

# Fucntion to merge test and train data
mergeTestTrainData <- function()
{
        rbind(mergeTestData(), mergeTrainData())
}

# Function to extract the mean and standard deviation
# and add the column names
extractMeanAndStd <-  function(dataset)
{
        features = read.table("UCI HAR Dataset/features.txt", as.is = TRUE)
        colnames(features) <- c("id", "feature")
        
        # Tidy the features
        features$feature <- gsub(pattern = "-", replacement =".", features$feature, fixed = TRUE)
        features$feature <- gsub(pattern = "()", replacement ="", features$feature, fixed = TRUE)
        
        # Create vectors of mean and std features to filter later
        meanFeatures <- grep(pattern = "mean",  features$feature, fixed = TRUE)
        stdFeatures <- grep(pattern = "std",  features$feature, fixed = TRUE)
        
        # Name the dataset columns with the tidy feature names
        colnames(dataset) <- c(features$feature, "subject", "activity")
        
        # Subset the dataset by keeping only the mean and std measurements
        dataset[,c(sort(c(meanFeatures, stdFeatures)), 562:563)]      
}

# Function to convert the activity column to factor type with the activity labels as levels
factorActivity <- function(dataset)
{
        # Read activity labels
        actLabels <- read.table("UCI HAR Dataset/activity_labels.txt") 
        colnames(actLabels) <- c("id", "activity")

        # Tidy the labels 
        actLabels$activity <- gsub(pattern = "_", replacement = "-", actLabels$activity)
        dataset$activity <- factor(dataset$activity, labels = actLabels$activity)
        dataset
}

# Function to creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject. 
meltAndDcast <- function(dataset)
{
        dataset <- melt(dataset, id = c("subject", "activity"))
        dataset <- dcast(dataset, subject + activity ~ variable, mean)
}

downloadAndUnzipData()
data <- mergeTestTrainData()
data <- extractMeanAndStd(data)
data <- factorActivity(data)
data <- meltAndDcast(data)

# Write the tidy data to a text file
write.table(data, file = "tidy_uci_har.txt", row.names = FALSE)
