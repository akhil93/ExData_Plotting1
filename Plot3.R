Sys.setlocale("LC_TIME", "C")
# Let's load the dataset into R.
data = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# We only need data from 1/2/2007 to t2/2/2007.
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# We need to format the Date and Time variables into one(DateTime) variable.
data$DateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# use png graphic device to capture the
png(file = "plot3.png", width = 480, height = 480)
plot(data$DateTime,data$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(data$DateTime,data$Sub_metering_2,col="red")
lines(data$DateTime,data$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"),lty = c(1, 1, 1),cex=.8)
dev.off()
