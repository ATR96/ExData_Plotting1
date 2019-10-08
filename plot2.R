library("data.table")

data <- fread("household_power_consumption.txt", na.strings = "?")

data <- data[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
data <- data[(datetime >= "2007-02-01") & (datetime < "2007-02-03")]

png("plot2.png", width = 480, height = 480)
plot(data[, datetime], data$Global_active_power, type = "l", xlab = "", ylab ="Global Active Power (Kilowatts)")
dev.off()