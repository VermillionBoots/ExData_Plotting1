library(readr)
library(dplyr)

#Get the data set for the specified dates
power_data <- read.csv("~/Courses/Exploratory Data Analysis/exdata-data-household_power_consumption/household_power_consumption.txt", sep=";", header=TRUE )
power_data$Date <- as.Date( as.character(power_data$Date), format="%d/%m/%Y")
lowDate <- as.Date( "1/2/2007", format="%d/%m/%Y")
highDate <- as.Date( "2/2/2007", format="%d/%m/%Y")
power_data <- subset(power_data, lowDate <= power_data$Date & power_data$Date <= highDate)

#Modify the data types
kw <- function(x) return(as.numeric(x))
power_data$Sub_metering_1 = kw(as.character(power_data$Sub_metering_1))
power_data$Sub_metering_2 = kw(as.character(power_data$Sub_metering_2))
power_data$Sub_metering_3 = kw(as.character(power_data$Sub_metering_3))

#Create the subset and plot the data
df1 <- data.frame(power_data$Sub_metering_1, power_data$Sub_metering_2, power_data$Sub_metering_3, DateTime = as.POSIXct(paste(power_data$Date, power_data$Time)))
png(filename="Plot3.png", width=480, height=480, bg = "transparent")
plot(df1$DateTime, df1$power_data.Sub_metering_1, ylab="Energy sub metering", xlab="", type="l")
lines(df1$DateTime, df1$power_data.Sub_metering_2, col="red", type="l")
lines(df1$DateTime, df1$power_data.Sub_metering_3, col="blue", type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1),lwd=c(2.5,2.5), col=c("black","red","blue"))
dev.off()

