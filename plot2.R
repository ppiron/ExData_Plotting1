data <- read.table("household_power_consumption.txt", 
                   header = TRUE, na.string = "?",sep = ";", nrows = -1,
                   stringsAsFactors = FALSE)
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

date <- paste(data1$Date, data1$Time)
date <- strptime(date, format = "%d/%m/%Y %H:%M:%S")

png("plot2.png")

plot(date, data1$Global_active_power, type = "l", 
     ylab = "Global Active Power (kilowatts)", xlab ="")

dev.off()

