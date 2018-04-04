library(lubridate)

dat <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
dat$Date <- dmy(dat$Date)
dat$Time <- hms(dat$Time)
dat <- subset(dat,Date>=ymd("2007-02-01")&Date<=ymd("2007-02-02"))
dat$Global_active_power <- as.numeric(dat$Global_active_power) #original data was in watts, not kilowatts as in description
dat$Global_reactive_power <- as.numeric(dat$Global_reactive_power) #no house uses a megawatt of electricity

datetime <- dat$Date + dat$Time

png("plot4.png",width=480,height=480)
par(mfrow=c(2,2))
plot(datetime,dat$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(datetime,dat$Voltage,type="l",ylab="Voltage")
plot(dat$Date+dat$Time,dat$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering",yaxp=c(0,30,3),ylim=c(-1,38))
lines(dat$Date+dat$Time,as.numeric(dat$Sub_metering_2),type="l",col="red")
lines(dat$Date+dat$Time,dat$Sub_metering_3,type="l",col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),pch="-",lwd=1,bty="n")
plot(datetime,dat$Global_reactive_power,type="l",ylab="Global_reactive_power")
dev.off()
