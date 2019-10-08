library("data.table")

data <- fread("household_power_consumption.txt", na.strings = "?")

data <- data[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

data <- data[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width = 480, height = 480)
hist(data[, Global_active_power], main = "Global Active Power", xlab = "Global Active Power (Kilowatts)", ylab = "Frequency", col = "Red")
dev.off()
