data <- read.table("c:/data/household_power_consumption.txt", header=T, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))
subset$Global_reactive_power<-as.numeric(as.character(subset$Global_reactive_power))
subset$Voltage <- as.numeric(as.character(subset$Voltage))
subset <- transform(subset, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")
subset$Sub_metering_1 <- as.numeric(as.character(subset$Sub_metering_1))
subset$Sub_metering_2 <- as.numeric(as.character(subset$Sub_metering_2))
subset$Sub_metering_3 <- as.numeric(as.character(subset$Sub_metering_3))

par(mfrow = c(2,2))
plot(subset$timestamp,subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(subset$timestamp,subset$Voltage, type="l",  ylab="Voltage (volt)", xlab="") 
plot(subset$timestamp,subset$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subset$timestamp,subset$Sub_metering_2,col="red")
lines(subset$timestamp,subset$Sub_metering_3,col="blue")
plot(subset$timestamp,subset$Global_reactive_power, type="l",  ylab="Global Rective Power (kilowatts)",xlab="") 

dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()

