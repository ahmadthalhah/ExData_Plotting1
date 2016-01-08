DataFileLocation <-"week 1/household_power_consumption.txt"
Data <- read.table(DataFileLocation, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
SubSetData <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]

DateTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)

subMeter1 <- as.numeric(SubSetData$Sub_metering_1)
subMeter2 <- as.numeric(SubSetData$Sub_metering_2)
subMeter3 <- as.numeric(SubSetData$Sub_metering_3)

png("plot3.png", width = 480, height = 480)
plot(DateTime, subMeter1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(DateTime, subMeter2, type = "l", col="red")
lines(DateTime, subMeter3, type = "l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2.5, col = c("black", "red", "blue"))
dev.off()



