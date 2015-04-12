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
head(wday(val,label=T))
png(filename="plot2.png",width=480,height=480,units = "px")
plot(as.numeric(data1$Global_active_power)~data1$Date_Time,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)")
dev.off()