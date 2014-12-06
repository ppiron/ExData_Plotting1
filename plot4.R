#read the data - the script assumes that the data file is located in the working directory
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, na.string = "?",sep = ";", nrows = -1,
                   stringsAsFactors = FALSE)
#subset the data
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#create an array with date and time to be used for the x.axis in the plot
date <- paste(data1$Date, data1$Time)
date <- strptime(date, format = "%d/%m/%Y %H:%M:%S")

#send plot4 to a pgn file
png("plot4.png")

par(bg = "transparent") #set the background of the plot as transparent
par(mfrow = c(2,2)) 
plot(date, data1$Global_active_power, type = "l", 
     ylab = "Global Active Power", xlab ="")

plot(date, data1$Voltage, type = "l", 
     ylab = "Voltage", xlab ="datetime")

plot(date, data1$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab ="")
lines(date, data1$Sub_metering_2, type = "l", col = "red")
lines(date, data1$Sub_metering_3, type = "l", col = "blue")
legend("topright", names(data1)[7:9],
       lty=1, col=c("black", "red", "blue"), bty = "n", cex = 1)

plot(date, data1$Global_reactive_power, type = "l", 
     ylab = "Global_reactive_power", xlab ="datetime")

dev.off()