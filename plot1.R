rm(list=ls())
file <- "./data/household_power_consumption.txt"

#read in specified file
df <- read.table(file, header = TRUE, sep = ";", na.strings = "?")

#convert date to date type
df$Date <- as.Date(df$Date, format = "%d/%m/%Y")

#keep only data for specific dates
df <- subset(df, Date == "2007-02-01" | Date == "2007-02-02")

png("plot1.png", width = 480, height = 480)

#plot1
hist(df$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()