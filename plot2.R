library(lubridate)

dat <- read.table("household_power_consumption.txt",header=TRUE,sep=";",stringsAsFactors = FALSE)
dat$Date <- dmy(dat$Date)
dat$Time <- hms(dat$Time)
dat <- subset(dat,Date>=ymd("2007-02-01")&Date<=ymd("2007-02-02"))
dat$Global_active_power <- as.numeric(dat$Global_active_power)
dat$Global_reactive_power <- as.numeric(dat$Global_reactive_power)

png("plot2.png",width=480,height=480)
plot(dat$Date+dat$Time,dat$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.off()
