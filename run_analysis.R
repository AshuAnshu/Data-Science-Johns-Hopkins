library(dplyr)

# Reading the train data
X_train <- read.table("C:/Users/Ashutosh/Desktop/Education/Johns Hopkins Data Science/Getting and Cleaning Data/UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("C:/Users/Ashutosh/Desktop/Education/Johns Hopkins Data Science/Getting and Cleaning Data/UCI HAR Dataset/train/Y_train.txt")
subj_train <- read.table("C:/Users/Ashutosh/Desktop/Education/Johns Hopkins Data Science/Getting and Cleaning Data/UCI HAR Dataset/train/subject_train.txt")

# Reading the test data
X_test <- read.table("C:/Users/Ashutosh/Desktop/Education/Johns Hopkins Data Science/Getting and Cleaning Data/UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("C:/Users/Ashutosh/Desktop/Education/Johns Hopkins Data Science/Getting and Cleaning Data/UCI HAR Dataset/test/Y_test.txt")
subj_test <- read.table("C:/Users/Ashutosh/Desktop/Education/Johns Hopkins Data Science/Getting and Cleaning Data/UCI HAR Dataset/test/subject_test.txt")

# Reading the data description
variable_name <- read.table("C:/Users/Ashutosh/Desktop/Education/Johns Hopkins Data Science/Getting and Cleaning Data/UCI HAR Dataset/features.txt")

# Reading the activity labels
activity_labels <- read.table("C:/Users/Ashutosh/Desktop/Education/Johns Hopkins Data Science/Getting and Cleaning Data/UCI HAR Dataset/activity_labels.txt")

# 1. Merging training and test data
X_merg <- rbind(X_train, X_test)
Y_merg <- rbind(Y_train, Y_test)
subj_merg <- rbind(subj_train, subj_test)

# 2. Extracting only the measurements on the mean and standard deviation for each measurement.
selected_var <- variable_name[grep("mean\\(\\)|std\\(\\)",variable_name[,2]),]
X_merg <- X_merg[,selected_var[,1]]

# 3. Using descriptive activity names to name the activities in the data set
colnames(Y_merg) <- "activity"
Y_merg$activitylabel <- factor(Y_merg$activity, labels = as.character(activity_labels[,2]))
activitylabel <- Y_merg[,-1]

# 4. Appropriately labels the data set with descriptive variable names.
colnames(X_merg) <- variable_name[selected_var[,1],2]

# 5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
colnames(subj_merg) <- "subject"
total <- cbind(X_merg, activitylabel, subj_merg)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_each(funs(mean))
write.table(total_mean, file = "C:/Users/Ashutosh/Desktop/Education/Johns Hopkins Data Science/Getting and Cleaning Data/UCI HAR Dataset/tidydata.txt", row.names = FALSE, col.names = TRUE)
