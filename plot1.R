suppressWarnings(library(dplyr))
suppressWarnings(library(lubridate))

# Load dataset
Data <- read.csv(file = "household_power_consumption.txt", sep =";", na.strings = "?")

# Select dates
Data <- Data[Data$Date == '1/2/2007' | Data$Date == '2/2/2007',]

# Convert date 
Data$DateTime <- dmy_hms(paste(Data$Date, Data$Time))

# Create plot
png(filename = 'plot1.png')
with(Data, hist(Global_active_power, col='red', xlab="Global Active Power (kilowatts)", main="Global Active Power"))
dev.off()