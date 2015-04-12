#read data from local data directory
data<-read.table('~/R/data/household_power_consumption.txt',sep=";",header=TRUE)

#subset data, since it just to days a simple singlevalue filter is used
data2<-data[data$Date=='1/2/2007'|data$Date=='2/2/2007',]

#Convert time column
date_time<-paste(data2$Date,data2$Time)
data2$Time<-strptime(date_time, "%d/%m/%Y %H:%M:%S")
rm(date_time)

#Convert date column
data2$Date<-as.Date(data2$Date, "%d/%m/%Y")

#Convert GAP column to numeric
data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))

#Plot 1, Global active power
png(filename = "plot1.png",width = 480, height = 480, units = "px")
hist(data2$Global_active_power,main='Global Active Power',xlab='Global Active Power(kilowatts)',col='red')
dev.off()