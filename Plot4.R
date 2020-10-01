file <- "./household_power_consumption.txt"
data <- read.table(file, header = T, sep = ";", stringsAsFactors = F, dec = ".")
subSet <- data[data$Date %in% c("1/2/2007", "2/2/2007") ,]

dt <- strptime(paste(subSet$Date, subSet$Time, sep = " "), "%d/%m/%Y %H:%M:%S")
globalAP <- as.numeric(subSet$Global_active_power)
globalRP <- as.numeric(subSet$Global_reactive_power)
V <- as.numeric(subSet$Voltage)
sMetering1 <- as.numeric(subSet$Sub_metering_1)
sMetering2 <- as.numeric(subSet$Sub_metering_2)
sMetering3 <- as.numeric(subSet$Sub_metering_3)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))

plot(dt, globalAP, type = 'l', xlab = '', ylab = "Global Active Power", cex =.2)
plot(dt, V, type='l', xlab = '', ylab = "Voltage")

plot(dt, sMetering1, type = "l", ylab ="Energy Submetering", xlab = "")
lines(dt, sMetering2, type = "l", col = "red")
lines(dt, sMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd=2.5, col=c("black", "red", "blue"), bty = 0)

plot(dt, globalRP, type='l', xlab = "datetime", ylab = "Global_reactive_power")

dev.off()