## Assuming the working directory has the load-data.R file

## Load the data in the event that the environment is empty

if(length(ls())==0) { 
        source("load-data.R") 
}

## If the environment does not contain the required power data, 
## load the data by using load-data.R

if (!("power" %in% ls())){
        source("load-data.R")
}

## Plotting the  Submeter 1,2,3 values against the POSIXct Date_Time variable

with(power, {
        plot(x = Date_Time, y = Sub_metering_1, type = "l", ylab = "Energy sub metering")
        lines(x = Date_Time, y = Sub_metering_2, col= "red")
        lines(x = Date_Time, y = Sub_metering_3, col= "blue")
     
        })

## Adding required legend to differentiate the three meter values

legend("topright",col = c("black","red","blue"),lty=1,
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## Copying the plot to png file with height 480 pixels and width 480 pixels

dev.copy(png, file = "plot3.png", height=480, width = 480)
dev.off()



