## +-------------------------------------------------------------------------------------+
## | plot4.R - Peer Assessments/Course Project 1 to Exploratory Data Analysis            |
## | Created by: Marcelo Gomes Marques - At: 05/11/2014                                  |
## | Created with R x64 3.1.0 Patched on Windows 7 64 bits SO and use data.table library |
## +-------------------------------------------------------------------------------------+

## **************** Function definitions and load libraries code segment ***************** 

## Call Data_Preparation.R to check, download and prepare the data if necessary
source("Data_Preparation.R")

## Function to plot a lines graphs into a frame of 2X2 in a PNG device 
## with with 480 pixels of width and height

plot4_png <- function() {
        message("Call generic process to prepare the tidy data of household_power_consumption")
        tidy <- Data_Preparation();
        
        ## open the PNG device, plot the lines graphs at a frame of 2X2 and close the devise.
        ## The PNG file is save at data_dir defined at Data_Preparation.R
        
        png(filename = paste(data_dir, "/", "plot4.png", sep=""),
            width = 480, height = 480, units = "px")    
        par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
        with(tidy, {
                ## Fisrt plot: a line of Global Active Power by the time
                plot(DateTime, Global_active_power, type="l", 
                     xlab="", ylab="Global Active Power")
            
                ## Seconde plot: a line of Voltage by the time
                plot(DateTime, Voltage, type="l", 
                     xlab="datetime", ylab="Voltage");
        
                ## Third plot: a line graph with 3 measures, iqual of the plot3.R generates
                cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
                plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
                lines(DateTime, Sub_metering_2, type="l", col="red")
                lines(DateTime, Sub_metering_3, type="l", col="blue")
                legend("topright", lty=1, lwd=1, 
                       col=c("black","blue","red"), 
                       legend=cols, bty="n");
        
                ## Fourth plot: a line graph of Global_reactive_power, with y-axis title
                ## defined woth Global_reactive_power and x-axis tile defined as datetime
                plot(DateTime, Global_reactive_power, 
                     xlab="datetime", ylab="Global_reactive_power",
                     type="l");       
    })    
    dev.off();
    message(paste("See your plot4.png at", data_dir,"directory!")) 
}

plot4_png()

