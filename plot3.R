suppressWarnings(library(dplyr))
suppressWarnings(library(lubridate))

# Load dataset
Data <- read.csv(file = "household_power_consumption.txt", sep =";", na.strings = "?")

# Select dates
Data <- Data[Data$Date == '1/2/2007' | Data$Date == '2/2/2007',]

# Convert date 
Data$DateTime <- dmy_hms(paste(Data$Date, Data$Time))

# Create plot
png(filename = 'plot3.png')
with(Data, plot(DateTime,Sub_metering_1, type='l', xlab="", ylab="Energy sub metering", col='black'))
with(Data, lines(DateTime,Sub_metering_2, col='red'))
with(Data, lines(DateTime,Sub_metering_3, col='blue'))
legend("topright",legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),lty=c(1,1,1))
dev.off()