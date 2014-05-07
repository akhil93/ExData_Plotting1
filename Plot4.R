# Let's load the dataset into R.
data = read.table("household_power_consumption.txt", header=TRUE, sep = ";", na.strings = "?")

# We only need data from 1/2/2007 to t2/2/2007.
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# We need to format the Date and Time variables into one(DateTime) variable.
data$DateTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

# use png graphic device to capture the plot
png("plot4.png", width = 480, height = 480)

#Dividing the graphic pane in 2x2 and adding plots according to col-wise.
par(mfcol=c(2,2)) 
# Plot 1
plot(sub$DateTime, sub$Global_active_power, type= "l", lwd=1, ylab= "Global Active Power (kilowatts)", xlab="")

#Plot 2
plot(data$DateTime, data$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
lines(data$DateTime, data$Sub_metering_2, type="l", col="red")
lines(data$DateTime, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, bty="n", col=c("black", "red", "blue")) # The end of adding the second plot.

#Plot 3
plot(data$DateTime, data$Voltage, type="l", xlab="datetime", ylab="Voltage")   # Adding the third plot.

#Plot 4
plot(data$DateTime, data$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")  # Adding the forth plot.
dev.off()