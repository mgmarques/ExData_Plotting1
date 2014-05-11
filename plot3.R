## +-------------------------------------------------------------------------------------+
## | plot3.R - Peer Assessments/Course Project 1 to Exploratory Data Analysis            |
## | Created by: Marcelo Gomes Marques - At: 05/11/2014                                  |
## | Created with R x64 3.1.0 Patched on Windows 7 64 bits SO and use data.table library |
## +-------------------------------------------------------------------------------------+

## **************** Function definitions and load libraries code segment ***************** 

## Call Data_Preparation.R to check, download and prepare the data if necessary
source("Data_Preparation.R")

## Function to plot a line graph of "Energy sub metering" with Sub_metering_1 in default 
## color, Sub_metering_2 in red and Sub_metering_3 in blue at at y-axis and date time 
## at x-axis withou title, a legend place at the top right corner and all into a frame
## with 480 pixels of width and height
plot3_png <- function() {
        message("Call generic process to prepare the tidy data of household_power_consumption")
        tidy <- Data_Preparation();
        
        ## open the PNG device, plot the line graph and close the devise.
        ## The PNG file is save at data_dir defined at Data_Preparation.R
        
        png(filename = paste(data_dir, "/", "plot3.png", sep=""),
            width = 480, height = 480, units = "px")
        cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        plot(tidy$DateTime, tidy$Sub_metering_1, type="l", xlab=""
             , ylab="Energy sub metering")
        lines(tidy$DateTime, tidy$Sub_metering_2, type="l", col="red")
        lines(tidy$DateTime, tidy$Sub_metering_3, type="l", col="blue")
        legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols)
        dev.off()
        message(paste("See your plot3.png at", data_dir,"directory!"))
}

plot3_png()

