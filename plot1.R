DataFileLocation <-"week 1/household_power_consumption.txt"
Data <- read.table(DataFileLocation, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
SubSetData <- Data[Data$Date %in% c("1/2/2007", "2/2/2007"),]

GlobalActivePower <- as.numeric(SubSetData$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(GlobalActivePower, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()



