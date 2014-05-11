## +-------------------------------------------------------------------------------------+
## | plot1.R - Peer Assessments/Course Project 1 to Exploratory Data Analysis            |
## | Created by: Marcelo Gomes Marques - At: 05/11/2014                                  |
## | Created with R x64 3.1.0 Patched on Windows 7 64 bits SO and use data.table library |
## +-------------------------------------------------------------------------------------+

## **************** Function definitions and load libraries code segment ***************** 

## Call Data_Preparation.R to check, download and prepare the data if necessary
source("Data_Preparation.R")

## Function to plot a histogram with Global Active Power (kilowatts) in a PNG devise
## with par: color "red", title "Global Active Power", x-axis "Global Active Power 
## (kilowatts)" and in a frame with 480 pixels of width and height
plot1_png <- function() {
    message("Call generic process to prepare the tidy data of household_power_consumption")
    tidy <- Data_Preparation();
    
    ## open the PNG device, plot the histogram and close the devise.
    ## The PNG file is save at data_dir defined at Data_Preparation.R
    png(filename = paste(data_dir, "/", "plot1.png", sep=""), 
        width = 480, height = 480, units = "px");
    hist(tidy$Global_active_power, main="Global Active Power", 
         xlab="Global Active Power (kilowatts)", col="red");
    dev.off();
}

plot1_png();

