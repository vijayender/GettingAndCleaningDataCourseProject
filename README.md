# Getting And Cleaning Data

## CourseProject
    
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The extracted data parameters are specified in the CodeBook.md

## How to run?
1. Clone the current repository as `GettingAndCleaningDataCourseProject`
2. Download https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and extract to `UCI HAR Dataset` directory in `GettingAndCleaningDataCourseProject`.
3. Start `R` from the `GettingAndCleaningDataCourseProject` and run `source(run_analysis.R)`
4. Examine the generated `merged_data.txt` and `tidy_data.txt`

## Dependencies
Install `plyr` before running the script
