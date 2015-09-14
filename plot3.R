#file location
file <- "./household_power_consumption.txt"

#load data file 
x <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset the data over 2-day period in February, 2007 
x1 <- x[x$Date %in% c("1/2/2007","2/2/2007") ,]

#convert time and date
x2 <- strptime(paste(x1$Date, x1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#make the values numeric
x3 <- as.numeric(x1$Sub_metering_1)
x4 <- as.numeric(x1$Sub_metering_2)
x5 <- as.numeric(x1$Sub_metering_3)

#open a graphics device for PNG file with specific width and height
png("plot3.png", width=480, height=480)

#draw the graph
plot(x2, x3, type="l", ylab="Energy Submetering", xlab="")
lines(x2, x4, type="l", col="red")
lines(x2, x5, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()