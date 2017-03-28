library(reshape2)

filename <- "getdata_projectfiles_UCI HAR Dataset.zip"

## Create ./data directory if it does not exist
if (!file.exists("./data")){dir.create("./data")}

setwd("./data")  

## Download the raw data
if (!file.exists(filename)){
    dataUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(dataUrl, filename, method="curl")
}  

## Extract data files
unzip(filename) 

## Define data files names
featuresFile <- "features.txt"
activityLabelsFile <- "activity_labels.txt"
subjectTrainFile <- "subject_train.txt"
xTrainDataFile <- "X_train.txt" 
yTrainLabelFile <- "y_train.txt" 

subjectTestFile <- "subject_test.txt"
xTestDataFile <- "X_test.txt" 
yTestLabelFile <- "y_test.txt" 

## Read in features and activity labels data files
features = read.table(paste0("./UCI HAR Dataset/",featuresFile), 
                    header= FALSE, sep = " ", stringsAsFactors =FALSE, 
                    col.names = c("featureid", "featurename"))
activityLabels = read.table(paste0("./UCI HAR Dataset/",activityLabelsFile), 
                    header= FALSE, sep = " ", stringsAsFactors =FALSE, 
                    col.names = c("activityid", "activityname"))

## Read in in Train data files.
subjectTrain = read.table(paste0("./UCI HAR Dataset/train/",subjectTrainFile), 
                          header= FALSE, sep = " ", stringsAsFactors =FALSE, 
                          col.names = "subjectid")

xTrainDataColNames <- tolower(c(gsub("[-\\(\\),\\.]", "",features$featurename)))
xTrainDataColNames <- sub("^t", "time",xTrainDataColNames)
xTrainDataColNames <- sub("^f", "freq",xTrainDataColNames)
xTrainDataColNames <- sub("bodybody", "body",xTrainDataColNames)

xTrainData = read.table(paste0("./UCI HAR Dataset/train/",xTrainDataFile), 
                        header= FALSE, stringsAsFactors =FALSE,
                        col.names = xTrainDataColNames)
                        
yTrainLabel<- read.table(paste0("./UCI HAR Dataset/train/",yTrainLabelFile), 
                        header= FALSE, stringsAsFactors =FALSE, sep= " ",
                        col.name = "activityid")


## Read in Test data files.
subjectTest = read.table(paste0("./UCI HAR Dataset/test/",subjectTestFile), 
                          header= FALSE, sep = " ", stringsAsFactors =FALSE, 
                          col.names = "subjectid")

xTestDataColNames <- tolower( c(gsub("[-\\(\\),\\.]", "",features$featurename)))
xTestDataColNames <- sub("^t", "time",xTestDataColNames)
xTestDataColNames <- sub("^f", "freq",xTestDataColNames)
xTestDataColNames <- sub("(bodybody)", "body",xTestDataColNames)

xTestData = read.table(paste0("./UCI HAR Dataset/test/",xTestDataFile), 
                        header= FALSE, stringsAsFactors =FALSE,
                        col.names = xTestDataColNames)

yTestLabel<- read.table(paste0("./UCI HAR Dataset/test/",yTestLabelFile), 
                         header= FALSE, stringsAsFactors =FALSE, sep= " ",
                         col.name = "activityid")


## Merge columns of train and test data frames
  mergedTrainDF <- cbind("subjectid"=subjectTrain$subjectid, 
                         "activityid"=yTrainLabel$activityid,
                         observationtype = rep("train", nrow(subjectTrain)), xTrainData)

  mergedTrainDF<- merge(x=activityLabels, y=mergedTrainDF,
                        by.x = "activityid", 
                        by.y = "activityid", 
                        sort = FALSE)
  
  mergedTestDF <- cbind("subjectid"=subjectTest$subjectid, 
                        "activityid"=yTestLabel$activityid,
                        observationtype = rep("test", nrow(subjectTest)), xTestData)

  mergedTestDF<- merge(x=activityLabels, y=mergedTestDF, 
                       by.x = "activityid", 
                       by.y = "activityid",
                       sort = FALSE); 

## Bind test and train data sets together
  
  complete_merged_df <- rbind(mergedTrainDF, mergedTestDF)

  
## Select mean and std related columns 
  filtered_merged_df <- complete_merged_df[ , c(3, 2, grep(".*mean.*|.*std.*", 
                                                          names(complete_merged_df) ))]
  
## Convert Subjects and Activities to factors
  filtered_merged_df$activityname <- factor(filtered_merged_df$activityname,
                                            levels = activityLabels$activityname,
                                            labels= activityLabels$activityname)
  filtered_merged_df$subjectid <- factor(filtered_merged_df$subjectid)

## Melt and reshape the data frame by subjectid and activityname
  grouped_df <- melt(filtered_merged_df, id = c("subjectid", "activityname"))
  grouped_mean_df <- dcast(grouped_df, subjectid + activityname ~ variable, mean)

## Write the final dataset to disk
  write.table(grouped_mean_df, "../tidy_dataset.txt", row.names = FALSE, quote = FALSE)

  
  
  