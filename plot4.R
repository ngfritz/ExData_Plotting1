#read txt
dataset<-read.csv("./Assignement1/household_power_consumption.txt", header=TRUE, sep=";",colClasses = c("character", "character", rep("numeric",7)), na="?")
#filter data
data <- dataset[(dataset$Date == "1/2/2007") | (dataset$Date == "2/2/2007"),]
#transform data & time
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
#open png device, set filename, resolution
png(filename="plot4.png", width=480, height=480, units="px")
#set plot area
par(mfcol=c(2,2))
#plot1
plot(data$DateTime, 
     data$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
#plot2
plot(data$DateTime, 
     data$Sub_metering_1,
     type="l",
     xlab="", 
     ylab="Energy sub metering")
#add & plot additional variables
lines(data$DateTime, 
      data$Sub_metering_2, 
      col="red", 
      type="l")
lines(data$DateTime, 
      data$Sub_metering_3, 
      col="blue", 
      type="l")
#add legend
legend("topright",
       bty="n",
       col=c("black","red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),
       lwd=1)
#plot3
plot(data$DateTime, 
     data$Voltage,
     type="l",
     xlab="datetime", 
     ylab="Voltage")
#plot4
plot(data$DateTime, 
     data$Global_reactive_power,
     type="l",
     xlab="datetime", 
     ylab="Global_reactive_power")
#close png device
dev.off()
