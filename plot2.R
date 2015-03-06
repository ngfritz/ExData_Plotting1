#read txt
dataset<-read.csv("./Assignment1/household_power_consumption.txt", header=TRUE, sep=";",colClasses = c("character", "character", rep("numeric",7)), na="?")
#filter data
data <- dataset[(dataset$Date == "1/2/2007") | (dataset$Date == "2/2/2007"),]
#transform data & time
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
#open png device, set filename, resolution
png(filename="plot2.png", width=480, height=480, units="px")
#plot 
plot(data$DateTime, 
     data$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
#close png device
dev.off()

