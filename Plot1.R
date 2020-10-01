file <- "./household_power_consumption.txt"
data <- read.table(file, header = T, sep = ";", stringsAsFactors = F, dec = ".")
subSet <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

globalAP <- as.numeric(subSet$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalAP, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()