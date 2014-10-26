Coursera-Getting_And_Cleaning_Data
This script run_analysis.R is to be installed in the working directory and the data from the Samsung files (UCI HAR Dataset)
will be copied into a directory below the working directoty That is, if your working directory is WD, then the datasets should be in WD/HCI HAR Dataset/ or ./HCI HAR Dataset/ 

This script requires reshape2 package and I had included in the script to check and install the package if your R environment do
not have it.  The script was structured into the following sectionss:


##1. Loading the original datasets:
The activitie_labels.txt and features.txt are both loaded as they will form the names of the varaiables.
Also both the test and train datasets were individually loaded and combined (i.e xtest combined with ytest and xtrain combined 
with ytrain. 

*activity_labels.txt...> activity
*features.txt..........> features

*X_test.txt............> xtest
*y_test.txt............> ytest

*X_train.txt...........> xtrain
*y_train.txt...........> ytrain

*subject_test.txt .....> subject_test
*subject_train.txt.....> subject_train


This section bring together all the data frames created before and the names of the variables previously given are changed 
by those extracted from the file "features.txt".
It also gives easy to read names for the first three columns. The output is a dataframe "dfxy", that contain all the data, 
organized as follow:  "activity_id", "activity", "subject_id", "variable1"...."variable561"


###2. Extract only the columns with mean or std
In thissection, the use of greb to extract only those variables that contain the expressions "mean" or "std" in 
their names. The result is stored in a dataframe:  meanstd


###3 Removing unnecesary symbols in the names of the variable
In this section, the names of the variables from the data frame "dfxy" are transformed in a way to get then free 
of some characters that are not desireble, such as (), - , which may cuase programming issues in future. 

Also, the uppercases are changed into lower cases so that one need not have to remember whether a variable has a capital letter 
which affects the syntax of R.


###4.Creating a second tidy data set
Finally,  dataset is "melt"from the dataframe (meanstd) to a tempoarary dataframe in order to "cast" it to a new dataset "tidy"
accordiing to the mean of each variable for each activity and each subject_id, thus each row provided the means for a specific subject in a specific activity.

################ End of readme.MD ############################################ 
