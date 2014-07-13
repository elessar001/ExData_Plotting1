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

#Eliminate cases with NA 

data1 <- data1[complete.cases(data1),]

#generate png file

png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(data1$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
