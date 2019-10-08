library("data.table")

data <- fread("household_power_consumption.txt", na.strings = "?")

data <- data[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
data <- data[(datetime >= "2007-02-01") & (datetime < "2007-02-03")]

png("plot3.png", width = 480, height = 480)
plot(data[, datetime], data[, Sub_metering_1], type = "l", xlab = "", ylab = "Energy sub metering")
lines(data[, datetime], data[, Sub_metering_2], col = "red")
lines(data[, datetime], data[, Sub_metering_3], col = "blue")
legend("topright", col = c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1), lwd = c(1,1))
dev.off()