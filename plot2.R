rm(list=ls())
file <- "./data/household_power_consumption.txt"

#read in specified file
df <- read.table(file, header = TRUE, sep = ";", na.strings = "?")

#create combined datetime field
df$datetime <- paste(df$Date, df$Time)

#convert new datetime to useful format
df$datetime <- strptime(df$datetime, format = "%d/%m/%Y %H:%M:%S")

#convert date to date type
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

#keep only data for specific dates
df <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")

png("plot2.png", width = 480, height = 480)

#plot2
plot(df$datetime, df$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

dev.off()