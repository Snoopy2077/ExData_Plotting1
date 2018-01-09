# opening the graphics device
png(filename="plot1.png")

# reading in and subsetting data
data <- read.csv(file = "household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE)
filtered <- subset(data, Date %in% c("1/2/2007", "2/2/2007"), select=Global_active_power)

# reformatting some of the data
filtered$Global_active_power <- as.numeric(filtered$Global_active_power)

# actual plotting
hist(filtered$Global_active_power, col="red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")

# closing graphics device
dev.off()