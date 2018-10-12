suppressWarnings(library(dplyr))
suppressWarnings(library(lubridate))

# Load dataset
Data <- read.csv(file = "household_power_consumption.txt", sep =";", na.strings = "?")

# Select dates
Data <- Data[Data$Date == '1/2/2007' | Data$Date == '2/2/2007',]

# Convert date 
Data$DateTime <- dmy_hms(paste(Data$Date, Data$Time))

# Plot 2
png(filename = 'plot2.png')
with(Data, plot(DateTime,Global_active_power, type='l', xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()
