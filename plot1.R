# Load data into R
epower <- read.csv("~/Coursera/EDA/ExData_Plotting1/household_power_consumption.txt", sep=";", na.strings="?", stringsAsFactors=FALSE)

# Convert date to Date class
epower$Date <- as.Date(epower$Date, "%d/%m/%Y")

# Convert time to POSIXlt
# epower$Time <- format(epower$Time, format="%H:%M:%S")

# Subset Data
date1 <- subset(epower, Date == "2007-02-01")
date2 <- subset(epower, Date == "2007-02-02")
data <- rbind(date1, date2)

# Create plot1 

png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power,
     freq = TRUE, 
     col = "red", 
     border = "black", 
     main = paste("Global Active Power"), 
     xlab = "Global Active Power (kilowatts)"
)
dev.off()
