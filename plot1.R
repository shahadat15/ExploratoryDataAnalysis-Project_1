#file location
file <- "./household_power_consumption.txt"

#load data file 
x <- read.table(file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#subset the data over 2-day period in February, 2007 
x1 <- x[x$Date %in% c("1/2/2007","2/2/2007") ,]

#make the values numeric
x2 <- as.numeric(x1$Global_active_power)

#open a graphics device for PNG file with specific width and height
png("plot1.png", width=480, height=480)

#draw the graph
hist(x2, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()