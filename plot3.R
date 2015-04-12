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

#Convert GAP and ESM column to numeric
data2$Global_active_power<-as.numeric(as.character(data2$Global_active_power))
data2$Sub_metering_1<-as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2<-as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3<-as.numeric(as.character(data2$Sub_metering_3))

#Plot 3, ESM by day
png(filename = "plot3.png",width = 480, height = 480, units = "px")
plot(data2$Time,data2$Sub_metering_1,type="l",ylab='Energy sub metering',xlab='')
lines(data2$Time,data2$Sub_metering_2,type="l", col='red')
lines(data2$Time,data2$Sub_metering_3,type="l", col='blue')
legend("topright",col=c("black","blue","red"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off()