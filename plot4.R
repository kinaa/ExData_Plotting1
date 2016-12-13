#reading table for two days only
fh <- file("./Coursera/04_exploratory data analysis/week_1/household_power_consumption.txt")
power_cons <- read.table(text = grep("^[1,2]/2/2007", readLines(fh), value = TRUE), 
                         col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                         comment.char="", 
                         na.strings="?", 
                         sep = ";", 
                         header = TRUE)

#transforming date column into date and time
library(lubridate)
power_cons$Date = dmy_hms(paste(power_cons$Date, power_cons$Time))
str(power_cons)

#making 2 by 2 space for 4 charts
par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

#plotting 4 charts
with(power_cons, {
  plot(type="l", 
       power_cons$Date, power_cons$Global_active_power,
       ylab="Global Active Power",
       xlab="")
  plot(type="l", 
       power_cons$Date, power_cons$Voltage,
       ylab="Voltage",
       xlab="datetime")
  plot(type="l", 
       power_cons$Date, power_cons$Sub_metering_1, 
       ylab="Energy sub metering",
       xlab="",
       col="black")
  lines(power_cons$Date, power_cons$Sub_metering_2, col="red")
  lines(power_cons$Date, power_cons$Sub_metering_3, col="blue")
  legend("topright", lty=c(1,1), col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(type="l", 
       power_cons$Date, power_cons$Global_reactive_power,
       ylab="Global_reactive_power",
       xlab="datetime")
})

#saving results to plot4.png
dev.copy(png,"./Coursera/04_exploratory data analysis/week_1/plot4.png", width = 480, height = 480)
dev.off()