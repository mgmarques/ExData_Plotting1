Data_Preparation.R Code Book:
=============================

> <b>Data_Preparation.R</b> - Created for Peer Assessments/Exploratory Data Analysis Week 1<p>
> Created with R x64 3.1.0 Patched on Windows 7 64 bits SO and use data.table library<p>
> <b>Created by:</b> Marcelo Gomes Marques - At: 11/05/2014<p>
 
#### Code and transformations description:

The Data_Preparation.R is a data preparation procees to create a tidy file of household_power_consumption.ZIP file.

The code initiate with functions definitions and load libraries. 

* First is defined a check_file_exist to check if the files exists in the path defined by file_path. If don't exists stops execution of the current expression and executes an error action

* Second is defined a load_data function. This function use tidyFile and data_dir to define the file_path, and fileSource and data_dir to define source_path.
  call the check_file_exist function to check, if the file exist send a message to user for waiting the load of file. 
  if not, the source file is download if it doesn't exists. Once the source zip file exist, the code check if its unziped and unzip this file if necessary.

* Third: Data_Preparation function call the load_data to create a tidy file, only with first and seconde day of feb-2007. In this tidy file a new col "DateTime" is created with the combination of date and time cols and coerced to a POSIXlt with strptime function and "%d/%m/%Y %H:%M:%S" mask.

* Fourth: The plot'n'.R codes creates a PNG files with plots made according with the instructions of ours Peer Assessments.

OBS: Every time you run a plot'n'.R (plot1.R, plot2.R, plot3.R, or plot4.R), the Data_Preparation.R is called and check if you have the source file or the tidy file at your data directory. If it doesn’t exists, the file is download, if the tidy file doesn’t exist its created.


Data:
=====

> str(tidy)

'data.frame':	2880 obs. of  11 variables:</p>
 $ X                    : int  66637 66638 66639 66640 66641 66642 66643 66644 66645 66646 ...</p>
 $ Date                 : Factor w/ 2 levels "1/2/2007","2/2/2007": 1 1 1 1 1 1 1 1 1 1 ...</p>
 $ Time                 : Factor w/ 1440 levels "00:00:00","00:01:00",..: 1 2 3 4 5 6 7 8 9 10 ...</p>
 $ Global_active_power  : num  0.326 0.326 0.324 0.324 0.322 0.32 0.32 0.32 0.32 0.236 ...</p>
 $ Global_reactive_power: num  0.128 0.13 0.132 0.134 0.13 0.126 0.126 0.126 0.128 0 ...</p>
 $ Voltage              : num  243 243 244 244 243 ...</p>
 $ Global_intensity     : num  1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1 ...</p>
 $ Sub_metering_1       : int  0 0 0 0 0 0 0 0 0 0 ...</p>
 $ Sub_metering_2       : int  0 0 0 0 0 0 0 0 0 0 ...</p>
 $ Sub_metering_3       : int  0 0 0 0 0 0 0 0 0 0 ...</p>
 $ DateTime             : POSIXlt, format: "2007-02-01 00:00:00" "2007-02-01 00:01:00" "2007-02-01 00:02:00" </p>

> summary(tidy$DateTime)
 
    DateTime                  
 Min.   :2007-02-01 00:00:00  
 1st Qu.:2007-02-01 11:59:45  
 Median :2007-02-01 23:59:30  
 Mean   :2007-02-01 23:59:30  
 3rd Qu.:2007-02-02 11:59:15  
 Max.   :2007-02-02 23:59:00  
 
