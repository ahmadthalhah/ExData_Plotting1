#Code to read data from Electric power consumption file
DataFileLocation <-"week 1/household_power_consumption.txt"
Data <- read.table(DataFileLocation, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
SubSetData <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]

DateTime <- strptime(paste(SubSetData$Date, SubSetData$Time, sep = ""), "%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(SubSetData$Global_active_power)


#code that creates the PNG file
png("plot2.png", width = 480, height = 480)

#code to plotting the graph
plot(DateTime, GlobalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()



