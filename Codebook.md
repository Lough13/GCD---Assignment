Codebook - Peer-graded assignment Getting and Cleaning Data
by K. Loughlin 
date: 2024-01-31 

-----
## The assignment 
-----
The assignment was to create one tidy dataset from seperate datasets on accelerometer and gyroscope data from 30 participants. Data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

-----
## Variables in tidy dataset 
-----
#Dimensions 
The tidy dataset has 180 rows and 81 columns. The rows correspond to the activities per participant (participant number and activity labels shown in column 1 and 2). The columns 3:81 desribe the average means and std for different activities measured with the accelerometer and gyroscope. 

#Class and (missing) values 
All variables are numeric except for SubjectID and ActivityLabel which are integer/factors. The values describe the average of each variable for each activity and each subject. The dataset does not include missing values.  

#Variable names 
The variable names are constructed based on 1) the activity, 2) if its the mean or std, and if applicable 3) the 3-axial direction in the X, Y and Z directions. 

The dataset contains information on SubjectID and ActivityLabel:
In total there are 30 subjects denoted as 1 to 30
ActivityLabel has 6 levels 1= "Walking", 2= "Walking_Upstairs", 3= "Walking_Downstairs", 4= "Sitting", 5 = "Standing", 6= "Laying".

The dataset contains the mean and std for the following variables: 

tBodyAcc-XYZ 
tGravityAcc-XYZ 
tBodyAccJerk-XYZ 
tBodyGyro-XYZ 
tBodyGyroJerk-XYZ 
tBodyAccMag 
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

't' indicates time and raw signals, whereas 'f' indicates frequency domain signals. Body refers to body acceleration signals and Gravity to gravity acceleration signals. Acc indicates data from accelerometer and Gyro from the gyroscope. AccJerk refers to linear acceleration jerk signals and GyroJerk to angular velocity jerk signals. Mag refers to the magnitude of the 3-axial signals. Additional information of preprocessing of these variables can be found in the features_info.txt file found in the UCI HAR Dataset folder that can be downloaded from the aforementioned downloadlink. 



