# CodeBook
Describes the variables, data, and transformations used in cleaning the data.

# Data
The data for the project was downloaded from: [data link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and the orginal, along with a full description, is available from: [full data description](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files
Once the data is downloaded and extracted a number of files and directories are created.

- *UCI HAR Dataset* is the top-level directory
- Four files are created in the top-level directory
    - *activity_labels.txt* - the type of activities measured
    - *features.txt* - the 561 features that were measured
    - *features_info.txt* - a description of the features
    - *README.txt*
- Two directories are created under the top-level directory
    - *test*
    - *train*
    - In each of these directories there are three files of interest for this project.
        - *subject_test.txt* - contains the subject IDs 
        - *X_test.txt* - contains the measurements for each of the 561 features
        - *y_test.txt* - contains an integer representing the activity