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
- *run_analysis.R* is the script that was written to clean/transform the data for the project. The script contains numerous comments describing each of the steps.

# Methodology

The first step was to read in the data from the following tables:

- activity_labels.txt
- features.txt

In the next step all but those features describing the mean and standard deviation were elminiated from the *features.txt* file and saved. This list was used to create a (true/false) vector for filtering.

Next the feature names were simplified to remove special characters and saved in a variable to be used as column names along with *subject* and *activity*.

The resulting column names were:

- subject
- activity
- tBodyAccMeanX
- tBodyAccMeanY
- tBodyAccMeanZ
- tBodyAccSTDX
- tBodyAccSTDY
- tBodyAccSTDZ
- tGravityAccMeanX
- tGravityAccMeanY
- tGravityAccMeanZ
- tGravityAccSTDX
- tGravityAccSTDY
- tGravityAccSTDZ
- tBodyAccJerkMeanX
- tBodyAccJerkMeanY
- tBodyAccJerkMeanZ
- tBodyAccJerkSTDX
- tBodyAccJerkSTDY
- tBodyAccJerkSTDZ
- tBodyGyroMeanX
- tBodyGyroMeanY
- tBodyGyroMeanZ
- tBodyGyroSTDX
- tBodyGyroSTDY
- tBodyGyroSTDZ
- tBodyGyroJerkMeanX
- tBodyGyroJerkMeanY
- tBodyGyroJerkMeanZ
- tBodyGyroJerkSTDX
- tBodyGyroJerkSTDY
- tBodyGyroJerkSTDZ
- tBodyAccMagMean
- tBodyAccMagSTD
- tGravityAccMagMean
- tGravityAccMagSTD
- tBodyAccJerkMagMean
- tBodyAccJerkMagSTD
- tBodyGyroMagMean
- tBodyGyroMagSTD
- tBodyGyroJerkMagMean
- tBodyGyroJerkMagSTD
- fBodyAccMeanX
- fBodyAccMeanY
- fBodyAccMeanZ
- fBodyAccSTDX
- fBodyAccSTDY
- fBodyAccSTDZ
- fBodyAccFreqMeanX
- fBodyAccFreqMeanY
- fBodyAccFreqMeanZ
- fBodyAccJerkMeanX
- fBodyAccJerkMeanY
- fBodyAccJerkMeanZ
- fBodyAccJerkSTDX
- fBodyAccJerkSTDY
- fBodyAccJerkSTDZ
- fBodyAccJerkFreqMeanX
- fBodyAccJerkFreqMeanY
- fBodyAccJerkFreqMeanZ
- fBodyGyroMeanX
- fBodyGyroMeanY
- fBodyGyroMeanZ
- fBodyGyroSTDX
- fBodyGyroSTDY
- fBodyGyroSTDZ
- fBodyGyroFreqMeanX
- fBodyGyroFreqMeanY
- fBodyGyroFreqMeanZ
- fBodyAccMagMean
- fBodyAccMagSTD
- fBodyAccMagFreqMean
- fBodyBodyAccJerkMagMean
- fBodyBodyAccJerkMagSTD
- fBodyBodyAccJerkMagFreqMean
- fBodyBodyGyroMagMean
- fBodyBodyGyroMagSTD
- fBodyBodyGyroMagFreqMean
- fBodyBodyGyroJerkMagMean
- fBodyBodyGyroJerkMagSTD
- fBodyBodyGyroJerkMagFreqMean


In the next setp the data from the following files was read into data frames. The features filter previously created was used to filter the input from the *X_test.txt* files.

- subject_train.txt
- subject_test.txt
- X_test.txt (From both the train and test directories)
- y_train.txt (From both the train and test directories)

Next a dataframe was created for the test data and one for the training data by combining the (subject, activity(y_train.txt or y_test.txt), measurments (X_train.txt or y_train.txt)). The columnames were changed using the previously created vector of column names. These dataframes were combined into a *combinedData* dataframe.

The *subject* and *activity* fields in the *combinedData* dataframe were converted to factors and the *activity* factors were replaced with the activity labels to make the tables more readable.

In the final step the *tidyTable* was created using the *aggregate()* function to record only the unique *subject*/*activity* combinations along with the mean of the associated measurements. The *tidyTable* was then written out as a CSV file and added to the repository. An additional copy was uploaded per the assignment submission instructions.
