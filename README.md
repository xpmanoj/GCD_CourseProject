## Getting and Cleaning Data : Course project Script (Coursera)

### run_analysis.R

run_analysis.R does the following:

1. Downloads and unzips the file from the [dataset location](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) provided in the course site.
2. Merges the test and train data by calling the following functions:
        1. mergeTestData()
        2. mergeTrainData() 
3. Extracts the mean and standard deviation measurements from the data set by calling the extractMeanAndStd() function.
   This function also tidy the variable names by removing unnecessary symbols such as "()"" and "-"
4. Replaces the activities represented as integers in the data set with descriptive names by calling the function factorActivity()
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject through meltAndDcast()
6. Finally, it writes the tidy data created in to a text file in the user's working directory.
