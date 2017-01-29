mydata <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

mydata$datetime <- paste(mydata$Date, mydata$Time)
mydata$datetime <- strptime(mydata$datetime, "%d/%m/%Y %H:%M:%S")

filterdata <- subset(mydata, datetime  >= ymd("2007-02-01") & datetime < ymd("2007-02-03"))

filterdata$Global_active_power <- as.numeric(filterdata$Global_active_power) 

png(file = "Plot3.png", width = 480, height = 480, units = "px")

plot(filterdata$datetime, filterdata$Sub_metering_1, ylab="Energy sub metering",xlab=NA, type = 'l', col = "black")

lines(filterdata$datetime, filterdata$Sub_metering_2, col = "red")

lines(filterdata$datetime, filterdata$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_1"), lty = 1)

dev.off()