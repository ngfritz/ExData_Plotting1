#read txt
dataset<-read.csv("./Assignment1/household_power_consumption.txt", header=TRUE, sep=";",colClasses = c("character", "character", rep("numeric",7)), na="?")
#filter data
data <- dataset[(dataset$Date == "1/2/2007") | (dataset$Date == "2/2/2007"),]
#transform data & time
data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
#open png device, set filename, resolution
png(filename="plot1.png", width=480, height=480, units="px")
#plot histogram
hist(data$Global_active_power, 
     col="red", 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)")
#close png device
dev.off()


