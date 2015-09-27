# CodeBook
Please go through README.md for instructions on running the run_analysis.R script

In `run_analysis.R`
* `read_data(x, y, subjects)` function takes paths for three test files present either in `'test/'` or `'train/'` directories and uses the global context variables `activity_labels` and `features` to label the various columns. It merges the x y and subjects files by columns to generate a single large data.frame with feature data and the activity and subject data.

## merged_data.txt
Contains data from `'test/'` and `'train/'` merged into a single large table.
Has columns
* `Activity`: A factor representing each activity against which the data is collected `6 Levels: LAYING SITTING STANDING WALKING ... WALKING_UPSTAIRS`
* `Subject` : An integer representing each individual subject from whose phone the data has been collected
* `"tBodyAcc-mean()-X" .. "fBodyBodyGyroJerkMag-meanFreq()"` : The columns from the main data loaded consisting only of `mean` and `std` of the various collected parameters
## tidy_data.txt
Used `ddply` from `plyr` along with `numcolwise` to compute the mean of each of the columns grouped by `Activity` and `Subject`.
* Columns same as in `merged_data.txt`.
* Each column has value averaged over the `Activity` and `Subject`.
