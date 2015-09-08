## Assuming the working directory has the load-data.R file

## Load the data in the event that the environment is empty

if(length(ls())==0) { 
        source("load-data.R") 
}

## If the environment does not contain the required power data, 
## load the data by using load-data.R

if (!ls() == "power"){
        source("load-data.R")
}

## Plotting the histogram Global active power 

with(power, hist(Global_active_power, col = "red",
                           xlab = "Global Active Power (kilowatts)",
                           ylab = "Frequency", 
                           main = "Global Active Power"))

## Copying the plot to png file with height 480 pixels and width 480 pixels

dev.copy(png, file = "plot1.png", height=480, width = 480)
dev.off()

