mydata <- read.table("./household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)

mydata$datetime <- paste(mydata$Date, mydata$Time)
mydata$datetime <- strptime(mydata$datetime, "%d/%m/%Y %H:%M:%S")

filterdata <- subset(mydata, datetime  >= ymd("2007-02-01") & datetime < ymd("2007-02-03"))

filterdata$Global_active_power <- as.numeric(filterdata$Global_active_power) 

png(file = "Plot2.png", width = 480, height = 480, units = "px")

plot(filterdata$datetime, filterdata$Global_active_power, ylab="Global Active Power (kilowatts)",xlab=NA, type = 'l')

dev.off()