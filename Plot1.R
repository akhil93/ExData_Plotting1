Sys.setlocale("LC_TIME", "C")
# Let's load the dataset into R.
data = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# We only need data from 1/2/2007 to t2/2/2007.
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# use png graphic device to capture the plot
png(file="plot1.png", width=480,height=480)
hist(data$Global_active_power, main = "Global Active Power", col=2, xlab="Global Active Power (kilowatts)")

# Turn off the graphic device.
dev.off()
