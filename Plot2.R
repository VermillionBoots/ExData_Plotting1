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

df1 <- data.frame(power_data$Global_active_power, DateTime = as.POSIXct(paste(power_data$Date, power_data$Time)))
png(filename="Plot2.png", width=480, height=480, bg = "transparent")
plot(df1$DateTime, df1$power_data.Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
dev.off()

