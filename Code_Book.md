## Code Book

##DATA SETs
*activity_labels.txt : the codes of the activities with correspondent descriptions;
*features.txt: the names of each variable (561).

*subject_test.txt : the codes of the subjects, numbered from "1" to "24";
*subject_train.txt : the codes of the subjects, numbered from "1" to "30";

*y_test.txt: Test labels.
*X_test.txt : The values for the 561 variables, for each subject and each activity, during test;

*y_train.txt: Training labels.
*X_train.txt: The values for the 561 variables, for each subject and each activity, during train;

*tidy.txt: it is the output from the script presenting the mean of the values of all variables for each subject in each activity.
See the "readme" file for more details on how it was obtained.


## VARIABLES
The variables for the database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 
These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered 
using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, 
the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using 
another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and 
tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag,
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, 
fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

*tBodyAcc-XYZ *tGravityAcc-XYZ *tBodyAccJerk-XYZ *tBodyGyro-XYZ *tBodyGyroJerk-XYZ *tBodyAccMag *tGravityAccMag *tBodyAccJerkMag 
*tBodyGyroMag *tBodyGyroJerkMag *fBodyAcc-XYZ *fBodyAccJerk-XYZ *fBodyGyro-XYZ *fBodyAccMag *fBodyAccJerkMag *fBodyGyroMag 
*fBodyGyroJerkMag

The set of variables that were estimated from these signals are:

*mean(): Mean value *std(): Standard deviation *mad(): Median absolute deviation *max(): Largest value in array *min(): Smallest 
value in array *sma(): Signal magnitude area *energy(): Energy measure. Sum of the squares divided by the number of values. 
*iqr(): Interquartile range *entropy(): Signal entropy *arCoeff(): Autorregresion coefficients with Burg order equal to 4 
*correlation(): correlation coefficient between two signals *maxInds(): index of the frequency component with largest magnitude 
*meanFreq(): Weighted average of the frequencycomponents to obtain a mean frequency *skewness(): skewness of the frequency 
domain signal *kurtosis(): kurtosis of the frequency domain signal *bandsEnergy(): Energy of a frequency interval within the 
64 bins of the FFT of each window. *angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

*gravityMean *tBodyAccMean *tBodyAccJerkMean *tBodyGyroMean *tBodyGyroJerkMean

From the combination of those elements it was generated a list of 561 variables, where each name of the variable bring some 
information about how it was obtained.

for example:

*1 tBodyAcc-mean()-X
*2 tBodyAcc-mean()-Y
*3 tBodyAcc-mean()-Z
*4 tBodyAcc-std()-X
*5 tBodyAcc-std()-Y

The complete list of variables of each feature vector is available in 'features.txt'

For the final file "tidy.txt", the names of the variables was cleanned up, by subtracting some undesireble characters, 
"()-/", and the upercases letters was replaced by lower cases.

The file "tidy" bring the variable names as the names of the columns.

## How the file "tidy" was obtained
First, the original files, after loadeds as data frames, were aggregated in just one data frame, called "dfxy". For this, 
all the data frames about test were put together, side by side, the columns of each files becoming columns of the file.

The same was performed for the data frames corresponding to "train". So, we ended up with two data frames with the same 
numbers of columns.

Than, this data frame was 'grep' and then transformed to a new data frame, called "meanstd", only the columns of the variable
that contains either "mean" or "std" in their names. 

After theunnecessary symbols were removed and also variables were changed to small caps for ease of processing in future.

Finally, from the "meanstd" data frame, that shows for each subject in each activity, the mean of each variable. 
That was the "tidy" file. For That, the big file was aggregate by subject and activity, and for each group the mean was calculeted.

##################### End of Code Book.MD #############################
