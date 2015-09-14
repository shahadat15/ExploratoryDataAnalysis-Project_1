#file location
file <- "./household_power_consumption.txt"

#load data file 
x <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset the data over 2-day period in February, 2007 
x1 <- x[x$Date %in% c("1/2/2007","2/2/2007") ,]

#convert time and date
x2 <- strptime(paste(x1$Date, x1$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#make the values numeric
x3 <- as.numeric(x1$Global_active_power)

#open a graphics device for PNG file with specific width and height
png("plot2.png", width=480, height=480)

#draw the graph
plot(x2, x3, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()