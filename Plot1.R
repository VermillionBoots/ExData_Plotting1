library(readr)
library(dplyr)

#Get the data set for the specified dates
power_data <- read.csv("~/Courses/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE )
power_data$Date <- as.Date( as.character(power_data$Date), format="%d/%m/%Y")
lowDate <- as.Date( "1/2/2007", format="%d/%m/%Y")
highDate <- as.Date( "2/2/2007", format="%d/%m/%Y")
power_data <- subset(power_data, lowDate <= power_data$Date & power_data$Date <= highDate)

#Modify the data type
kw <- function(x) return(as.numeric(x))
power_data$Global_active_power = kw(as.character(power_data$Global_active_power))

png(filename="Plot1.png", width=480, height=480, bg = "transparent")

hist(as.numeric(power_data$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency" )

dev.off()


