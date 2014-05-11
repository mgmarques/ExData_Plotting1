## +-------------------------------------------------------------------------------------+
## | plot2.R - Peer Assessments/Course Project 1 to Exploratory Data Analysis            |
## | Created by: Marcelo Gomes Marques - At: 05/11/2014                                  |
## | Created with R x64 3.1.0 Patched on Windows 7 64 bits SO and use data.table library |
## +-------------------------------------------------------------------------------------+

## **************** Function definitions and load libraries code segment ***************** 

## Call Data_Preparation.R to check, download and prepare the data if necessary
source("Data_Preparation.R")

## Function to plot a line graph with Global Active Power (kilowatts) at y-axis and date time 
## at x-axis in a PNG devise withou x-axis title, y-axis "Global Active Power (kilowatts)"
## and into a frame with 480 pixels of width and height
plot2_png <- function() {
        message("Call generic process to prepare the tidy data of household_power_consumption")
        tidy <- Data_Preparation();
        
        ## open the PNG device, plot the line graph and close the devise.
        ## The PNG file is save at data_dir defined at Data_Preparation.R
        
        png(filename = paste(data_dir, "/", "plot2.png", sep=""),
            width = 480, height = 480, units = "px")
        plot(tidy$DateTime, tidy$Global_active_power, type="l",
             xlab="", ylab="Global Active Power (kilowatts)")
        dev.off()
        message(paste("See your plot2.png at", data_dir,"directory!"))
}

plot2_png()

