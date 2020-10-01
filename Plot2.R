file <- "./household_power_consumption.txt"
data <- read.table(file, header = T, sep = ";", stringsAsFactors = F, dec = ".")
subSet<- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

datetime <- strptime(paste(subSet$Date, subSet$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalAP <- as.numeric(subSet$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
