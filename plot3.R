#read data
data <- read.table('./household_power_consumption.txt',header=TRUE,sep=';')

#filter data for feb 1-2
filtered_data <- subset(data, data$Date=='1/2/2007'|data$Date=='2/2/2007')

#change sub metering cols into a numeric type
filtered_data$Sub_metering_1 <- as.numeric(as.character(filtered_data$Sub_metering_1))
filtered_data$Sub_metering_2 <- as.numeric(as.character(filtered_data$Sub_metering_2))
filtered_data$Sub_metering_3 <- as.numeric(as.character(filtered_data$Sub_metering_3))

#create datetime value 
datetime <- paste(filtered_data$Date, filtered_data$Time)
datetime <- strptime(datetime, format='%d/%m/%Y %H:%M:%S')

#open plot3.png file
png('plot3.png',width=480,height=480)

#plot each sub metering as a line into plot3.png
plot(datetime,filtered_data$Sub_metering_1,type='l', ylab='Energy sub meeting',xlab='')
lines(datetime,filtered_data$Sub_metering_2,col='red')
lines(datetime,filtered_data$Sub_metering_3,col='blue')
legend('topright',c('Sub_metering_1','Sub_metering_1','Sub_metering_1'), lty=1,col=c('black','red','blue'))

#close plot3.png file
dev.off()
