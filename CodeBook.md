## Getting and Cleaning Data : Course project Code Book

### The Dataset
The data used for the project is [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). 

### Data Set Information (The information is from the [above](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) link)
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Attribute Information (The information is from the [above](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) link)
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### Key Transformations done on the data set using run_analysis.R
1. cbind() to merge the columns of test data spread across the three files ("subject_test.txt", "X_test.txt", "y_test.txt")
2. cbind() to merge the columns of train data spread across the three files ("subject_train.txt", "X_train.txt", "y_train.txt")
3. rbind() to merge to merge the test data and train data
4. Tidy the feature names by removing unnecessary symbols such as "()" and "-"
5. Filtered the data set created in step (3) for only the mean and standard deviation measurements.
6. Converted the activity column in the data set from integers to factors with the activity labels("activity_labels.txt") 
   in the original data set as levels
7. Reshaped the data by applying melt() and dcast() functions to create a tidy data set
8. Final tidy data set created is written in to a single text file

### Tidy Data Set
The final tidy data set created as part of the project has 180 observations of 81 variables.  The data set represents the average of 
mean and standard deviation measurements for each activity and each subject. The 81 variables are as follows:

 [1] "subject"                      
 [2] "activity"                     
 [3] "tBodyAcc.mean.X"              
 [4] "tBodyAcc.mean.Y"              
 [5] "tBodyAcc.mean.Z"              
 [6] "tBodyAcc.std.X"               
 [7] "tBodyAcc.std.Y"               
 [8] "tBodyAcc.std.Z"               
 [9] "tGravityAcc.mean.X"           
[10] "tGravityAcc.mean.Y"           
[11] "tGravityAcc.mean.Z"           
[12] "tGravityAcc.std.X"            
[13] "tGravityAcc.std.Y"            
[14] "tGravityAcc.std.Z"            
[15] "tBodyAccJerk.mean.X"          
[16] "tBodyAccJerk.mean.Y"          
[17] "tBodyAccJerk.mean.Z"          
[18] "tBodyAccJerk.std.X"           
[19] "tBodyAccJerk.std.Y"           
[20] "tBodyAccJerk.std.Z"           
[21] "tBodyGyro.mean.X"             
[22] "tBodyGyro.mean.Y"             
[23] "tBodyGyro.mean.Z"             
[24] "tBodyGyro.std.X"              
[25] "tBodyGyro.std.Y"              
[26] "tBodyGyro.std.Z"              
[27] "tBodyGyroJerk.mean.X"         
[28] "tBodyGyroJerk.mean.Y"         
[29] "tBodyGyroJerk.mean.Z"         
[30] "tBodyGyroJerk.std.X"          
[31] "tBodyGyroJerk.std.Y"          
[32] "tBodyGyroJerk.std.Z"          
[33] "tBodyAccMag.mean"             
[34] "tBodyAccMag.std"              
[35] "tGravityAccMag.mean"          
[36] "tGravityAccMag.std"           
[37] "tBodyAccJerkMag.mean"         
[38] "tBodyAccJerkMag.std"          
[39] "tBodyGyroMag.mean"            
[40] "tBodyGyroMag.std"             
[41] "tBodyGyroJerkMag.mean"        
[42] "tBodyGyroJerkMag.std"         
[43] "fBodyAcc.mean.X"              
[44] "fBodyAcc.mean.Y"              
[45] "fBodyAcc.mean.Z"              
[46] "fBodyAcc.std.X"               
[47] "fBodyAcc.std.Y"               
[48] "fBodyAcc.std.Z"               
[49] "fBodyAcc.meanFreq.X"          
[50] "fBodyAcc.meanFreq.Y"          
[51] "fBodyAcc.meanFreq.Z"          
[52] "fBodyAccJerk.mean.X"          
[53] "fBodyAccJerk.mean.Y"          
[54] "fBodyAccJerk.mean.Z"          
[55] "fBodyAccJerk.std.X"           
[56] "fBodyAccJerk.std.Y"           
[57] "fBodyAccJerk.std.Z"           
[58] "fBodyAccJerk.meanFreq.X"      
[59] "fBodyAccJerk.meanFreq.Y"      
[60] "fBodyAccJerk.meanFreq.Z"      
[61] "fBodyGyro.mean.X"             
[62] "fBodyGyro.mean.Y"             
[63] "fBodyGyro.mean.Z"             
[64] "fBodyGyro.std.X"              
[65] "fBodyGyro.std.Y"              
[66] "fBodyGyro.std.Z"              
[67] "fBodyGyro.meanFreq.X"         
[68] "fBodyGyro.meanFreq.Y"         
[69] "fBodyGyro.meanFreq.Z"         
[70] "fBodyAccMag.mean"             
[71] "fBodyAccMag.std"              
[72] "fBodyAccMag.meanFreq"         
[73] "fBodyBodyAccJerkMag.mean"     
[74] "fBodyBodyAccJerkMag.std"      
[75] "fBodyBodyAccJerkMag.meanFreq" 
[76] "fBodyBodyGyroMag.mean"        
[77] "fBodyBodyGyroMag.std"         
[78] "fBodyBodyGyroMag.meanFreq"    
[79] "fBodyBodyGyroJerkMag.mean"    
[80] "fBodyBodyGyroJerkMag.std"     
[81] "fBodyBodyGyroJerkMag.meanFreq"

