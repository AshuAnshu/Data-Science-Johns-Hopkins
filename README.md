---
title: "README.md"
author: "Ashutosh"
date: "12/01/2020"
output:
  pdf_document: default
  html_document: default
---
There are four files contained here : README.md, codebook.md, run_analysis.R, tidy_data.txt

The Followings activities were done:

1. Downloaded the dataset to my working directory. 
2. Load the dataset: X_train.txt, X_test.txt, Y_train.txt, Y_test.txt, subject_train.txt, subject_test.txt, features.txt, activity_labels.txt.
3. Merging the X_train and X_test.txt.
4. Merging the Y_train and Y_test.txt.
5. Merging the subject_train and subject_test.
6. Extracting only the measurements on the mean and standard deviation for each measurement.
7. Used descriptive activity names to name the activities in the data set.
8. Appropriately labeling the data set with descriptive variable names.
9. Creating a tidy data set with the average of each variable for each activity and each subject.