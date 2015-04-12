install.packages("data.table")
library(data.table)
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)

data<-fread("household_power_consumption.txt", sep="auto",header="auto",stringsAsFactors=False)

data1<-data[Date %in% c("1/2/2007","2/2/2007")]

data1$Date <- as.Date(data1$Date,"%d/%m/%Y")
data1$Date_Time<-ymd_hms(paste(data1$Date,data1$Time))

png(filename="plot4.png",width=480,height=480,units = "px")
par(mfcol=c(2,2))

plot(as.numeric(data1$Global_active_power)~data1$Date_Time,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")

plot(as.numeric(data1$Sub_metering_1)~data1$Date_Time,
     type="l",
     xlab="",
     ylab="Energy sub metering")
lines(as.numeric(data1$Sub_metering_2)~data1$Date_Time,col="red")
lines(as.numeric(data1$Sub_metering_3)~data1$Date_Time,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

plot(as.numeric(data1$Voltage)~data1$Date_Time,
     type="l",
     xlab="datetime",
     ylab="Voltage")

plot(as.numeric(data1$Global_reactive_power)~data1$Date_Time,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power")
dev.off()