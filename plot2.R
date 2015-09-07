## Assuming the working directory has the load-data.R file

## Load the data in the event that the environment is empty

if(length(ls())==0) { 
        source("load-data.R") 
}

## If the environment does not contain the required power data, 
## load the data by using load-data.R

if (!ls() == "power_4analysis"){
        source("load-data.R")
}

## Plotting the  Global active power against the POSIXct Date_Time variable

with(power_4analysis, plot(x = Date_Time, y = Global_active_power,
                           ylab = "Global Active Power (kilowatts)",
                           type = "l"))

## Copying the plot to png file with height 480 pixels and width 480 pixels

dev.copy(png, file = "plot2.png", height=480, width = 480)
dev.off()



