# First you should download and unzip in your workspace the file from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

doc <- read.table("./Data/household_power_consumption.txt", header = TRUE,
                  sep = ";", nrows = 70000, na.strings = "?", stringsAsFactors = FALSE)
data <- doc[doc$Date == "1/2/2007" | doc$Date == "2/2/2007", ]
datetime <- paste(data$Date, data$Time)
data$Date_time <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

# Open the device
png(filename = "./Figures/plot4.png", width = 480, height = 480, units = "px")

par(mfcol = c(2,2))

plot(data$Date_time, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")
with(data, {plot(Date_time, Sub_metering_1, type = "l",
                 xlab = "", ylab = "Energy sub metering")
      lines(Date_time, Sub_metering_2, type = "l", col = "red")
      lines(Date_time, Sub_metering_3, type = "l", col = "blue")
})
legend("topright", lwd = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(data$Date_time, data$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")
plot(data$Date_time, data$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()


