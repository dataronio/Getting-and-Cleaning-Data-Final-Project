# we import the dplyr and tidyr libraries
# make sure they are installed first
library(dplyr)
library(tidyr)

# load the train data
Y_trainDF <- read.table('./UCI HAR Dataset/train/y_train.txt',col.names = "activityID")
X_trainDF <- read.table('./UCI HAR Dataset/train/X_train.txt')
Subject_trainDF <- read.table('./UCI HAR Dataset/train/subject_train.txt',col.names = "subjectID")

# load the test data
Y_testDF <- read.table('./UCI HAR Dataset/test/y_test.txt',col.names = "activityID")
X_testDF <- read.table('./UCI HAR Dataset/test/X_test.txt')
Subject_testDF <- read.table('./UCI HAR Dataset/test/subject_test.txt',col.names = "subjectID")

# load activity.txt and features.txt
activityDF <- read.table('./UCI HAR Dataset/activity_labels.txt',col.names = c('activityID','activity'))
features <- read.table('./UCI HAR Dataset/features.txt',colClasses =c('NULL','character'),stringsAsFactors = FALSE)

# step 1 - merge the training and test sets to create one dataset
bigDF <- bind_rows(X_trainDF,X_testDF)
colnames(bigDF) <- features[[1]]

# step 2 - Extract only the measurement with mean() or Std() for each measurement
bigDF <- bigDF[,!duplicated(colnames(bigDF))]
featureDF <- select(bigDF,matches("mean\\()|std\\()"))

# step 3 - Use descriptive names for activities - I simply tolower and get rid of _
activityDF <- mutate(activityDF,activity= sub("_","",tolower(activity)))
# now do a join on the bind_rows of the y's
Y_joined <- select(left_join(bind_rows(Y_trainDF,Y_testDF),activityDF,by="activityID"),activity)
featureDF['activity'] <- Y_joined
# add in subjectid
featureDF['subjectid'] <- bind_rows(Subject_trainDF,Subject_testDF)

#step 4 - appropriately label the data set with descriptive variable names
# create a set of modification for the colnames of featureDF in a function then sapply it
# note: I keep in some abbreviations that seem easy to understand

names(featureDF) <- sapply(names(featureDF),function(z) {
    sub("Acc","acceleration",sub("Mag","magnitude",sub("\\(\\)","",sub("^f","frequencyDomain",sub("^t","timeDomain",z)))))
})

# step 5 - create our tidy dataset.  I choose to make a long narrow one however the option is open
# to output a wide format but moving comments around.
# I believe the long narrow format is easier to filter rows 
widetidy <- featureDF %>%
  group_by(subjectid,activity) %>%
  summarise_each(funs(mean)) %>%
  arrange(subjectid,activity)

# print out wide tidy format data by uncommented below
# write.table(widetidy,"./wide-tidy.txt",row.names = FALSE)

# now gather our narrow tidy data set
tidy <- widetidy %>%
  gather(measurement, value,-subjectid,-activity, na.rm = FALSE, convert = FALSE)

# print it out
write.table(tidy,"./tidydata.txt",row.names = FALSE)

# clean up the environment
rm('Y_trainDF','Y_testDF','Y_joined','X_trainDF','X_testDF','bigDF','activityDF')
rm('features','Subject_testDF','Subject_trainDF')
rm('data1','featureDF')
