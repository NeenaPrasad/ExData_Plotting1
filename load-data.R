library(lubridate)


## Checking if the data file is in working directory

if (!file.exists("household_power_consumption.txt")){
        ## url for the data 
        
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        
        ## download and unzip the required file
        
        download.file(url, destfile = "data.zip")
        unzip("data.zip") 
}

## reading the first 5 rows using read.table
## seperator used is ";", header info is available
## unavailable data are marked "?"

dframe <- read.table(file = "household_power_consumption.txt", nrows = 5,
                     sep=";",header = TRUE,na.strings = "?")

## class of each data is stored in colClasses_df to read the whole table
colClasses_df = sapply(dframe,class)


## reading the power data
power <- read.table(file = "household_power_consumption.txt", sep=";",
                    header = TRUE, na.strings = "?", colClasses = colClasses_df)


## checking for rows with dates "2007-02-01" and "2007-02-02" to subset the data

sub <- (dmy(power$Date) == ymd("2007-02-01")) | (dmy(power$Date) == ymd("2007-02-02"))

power_4analysis <- subset(power, sub)

## Converting Date column from factor to "POSIXct" "POSIXt"

power_4analysis$Date <- dmy(power_4analysis$Date)

#Creating Date_Time column

power_4analysis$Date_Time <- as.POSIXct(paste(as.Date(power_4analysis$Date), 
                                              power_4analysis$Time))


# removing intermediate variables

rm(dframe,power,sub,colClasses_df)
