## Loading the Data
data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset of data
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Convert variables 
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetdata$Global_active_power)
globalReactivePower <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
subMetering1 <- as.numeric(subsetdata$Sub_metering_1)
subMetering2 <- as.numeric(subsetdata$Sub_metering_2)
subMetering3 <- as.numeric(subsetdata$Sub_metering_3)

## Plot 4

## File type PNG
png(filename="plot4.png", width=480, height = 480 )

## Multiple plots
par(mfrow = c(2, 2)) 
# 1st Global Active Power
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")
# 2nd Voltage
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# 3rd Sub-metering
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
# 4th Global Active Power
plot(datetime, globalReactivePower, type="l", xlab="", ylab="Global Reactive Power")

dev.off()