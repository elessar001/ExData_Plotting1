#Platform and Version Data
#
#platform
#"x86_64-w64-mingw32"
#version
#"R version 3.1.0 (2014-04-10)"
#
#File was downloaded manually from 
#https://d396qusza40orc.cloudfront.net
#/exdata%2Fdata%2Fhousehold_power_consumption.zip


#Read data from File

data1<-read.table("household_power_consumption.txt", 
                  header = T, sep = ";", na.strings = "?", 
                  nrows = 2075259, comment.char = "")

#Create a temporary variable to sort by dates and 
#get data for 01/02/2007 and 02/02/2007

temp <- as.date(as.character(data1$Date), order = "dmy")
dates <- as.date(as.character(c("1/2/2007", "2/2/2007")), order = "dmy")
data1 <- data1[temp == dates[1] | temp == dates[2],]

#Convert Date and Time columns of data into one column of datetime objects

data1$Date <- as.POSIXct(as.character(paste(
    data1$Date, data1$Time)), format = "%d/%m/%Y %H:%M:%S", tz = "")

#generate png file

png(file = "plot2.png", width = 480, height = 480, units = "px")
plot(data1$Date, data1$Global_active_power, xlab = "", 
     ylab = "Global Active Power (kilowatts)", type ="l")
dev.off()