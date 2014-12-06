#read the data - the script assumes that the data file is located in the working directory
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, na.string = "?",sep = ";", nrows = -1,
                   stringsAsFactors = FALSE)
#subset the data
data1 <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",]

#send plot1 to a pgn file
png("plot1.png")

par(bg = "transparent") #set the background of the plot as transparent
hist(data1$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()