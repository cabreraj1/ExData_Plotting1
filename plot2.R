## Loading the Data
data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset of data
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Convert variables 
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(subsetdata$Global_active_power)

## Plot 2

## File type PNG
png(filename="plot2.png", width=480, height = 480 )

## Time Series
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()