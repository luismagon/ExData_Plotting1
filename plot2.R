# First you must download the file from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# and unzip it into your workspace

doc <- read.table("./Data/household_power_consumption.txt", header = TRUE,
                  sep = ";", nrows = 70000, na.strings = "?", stringsAsFactors = FALSE)
data <- doc[doc$Date == "1/2/2007" | doc$Date == "2/2/2007", ]
datetime <- paste(data$Date, data$Time)
data$Date_time <- strptime(datetime, format = "%d/%m/%Y %H:%M:%S")

# Open the device
if(!dir.exists("Figures")) dir.create("Figures")
png(filename = "./Figures/plot2.png", width = 480, height = 480, units = "px")

plot(data$Date_time, data$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()
