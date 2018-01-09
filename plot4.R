require(lubridate)

# opening the graphics device
png(filename="plot4.png")


# reading in and subsetting
data <- read.csv(file = "household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE)
filtered <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

# reformatting some of the data
filtered$Global_active_power <- as.numeric(filtered$Global_active_power)
filtered$Global_reactive_power <- as.numeric(filtered$Global_reactive_power)
filtered$Voltage <- as.numeric(filtered$Voltage)
filtered$DayTime <- dmy(filtered$Date) + hms(filtered$Time)
filtered$Sub_metering_1 <- as.numeric(filtered$Sub_metering_1)
filtered$Sub_metering_2 <- as.numeric(filtered$Sub_metering_2)
filtered$Sub_metering_3 <- as.numeric(filtered$Sub_metering_3)


# setting up multi-plot and creating the four plots
par(mfrow=c(2,2))
plot(filtered$DayTime, filtered$Global_active_power, type="l", ylab = "Global Active Power", xlab="")
plot(filtered$DayTime, filtered$Voltage, type="l", ylab = "Voltage", xlab="datetime")
plot(filtered$DayTime, filtered$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(filtered$DayTime, filtered$Sub_metering_2, type="l", col="red")
lines(filtered$DayTime, filtered$Sub_metering_3, type="l", col="blue")
legend( x= "topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, seg.len=2)
plot(filtered$DayTime, filtered$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")

# closing the graphics device
dev.off()