data <- read.table("c:/data/household_power_consumption.txt", header=T, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))
subset <- transform(subset, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

plot(subset$timestamp,subset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
