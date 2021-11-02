#read data
data <- read.table('./household_power_consumption.txt',header=TRUE,sep=';')

#filter data for feb 1-2
filtered_data <- subset(data, data$Date=='1/2/2007'|data$Date=='2/2/2007')

#change global active power col into a numeric type
filtered_data$Global_active_power <- as.numeric(as.character(filtered_data$Global_active_power))

#create datetime value 
datetime <- paste(filtered_data$Date, filtered_data$Time)
datetime <- strptime(datetime, format='%d/%m/%Y %H:%M:%S')

#open plot2.png file
png('plot2.png',width=480,height=480)

#plot the global active power as a line into plot2.png
plot(datetime,filtered_data$Global_active_power,type='l', ylab='Global Active Power (kilowatts)',xlab='')

#close plot2.png file
dev.off()
