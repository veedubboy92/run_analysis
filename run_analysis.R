library(reshape2)
setwd("C:/temp/dataset/UCI HAR Dataset/")

run_analysis<- function() {
        #Process data subjects
        subject_train <- read.table("train/subject_train.txt", sep="")
        subject_test <- read.table("test/subject_test.txt", sep="")
        
        #Merge datasets
        subject <- rbind(subject_train, subject_test)
        
        #set colname to "subject"
        colnames(subject) <- "subject"
        
        #Process data activity
        y_train <- read.table("train/y_train.txt", sep="")
        y_test <- read.table("test/y_test.txt", sep="")
        
        # Merge datasets
        y <- rbind(y_train, y_test)
        
        #Get activity labels
        activity_labels <- read.table("activity_labels.txt", sep="")
        # Decode activity labels
        activity <- merge(y, activity_labels, by=1)[,2]
        
        
        #Process 
        X_test <- read.table("test/X_test.txt", sep="")
        X_train <- read.table("train/X_train.txt", sep="")
        
        #Merge datasets
        X <- rbind(X_train, X_test)
        
        #Get features names
        features <- read.table("features.txt",sep="")
        
        #set colnames  
        colnames(X) <- features[, 2]
        
        
        #Combine datasets
        data <- cbind(subject, activity, X)
        
        
        #Extracts only the measurements on the mean and standard deviation for each measurement. 
        search <- grep("-mean\\(\\)|-std\\(\\)", colnames(data))
        extracted_data <- data[,c(1,2,search)]
        
        #Compute means - aggregated by activity/subject
        melted = melt(extracted_data, id.var = c("activity", "subject"))
        #Applying mean function to the new dataset
        result = dcast(melted, activity + subject ~ variable, mean)
        
        
        #Create tidy data set to file
        write.table(result, file="avg_of_variable_for_activity_and_subject.txt", sep=";", row.names=FALSE)
}

#execute function
run_analysis()