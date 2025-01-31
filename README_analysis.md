# GCD---Assignment

README file - Peer-graded assignment Getting and Cleaning Data
by K. Loughlin 
date: 2024-01-31 

The Getting and Cleaning Data course project was completed for which several datasets on accelerometer and gyroscope data from 30 subjects were combined to create a tidy dataset. Data was downloaded from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

-----
## The script 
-----
"run_analysis.R" script in the Github repository provides the script for merging the train and test datasets, adding descriptive names to the variables, and finally to create a tidy dataset with the average of each variable for each activity and each subject. A more detailed explanation of the script is provided below. The script itself also includes descriptions of the steps undertaken.   

The script first downloads the necessary datafiles into several datasets. 

The analyses files used in this assignment were:
X_train.txt (training data)
y_train.txt (activity labels training data)
subject_train.txt (subjectIDs training data)
X_test.txt (test data)
y_train.txt (activity labels test data)
subject_test.txt (subjectIDs test data)
features.txt (variable names)

All train data related datasets are saved as train_data*
All test data related datasets are saved as test_data*

*prep for merging datasets*  -  Before merging the train and test dataset we need to know which observations correspond to which subject and activity as these are important variables for tidying our data later on. As such, the columns ActivityLabel and SubjectID are added to both the train and test dataset. 

*merging datasets*  -  Thereafter the train and test datasets are merged into one large dataset with numerous observations per participant and stored as a new dataset called "merged_data". Since all variables match between datasets we do not have to specify specific variables for merging.  

*descriptive variable names*  -  Columns are now still named V1, V2 etc.. Thus more descriptive variable names are ascribed to the variables, describing the type of activity measured, type of estimation and axial direction of measurement using the original features. Further, as the ActivityLabel variable contains 6 levels, these are also specified. 

*select only means and standard deviation*  -  Regarding type of estimation, we are only interested in the means and standard deviations (std) of each variable. As such, a new dataset is created only containing means and std of the variables called merged_data2. 

*tidy dataset*  -  Finally, to create the tidy dataset all observations per activity of one subject are averaged. A new dataset is created called tidy_dataset. The tidy dataset can be saved as txt file in the home directory. 


----
## Additional information
----
Additional explanation regarding the data and the variables can be found in the "codebook.md" found in the present Github repository. More elaborate information on the original datasets and how data was collected can be found in the "README.txt"" and "features_info.txt" files of the original data source. 


