# Written by: Ling Kok Heng
# Script for processing Human Activity Recognition Using Smartphones Dataset 
# This script will carry out the following: 
# 1. Merge training and test sets  
# 2. Extract the measurements on the mean and standard deviation  
# 3. Appropriately label data set with descriptive activity names.  
# 4. Create a second, independent tidy data set with the mean of each variable for each activity and each subject.
###################################################################################

####loading the datasets### 

### Check for required reshape2 packages 
if (!require("reshape2")) { 
  
  install.packages("reshape2")  
  require("reshape2") 
  
} 

####loading the datasets### 
## load the activities file
activity <- read.table("./UCI HAR Dataset/activity_labels.txt") 

## load the features file, variables name
features <- read.table("./UCI HAR Dataset/features.txt", sep="") 


######## load the test datasets
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
xtest<- read.table("./UCI HAR Dataset/test/X_test.txt", sep="") 
ytest <- read.table("./UCI HAR Dataset/test/y_test.txt") 

#creating the dataframe for the test datasets 
ytest <- merge(activity,ytest,by.ytest = "v1") 
ytest <- cbind(subject_test,ytest) 
colnames(ytest) <- c("subject_id","activity_id","activity") 
names(xtest) <- features[, 2] 

#combine the x , y test datasets
xytest <- cbind(ytest,xtest) 

######## load the train datasets
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") 
xtrain <- read.table("./UCI HAR Dataset/train/X_train.txt", sep="") 
ytrain <- read.table("./UCI HAR Dataset/train/y_train.txt") 

#creating the general dataframe for the train datasets
ytrain <- merge(activity,ytrain,by.ytrain = "v1") 
ytrain <- cbind(subject_train,ytrain) 
colnames(ytrain) <- c("subject_id","activity_id","activity") 
names(xtrain) <- features[, 2] 

#combine the x , y train datasets
xytrain <- cbind(ytrain,xtrain) 

######## combine the test and train datasets
dfxy <- rbind(xytest,xytrain)  

##Keep only columns with mean() or std() values
mean_col <- grep("mean",names(dfxy),ignore.case=TRUE)
mean_col_names <- names(dfxy)[mean_col]
std_col <- grep("std",names(dfxy),ignore.case=TRUE)
std_col_names <- names(dfxy)[std_col]
meanstd <-dfxy[,c("activity_id","activity","subject_id",mean_col_names,std_col_names)]

### removing unnecessary symbols in the names of variables###
###  and also change to lower case for variable names
names(meanstd) <- gsub("[(),-]","",names(meanstd)) 
names(meanstd) <- tolower(names(meanstd)) 


##Melt the dataset with the descriptive activity names for better handling
t_tidy <- melt(meanstd, id.vars = c("activity_id","activity","subject_id")) 

##Cast the melt dataset according to  the average of each variable 
##for each activity and each subject
tidy <- dcast(t_tidy, activity_id+activity+subject_id ~ variable, fun.aggregate = mean) 

write.table(tidy, "tidy.txt", sep="\t") 

###### end of script