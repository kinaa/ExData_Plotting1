#reading table for two days only
fh <- file("./Coursera/04_exploratory data analysis/week_1/household_power_consumption.txt")
power_cons <- read.table(text = grep("^[1,2]/2/2007", readLines(fh), value = TRUE), 
                         col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
                         comment.char="", 
                         na.strings="?", 
                         sep = ";", 
                         header = TRUE)

#creating histogram
hist(power_cons$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")

#saving results to plot1.png
dev.copy(png,"./Coursera/04_exploratory data analysis/week_1/plot1.png", width = 480, height = 480)
dev.off()
