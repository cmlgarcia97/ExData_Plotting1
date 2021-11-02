#read data
data <- read.table('./household_power_consumption.txt',header=TRUE,sep=';')

#filter data for feb 1-2
filtered_data <- subset(data, data$Date=='1/2/2007'|data$Date=='2/2/2007')

#change sub metering, voltage, and global reactive power cols into a numeric type
filtered_data$Sub_metering_1 <- as.numeric(as.character(filtered_data$Sub_metering_1))
filtered_data$Sub_metering_2 <- as.numeric(as.character(filtered_data$Sub_metering_2))
filtered_data$Sub_metering_3 <- as.numeric(as.character(filtered_data$Sub_metering_3))
filtered_data$Voltage <- as.numeric(as.character(filtered_data$Voltage))
filtered_data$Global_reactive_power <- as.numeric(as.character(filtered_data$Global_reactive_power))

#create datetime value 
datetime <- paste(filtered_data$Date, filtered_data$Time)
datetime <- strptime(datetime, format='%d/%m/%Y %H:%M:%S')

#open plot4.png file
png('plot4.png',width=480,height=480)

#specify composite plot with 4 plots
par(mfcol=c(2,2))

#plot each plot into plot4.png
plot(datetime,filtered_data$Global_active_power,type='l', ylab='Global Active Power (kilowatts)',xlab='')

plot(datetime,filtered_data$Sub_metering_1,type='l', ylab='Energy sub meeting',xlab='')
lines(datetime,filtered_data$Sub_metering_2,col='red')
lines(datetime,filtered_data$Sub_metering_3,col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_1','Sub_metering_1'), lty=1,col=c('black','red','blue'))

plot(datetime,filtered_data$Voltage,type='l', ylab='Voltage')

plot(datetime,filtered_data$Global_reactive_power,type='l', ylab='Global_reactive_power')

#close plot4.png file
dev.off()
