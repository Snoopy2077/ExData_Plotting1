require(lubridate)

# opening the graphics device
png(filename="plot2.png")

# reading and subsetting data
data <- read.csv(file = "household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE)
filtered <- subset(data, Date %in% c("1/2/2007", "2/2/2007"), select=c(Date, Time, Global_active_power))

# reformatting some of the data
filtered$Global_active_power <- as.numeric(filtered$Global_active_power)
filtered$DayTime <- dmy(filtered$Date) + hms(filtered$Time)

# actual plotting
plot(filtered$DayTime, filtered$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)", xlab="")

# closing graphics device
dev.off()