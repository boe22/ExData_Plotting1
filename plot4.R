suppressWarnings(library(dplyr))
suppressWarnings(library(lubridate))

# Load dataset
Data <- read.csv(file = "household_power_consumption.txt", sep =";", na.strings = "?")

# Select dates
Data <- Data[Data$Date == '1/2/2007' | Data$Date == '2/2/2007',]

# Convert date 
Data$DateTime <- dmy_hms(paste(Data$Date, Data$Time))

# Creat plot
png(filename = 'plot4.png')
attach(Data)
par(mfrow=c(2,2))
plot(DateTime,Global_active_power, type='l', xlab="", ylab="Global Active Power")
plot(DateTime,Voltage, type='l', xlab="datetime", ylab="Voltage")
plot(DateTime,Sub_metering_1, type='l', xlab="", ylab="Energy sub metering", col='black')
lines(DateTime,Sub_metering_2, col='red')
lines(DateTime,Sub_metering_3, col='blue')
legend("topright", inset=0.01,legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),col=c("black","red", "blue"),lty=c(1,1,1),box.lty=0)
plot(DateTime,Global_reactive_power, type='l', xlab="datetime", ylab="Global_reactive_power")
dev.off()