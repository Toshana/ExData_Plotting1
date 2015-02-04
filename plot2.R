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

# Create plot2 
png("plot2.png", width = 480, height = 480)
plot(data$Date, data$Global_active_power, type ="l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()

