library(dplyr)

###READ DATA FROM ALL THE TABLES & APPEND IT ALONG(TEST AND TRAIN) AS WE READ  
features <- read.table("features.txt")
activity_labels <- read.table("activity_labels.txt")

subject <- rbind(read.table("subject_train.txt"),read.table("subject_test.txt"))

x <-  rbind(read.table("X_train.txt"),
            read.table("x_test.txt"))

y <- rbind(read.table("y_train.txt"),
           read.table("y_test.txt"))

activity_labels <- read.table("activity_labels.txt")

###STARTING WITH FEATURES TABLE - REPLACE ALL THE SPECIAL CHARACTERS FROM SECOND COLUMN
###This would give us a clean list of camelcase variables which can directly be used as labels

features$V2 <- gsub("[[:punct:]]", "", features$V2)

###Now as the feature names have been cleaned up by removing special characters,
###they can be applied as column names to dataset "x" having all measurements 
names(x) <- features$V2

###Transpose dataset x - this would help to manipulate the dataset to keep 
###only required measurements
x_transpose <- t(x)
###Keep the required features of mean & std, use "ignore.case" option while using
###grep to keep all required measurements
req_features <- c("mean","std")
xt_req_stats <- x_transpose[grep(paste(req_features, collapse='|'),rownames(x_transpose),ignore.case = T),]

###Transpose the table again to get the std and mean measurements as columns
x_req_stats <- t(xt_req_stats)

###Dataset y gives us codes 1-6 for different activities liseted in "activity_labels" table
###Add the activity codes column to x_req_stats
names(y) <- c("act_code")
req_stats <- cbind(x_req_stats,y)

###Merge in activity discription using activity codes
names(activity_labels) <- c("act_code","activity")
req_stats <- merge(req_stats,activity_labels,by="act_code")

###Add in subject IDs
names(subject) <- c("subject")
req_stats <- cbind(req_stats,subject)

###Rearrange the columns, and remove activity code as we already have activity discription
req_stats <-  subset(req_stats, select=c(88,89,2:87))

###Summarize all the stats to be unique at (activity+subject) level
req_stats <- group_by(req_stats,activity,subject)
summ_req_stats <- summarise_each(req_stats,funs(mean))

###write the final output to text file "summarizedMeasurements.txt"
write.table(summ_req_stats,"summarizedMeasurements.txt",row.names=FALSE)



