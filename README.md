# GACD-TidyData
Getting And Cleaning Data Week 3 Assignment

The run_analysis.R file produces two files: UCI_HAR_Dataset_tidy.txt and UCI_HAR_Dataset_averages_tidy.txt

The files are produced in the following way:
  - The data from UCI HAR Dataset/test/X_test.txt is loaded as table_test
  - The data from UCI HAR Dataset/test/subject_test.txt is loaded and appendend
    to the table_test as column Subject
  - The same is done for UCI HAR Dataset/test/y_test.txt and appendend to the
    table as column Activity
  - Then the same is done for the data in UCI HAR Dataset/train which has the same
    format.
  - Finally the tables are merged and just the columns that contain mean() and 
    std() are selected, and Subject and Activity are kept as well.
  - This table is saved to UCI_HAR_Dataset_tidy.txt
  - Then another table is produced with the averages of the values contained in
    each of the columns, by Subject and Activity, and that is saved to UCI_HAR_Dataset_averages_tidy.txt
    
In order to obtain the data files you just have to run the script in R.
