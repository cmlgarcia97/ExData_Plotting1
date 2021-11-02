#read data
data <- read.table('./household_power_consumption.txt',header=TRUE,sep=';')

#filter data for feb 1-2
filtered_data <- subset(data, data$Date=='1/2/2007'|data$Date=='2/2/2007')

#change global active power col into a numeric type
filtered_data$Global_active_power <- as.numeric(as.character(filtered_data$Global_active_power))

#open plot1.png file
png('plot1.png',width=480,height=480)

#plot the global active power as a histogram into plot1.png
hist(filtered_data$Global_active_power, xlab='Global Active Power (kilowatts)', main='Global Active Power',col='red')

#close plot1.png file
dev.off()