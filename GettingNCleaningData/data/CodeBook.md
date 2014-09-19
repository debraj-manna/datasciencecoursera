# Codebook for the data


### Data Source
The data represents data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the [site](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones ) from where the data was obtained. The data can be downloaded as zip from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ).

### Data Collection

* The data has been collected by carriying out experiments with a group of 30 volunteers within an age bracket of 19-48 years.  

* Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

* Using the phone's accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. 

* The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

### Data files description

* ```features_info.txt``` - Shows information about the variables used on the feature vector.

* ```features.txt``` -  List of all features.

* ```activity_labels.txt``` - Links the class labels with their activity name.

* ```train/X_train.txt``` - Training set.

* ```train/y_train.txt``` - Training labels.

* ```test/X_test.txt``` - Test set.

* ```test/y_test.txt``` - Test labels.

* ```train/subject_train.txt``` - Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

##### Notes

* Features are normalized and bounded within [-1,1].
* Each feature vector is a row on the text file.

### Preparation of an independent tidy data set

This is done using the R script ```run_analysis.R```. The script does the following:-

1. ```train.txt``` & ```subject_train.txt``` are read into two tables using ```read.table()```
2. ```y_train.txt``` is read into a table. The activity labels are replaced with the descriptive activity name read from ```activity_labels.txt```.
3. All the tables created in the above two steps are combined using ```cbind()``` to form a merged trained data.
4. The above three steps are repeated for the corresponding data in the ```test``` folder.
5. The train & test data created in Step 3 & Step 4 are merged using ```rbind()``` to form a single merged data set.
6. Apart from the ```subject``` & ```activity``` columns, all columns that don't represent a mean or standard deviation are dropped. A column represents a mean or standard deviation if its name contains the substring ```mean()``` & ```std()``` respectively.
7. Removing the ```(),-``` from the column names, so that the column names can be directly used as function args for grouping and then summarizing the mean for the creation of tidy data set in the last step. Also mean & std is replaced with Mean & Std in the column names.
8. The cleaned data is then dumped to a file named ```merged_data.txt```.
9. A new independent tidy data set with the average of each variable for each activity and each subject is created and dumped to a file named ```tidy_data.txt```. ```dplyr``` package was used for this.

