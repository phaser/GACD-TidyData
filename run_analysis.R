library(data.table)
library(dplyr)
# ===============
# Step 1
# ===============
features <- read.table("UCI HAR Dataset/features.txt")

# Read the data in tests
tests_tbl <- read.table("UCI HAR Dataset/test/X_test.txt")
tests_subject_tbl <- read.table("UCI HAR Dataset/test/subject_test.txt")
tests_activity_lbl <- read.table("UCI HAR Dataset/test/y_test.txt")
names(tests_tbl) <- features$V2
tests_tbl$Subject <- tests_subject_tbl$V1
tests_tbl$Activity <- tests_activity_lbl$V1
rm(tests_activity_lbl)
rm(tests_subject_tbl)

# Read the data in train
train_tbl <- read.table("UCI HAR Dataset/train/X_train.txt")
train_subject_tbl <- read.table("UCI HAR Dataset/train/subject_train.txt")
train_activity_lbl <- read.table("UCI HAR Dataset/train/y_train.txt")
train_tbl$Subject <- train_subject_tbl$V1
train_tbl$Activity <- train_activity_lbl$V1
names(train_tbl) <- features$V2
rm(train_activity_lbl)
rm(train_subject_tbl)

data <- rbindlist(list(tests_tbl, train_tbl))
rm(tests_tbl)
rm(train_tbl)
rm(features)

# ===============
# Step 2
# ===============
data <- select(data, contains("mean()"), contains("std()"), Subject:Activity)

# ===============
# Step 3
# ===============
# Rename activities
activity_labels <- c("WALKING",
                     "WALKING_UPSTAIRS",
                     "WALKING_DOWNSTAIRS",
                     "SITTING",
                     "STANDING",
                     "LAYING")

labels <- lapply(data$Activity, function(x) {
    activity_labels[x]
})
data$Activity <- labels

# Step 4 was done at the beginning
# Save the dataset
save(data, file="UCI_HAR_Dataset_tidy.Rda")