
#Code to read data from Electric power consumption file
DataFileLocation <-"week 1/household_power_consumption.txt"
Data <- read.table(DataFileLocation, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
SubSetData <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]

DateTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)
GlobalReactivePower <- as.numeric(SubSetData$Global_reactive_power)
voltage <- as.numeric(SubSetData$Voltage)

#It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
subMeter1 <- as.numeric(SubSetData$Sub_metering_1)
#It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
subMeter2 <- as.numeric(SubSetData$Sub_metering_2)
#It corresponds to an electric water-heater and an air-conditioner.
subMeter3 <- as.numeric(SubSetData$Sub_metering_3)

#code that creates the PNG file.
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#code to plotting the graph 
#Graph 1 - Global Active Power
plot(DateTime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power", cex=0.2 )
#Graph 2 - Voltage vs datetime
plot(DateTime, voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Graph 3 - Energy sub metering
plot(DateTime, subMeter1, type = "l", ylab = "Energy sub metering", xlab = "")
lines(DateTime, subMeter2, type = "l", col="red")
lines(DateTime, subMeter3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"), bty = "o")
#Graph 4 - Global ReActive Power
plot(DateTime, GlobalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power")
dev.off()



