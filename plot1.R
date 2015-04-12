#Creates Histogram

install.packages("data.table")
library(data.table)
install.packages("dplyr")
library(dplyr)
install.packages("lubridate")
library(lubridate)

data<-fread("household_power_consumption.txt", sep="auto",header="auto",stringsAsFactors=False)

data1<-data[Date %in% c("1/2/2007","2/2/2007")]

png(filename="plot1.png",width=480,height=480,units = "px")
hist(as.numeric(data1$Global_active_power), xlab="Global Active Power",main="Global Active Power",col="red")
dev.off()