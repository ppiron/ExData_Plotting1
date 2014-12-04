data <- read.table("household_power_consumption.txt", 
                   header = TRUE, na.string = "?",sep = ";", nrows = -1,
                   stringsAsFactors = FALSE)
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

png("plot1.png")

hist(data1$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()