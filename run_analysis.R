## Merges the training and the test sets to create one data set.
## Extracts only the measurements on the mean and standard deviation for each measurement. 
## Uses descriptive activity names to name the activities in the data set
## Appropriately labels the data set with descriptive variable names. 
## From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

require(plyr)

activity_labels <- read.table('UCI HAR Dataset/activity_labels.txt')
features <- read.table('UCI HAR Dataset/features.txt')
mean_and_std_features <- grepl('mean|std', features$V2)

read_data <- function(x, y, subjects) {
    X_data <- read.table(x)
    y_data <- read.table(y)
    subject_data <- read.table(subjects)
    names(X_data) <- features$V2
    X_data_sanitized <- X_data[, mean_and_std_features]

    y_data$V1 <- activity_labels$V2[y_data$V1]

    cbind("Subject"=subject_data$V1, "Activity"=y_data$V1, X_data_sanitized)
}

test_final <- read_data('UCI HAR Dataset/test/X_test.txt',
                        'UCI HAR Dataset/test/y_test.txt',
                        'UCI HAR Dataset/test/subject_test.txt')

train_final <- read_data('UCI HAR Dataset/train/X_train.txt',
                        'UCI HAR Dataset/train/y_train.txt',
                        'UCI HAR Dataset/train/subject_train.txt')

## Bind both the data
final_data <- rbind(test_final, train_final)
write.table(final_data, 'merged_data.txt', row.names = FALSE, col.names = TRUE)

## Make the second tidy dataset
tidy_data <- ddply(final_data, .(Subject, Activity), numcolwise(mean))
write.table(tidy_data, 'tidy_data.txt', row.names = FALSE, col.names = TRUE)
