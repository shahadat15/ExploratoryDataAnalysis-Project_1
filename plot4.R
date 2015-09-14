
#load data file 
x <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset the data over 2-day period in February, 2007 
x1 <- x[x$Date %in% c("1/2/2007","2/2/2007") ,]

#convert time and date
x2 <- strptime(paste(x1$Date, x1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#make the values numeric
x3 <- as.numeric(x1$Global_active_power)
x4 <- as.numeric(x1$Global_reactive_power)
x5 <- as.numeric(x1$Voltage)
x6 <- as.numeric(x1$Sub_metering_1)
x7 <- as.numeric(x1$Sub_metering_2)
x8 <- as.numeric(x1$Sub_metering_3)

#open a graphics device for PNG file with specific width and height
png("plot4.png", width=480, height=480)

#draw the graph
par(mfrow = c(2, 2)) 
plot(x2, x3, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(x2, x5, type="l", xlab="datetime", ylab="Voltage")
plot(x2, x6, type="l", ylab="Energy Submetering", xlab="")
lines(x2, x7, type="l", col="red")
lines(x2, x8, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(x2, x4, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()