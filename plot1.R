data <- read.table("c:/data/household_power_consumption.txt", header=T, sep=";")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset <- data[(data$Date=="2007-02-01") | (data$Date=="2007-02-02"),]
subset$Global_active_power <- as.numeric(as.character(subset$Global_active_power))

hist(subset$Global_active_power, main = paste("Global Active Power"), col="red", xlab="Global Active Power (kilowatts)")

dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
