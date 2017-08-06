# This script

# First read in the training data set.
# Extract only the mean and standard deviation
# First read in the activity labels
activityLabels <- fread("UCI_HAR_Dataset/activity_labels.txt", drop = 1, col.names = c("activity"), data.table = FALSE)
# Now read in the features, drop the first column which is just numbers
features <- fread("UCI_HAR_Dataset/features.txt", drop = 1, col.names = c("features"), data.table = FALSE)

# Select only those features that contain mean() or std() measurements
featuresStdMean <- grepl(".*mean.*|*.std.*", features$features)
featuresFinal <- features[which(featuresStdMean),]
# The next three commands simplify the names and make them more readable
# by removing special characters 
featureNames <- gsub("(.*)-mean(.*)\\(\\)", "\\1\\2Mean", featuresFinal)
featureNames <- gsub("(.*)-std(.*)\\(\\)", "\\1\\2STD", featureNames)
featureNames <- gsub("-(.*)$", "\\1", featureNames)
columnNames <- c("subject", "activity", featureNames)

# Read in the Subject,Y,Z test data
testSubject <- fread("UCI_HAR_Dataset/test/subject_test.txt", data.table = FALSE)
testActivity <- fread("UCI_HAR_Dataset/test/y_test.txt", data.table = FALSE)
testMeasurments <- fread("UCI_HAR_Dataset/test/X_test.txt", data.table = FALSE)[,which(featuresStdMean)]
testData <- cbind(testSubject,testActivity,testMeasurments)
names(testData) <- columnNames

# Read in the Subject,Y,Z training data
trainSubject <- fread("UCI_HAR_Dataset/train/subject_train.txt", data.table = FALSE)
trainActivity <- fread("UCI_HAR_Dataset/train/y_train.txt", data.table = FALSE)
trainMeasurments <- fread("UCI_HAR_Dataset/train/X_train.txt", data.table = FALSE)[,which(featuresStdMean)]
trainData <- cbind(trainSubject, trainActivity, trainMeasurments)
names(trainData) <- columnNames

# Combine the two datasets
combinedData <- rbind(testData,trainData)

# Change the subject and activity to factors
combinedData$subject <- as.factor(combinedData$subject)
combinedData$activity <- as.factor(combinedData$activity)

# Rename the activity to the names in the activity Labels
# the labels are already in the correct order
levels(combinedData$activity) <- as.list(activityLabels)[[1]]

# Create a tidy dataset with with average of each variable
# for each activity and each subject. Each subject has multiple measurments
# for each activity. This final table will have one entry for each subject
# that will contain all of the unqiue combinations of subject/activity with the
# average for each of the Mean and STD measurements.
tidyTable <- aggregate(.~subject+activity, combinedData, mean)
