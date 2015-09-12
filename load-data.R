## Loading the lubridate package

if (!("lubridate" %in% installed.packages())) install.packages("lubridate")

library(lubridate)

## Checking if the data file is in working directory

if (!file.exists("household_power_consumption.txt")){
        ## url for the data 
        
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        ## download and unzip the required file
        
        download.file(url, destfile = "data.zip")
        unzip("data.zip") 
        
        ## removing unwanted variables
        rm(url)
}

## reading the first 5 rows using read.table
## seperator used is ";", header info is available
## unavailable data are marked "?"

dframe <- read.table(file = "household_power_consumption.txt", nrows = 5,
                     sep=";",header = TRUE,na.strings = "?")

## Column names are stored to be used later
colName_df <- names(dframe)

## class of each data is stored in colClasses_df to read the whole table
colClasses_df = sapply(dframe,class)

## reading the power data only for dates 2007-02-01 and 2007-02-02
power <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'),
                    sep=";", header = FALSE, na.strings = "?", colClasses = colClasses_df)

# Appropriately name the column names and change the Date column values to POSIXct format
names(power) <- colName_df

power$Date <- dmy(power$Date)

#Creating Date_Time column

power$Date_Time <- as.POSIXct(paste(as.Date(power$Date), 
                                              power$Time))
# removing intermediate variables

rm(dframe,colName_df,colClasses_df)
