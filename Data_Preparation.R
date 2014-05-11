## +-------------------------------------------------------------------------------------+
## | Data_Preparation.R - Peer Assessments/Course Project 1 to Exploratory Data Analysis |
## | Created by: Marcelo Gomes Marques - At: 05/11/2014                                  |
## | Created with R x64 3.1.0 Patched on Windows 7 64 bits SO and use data.table library |
## +-------------------------------------------------------------------------------------+

## **************** Function definitions and load libraries code segment ***************** 

## Check if the files exists in the path defined by file_path.
## If don't exists stops execution of the current expression 
## and executes an error action
check_file_exist <- function(file_path) 
{
        if (!file.exists(file_path))
                stop("The ", file_path, " not found!") else TRUE 
}

## Use dataset and data_dir to define the file_path, call the check_file_exist
## function to check, if the file exist send a message to user for waiting the
## load of file. Finally returned with dataset load to data variable.
load_data <- function(tidyFile, data_dir = "./data", fileURL, fileSource) 
{
        # Dataset check and load 
        
        file_path <- paste(data_dir, "/", tidyFile , sep="")
        source_path <- paste(data_dir, "/", fileSource , sep="")
        txt_file <- paste(data_dir, "/","household_power_consumption.txt", sep="")

        if (!file.exists(file_path)) {
                if (!file.exists(source_path)) {
                        message(paste("Please Wait! Load", fileURL, "..."));
                        download.file(fileURL, destfile=source_path);
                } 
                if (!file.exists(txt_file)) {
                    message(paste("Please Wait! Unzip", source_path, " file..."));
                    unzip(source_path, exdir = data_dir);
                }
                message(paste("Please Wait! Load", txt_file, " to dataset..."));
                data <- read.table(txt_file,
                                   header=TRUE, sep=';', na.strings="?",
                                   colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
                data <- data[(data$Date == "1/2/2007") | (data$Date == "2/2/2007"),]
                data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
                write.csv(data, file_path)
                
        }
        data <- read.csv(file_path)
        data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")
        data
}

## Function to call the data preparation process for the household_power_consumption
Data_Preparation <- function() {
        data_tidy <- load_data("hpc_tidy.csv", data_dir, 
                               "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
                               "household_power_consumption.zip")
        data_tidy
}


## Load data.table library
library(data.table)

## ************ End Function definitions and load libraries code segment ***************** 

## Assign the directory that all data set was unzip and confirm its exists
data_dir <- "./data";

## Check if the "./data" directory exists, if doesn't ask to user the path
## of his data directory. If user inform a invalid directory path stops execution
## of the current expression and executes an error action
if (!file.exists(data_dir)){
        data_dir <- readline(prompt = "Please, inform your data directory path: ") 
        if (!file.exists(data_dir)){
                stop("You inform a invalid directory path")
        }
}

