# Load data into R
epower <- read.csv("~/Coursera/EDA/ExData_Plotting1/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Convert date to Date class
epower$Date <- as.Date(epower$Date, "%d/%m/%Y")

# Subset Data
date1 <- subset(epower, Date == "2007-02-01")
date2 <- subset(epower, Date == "2007-02-02")
data <- rbind(date1, date2)

# Format Date/Time columns
data$Date <- paste(data$Date, data$Time)
data$Date <- as.POSIXct(data$Date)
data$Time <- NULL

png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2), mar = c(5, 4, 2, 2), oma = c(0, 0, 2, 0) )
with(data, {
      plot(Date, Global_active_power, type ="l",
           ylab = "Global Active Power (kilowatts)", xlab = "")
      plot(Date, Voltage, type = "l",
           xlab = "datetime", ylab = "Voltage")
      plot(Date, Sub_metering_1, type = "l",
           ylab = "Energy sub metering", xlab = "")
      lines(Date, Sub_metering_2, col = "red")
      lines(Date, Sub_metering_3, col = "blue")
      legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
             lty = c(1, 1, 1),
             col = c("black", "red", "blue"))
      plot(Date, Global_reactive_power, type = "l", 
           xlab = "datetime", ylab = "Global_reactive_power")
})
dev.off()










