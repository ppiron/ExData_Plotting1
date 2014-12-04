data <- read.table("household_power_consumption.txt", 
                   header = TRUE, na.string = "?",sep = ";", nrows = -1,
                   stringsAsFactors = FALSE)
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

date <- paste(data1$Date, data1$Time)
date <- strptime(date, format = "%d/%m/%Y %H:%M:%S")

png("plot3.png")

plot(date, data1$Sub_metering_1, type = "l", 
     ylab = "Energy sub metering", xlab ="")
lines(date, data1$Sub_metering_2, type = "l", col = "red")
lines(date, data1$Sub_metering_3, type = "l", col = "blue")
legend("topright", names(data1)[7:9],
       lty=1, col=c("black", "red", "blue"))

dev.off()