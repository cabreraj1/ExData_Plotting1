## Loading the Data
data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

## Subset of data
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Convert variables 
globalActivePower <- as.numeric(subsetdata$Global_active_power)

## Plot 1

## File type PNG
png(filename="plot1.png", width=480, height = 480 )

## Histogram
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()