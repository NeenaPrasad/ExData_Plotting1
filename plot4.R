
## Load the data in the event that the environment is empty

if(length(ls())==0) { 
        source("load-data.R") 
}

## If the environment does not contain the required power data, 
## load the data by using load-data.R

if (!("power" %in% ls())){
        source("load-data.R")
}

## Setting the graphic device with appropriate pixel size

png("plot4.png", height = 480,width = 480)
## Requires a 2 by 2 array of graphs, storing the old mfrow value to 
## not affect the defaults

mfrow_old <- par("mfrow")
margin <- par("mar")
oma_old <- par("oma")

## Setting mfrow to 2 by 2, margin and outer margin

par(mfrow = c(2,2), mar = c(4,4,2,1), oma =c(0,0,0,0))
## 4 Plots added to the graph 
## Plot 1 : Plotting the  Global active power against the POSIXct Date_Time variable
## Plot 2 : Plotting the  Voltage against the POSIXct Date_Time variable
## Plot 3 : Plotting the  Submeter 1,2,3 values against the POSIXct Date_Time variable
## Plot 4 : Plotting the  Global reactive power against the POSIXct Date_Time variable

with(power, {
        plot(x = Date_Time, y = Global_active_power, 
             ylab = "Global Active Power (kilowatts)",xlab="", type = "l")
        plot(x = Date_Time, y = Voltage, 
             ylab = "Voltage",xlab = "datetime", type = "l")
        plot(x = Date_Time, y = Sub_metering_1, 
             xlab = "", ylab = "Energy sub metering", type = "l")
        lines(x = Date_Time, y = Sub_metering_2, col= "red")
        lines(x = Date_Time, y = Sub_metering_3, col= "blue")
        legend("topright",col = c("black","red","blue"),lty=1,bty="n",lwd=2,
               legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        plot(x = Date_Time, y = Global_reactive_power, type = "l")
        
})

## restoring the global arguments
par(mfrow = mfrow_old, mar = margin,oma = oma_old)

# removing temporary variables
rm(margin,mfrow_old,oma_old)

## Closing the connection
dev.off()

