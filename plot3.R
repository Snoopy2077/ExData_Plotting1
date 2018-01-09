require(lubridate)

# opening the graphics device
png(filename="plot3.png")

# reading and subsetting the data
data <- read.csv(file = "household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE)
filtered <- subset(data, Date %in% c("1/2/2007", "1/1/2007"), select=c(Date, Time, Sub_metering_1, Sub_metering_2, Sub_metering_3))

# reformatting some of the data
filtered$Sub_metering_1 <- as.numeric(filtered$Sub_metering_1)
filtered$Sub_metering_2 <- as.numeric(filtered$Sub_metering_2)
filtered$Sub_metering_3 <- as.numeric(filtered$Sub_metering_3)
filtered$DayTime <- mdy(filtered$Date) + hms(filtered$Time)

# actual plotting
plot(filtered$DayTime, filtered$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="")
lines(filtered$DayTime, filtered$Sub_metering_2, type="l", col="red")
lines(filtered$DayTime, filtered$Sub_metering_3, type="l", col="blue")
legend( x= "topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, seg.len=2)

# closing graphics device
dev.off()