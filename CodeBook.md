## Exploratory Data Analysis

Course Project for exdata-032 for Exploratory Data Analysis

###Dataset

**Individual household electric power consumption Data Set** from the  UC Irvine Machine Learning Repository is used.

It has the electric power consumption in a household over a 4 year period with data sampled every minute.

Dataset has 2,075,259 rows and 9 columns.
Missing values are coded with **'?'**.
The values are separated by **';'**.



###Variables



**Date**: Date in format dd/mm/yyyy

**Time**: time in format hh:mm:ss

**Global_active_power**: household global minute-averaged active power (in kilowatt)

**Global_reactive_power**: household global minute-averaged reactive power (in kilowatt)

**Voltage**: minute-averaged voltage (in volt)

**Global_intensity**: household global minute-averaged current intensity (in ampere)

**Sub_metering_1**: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).

**Sub_metering_2**: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.

**Sub_metering_3**: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.

###Files involved

####1. load-data.R

This script does the following:

1. Checks if the dataset (**household_power_consumption.txt**) is present in the working directory
2. Dataset zipfile is downloaded if it is not.
3. Zipfile is unzipped and read into the R with read.table with appropriate arguments. Initially 5 rows are read into the R to determine the column classes and is then used to read the entire table to minimise the time taken.  
4. The data for a two day period alone is required for the project,ie , for dates 2007-02-01 and 2007-02-02.
5. A new variable Date_Time is created in the dataframe with class **POSIXct** by combining the Date and Time columns in data frame.
6. Processed dataframe **power_4analysis** alone is retained and all the intermediary variables are deleted

####2. plot1.R

The script:

1. Checks if the dataframe required for plot is ready, if not it is loaded by sourcing **load-data.R**. 
2. plots the histogram of **_Global_active_power_** in the color *red*.
3. Image is copied to PNG file plot1.png with dimension 480 pixels by 480 pixels.

####3. plot2.R

The script:

1. Checks if the dataframe required for plot is ready, if not it is loaded by sourcing **load-data.R**.
2. plot **_Global_active_power_** against __*Date_Time*__ 
3. Image is copied to PNG file plot2.png with dimension 480 pixels by 480 pixels.

####4. plot3.R

The script:

1. Checks if the dataframe required for plot is ready, if not it is loaded by sourcing **load-data.R**.
2. plot **Sub_metering_1**,**Sub_metering_2** and **Sub_metering_3** against __*Date_Time*__ 
3. Image is copied to PNG file plot3.png with dimension 480 pixels by 480 pixels.

####4. plot4.R

The script:

1. Checks if the dataframe required for plot is ready, if not it is loaded by sourcing **load-data.R**.
2. Create a 2 by 2 graph window to plot the following graphs:
        2.1.  **_Global_active_power_** against __*Date_Time*__.
        2.2.  **_Voltage_** against __*Date_Time*__
        2.3.  **Sub_metering_1**,**Sub_metering_2** and **Sub_metering_3** against __*Date_Time*__
        2.4.  **_Global_reactive_power_** against __*Date_Time*__.  
3. Image is copied to PNG file plot4.png with dimension 480 pixels by 480 pixels, here the Cairo package was used for png rendering, since the dev.copy to output png was not rendering properly. 



