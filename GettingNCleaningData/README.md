# Getting and Cleaning Data - Course Project
-------------------

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The repo consists of the following major things:-

* A tidy data set file named ```tidy_data.txt```
* A ```R``` script named ```run_analysis.R``` preparing the tidy data set
* A code book that describes the variables, the data, and any transformations or work that was performed to clean up the data called ```CodeBook.md```


### Steps for preparing the tidy data using the ```run_analysis.R```

* Download the data from [here](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ). A full description of the data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

* Unzip the contents of the zip file and place the following in a directory named ```data```:-
	* ```test``` 
    * ```train``` 
    * ```activity_labels.txt```
    * ```features.txt```
	
* Delete the ```Inertia Signals``` folder from both ```data/train``` & ```data/test```.

* Place the ```run_analysis.R``` in the same directory in which ```data``` directory resides

* Open "R Studio" and set working directory to be the directory containing both ```data``` and ```run_analysis.R``` using the ```setwd()```

* Execute ```source("run_analysis.R")```. This will create the following two files in ```data``` directory:-
	* ```merged_data.txt``` - Merged content of training data, testing data, subjects & labels with descriptive names for the feature columns and the activity. 
    * ```tidy_data.txt``` -  A new independent tidy data set with the average of each variable grouped by subject and activity.
  
Refer ```CodeBook.md``` for the details about how ```merged_data.txt``` & ```tidy_data.txt``` were prepared.
