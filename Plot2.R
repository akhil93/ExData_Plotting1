# Let's load the dataset into R.
data = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# We only need data from 1/2/2007 to t2/2/2007.
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# We need to format the Date and Time variables into one(DateTime) variable.
data$DateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# Use png graphic device to capture the plot.
png(file="plot2.png", width=480,height=480)
plot(data$DateTime,data$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()