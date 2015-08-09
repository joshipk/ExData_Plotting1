# define input file and it's path
hpc_file <- "./household_power_consumption.txt"

# read input data into data.frame
hpc_data <- read.table(hpc_file, header=TRUE, sep=";", stringsAsFactors=FALSE)

# select required data
hpc <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007") ,]

# concatenate date and time
datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S") 

#create numeric vectors of the required columns
gAP <- as.numeric(hpc$Global_active_power)
gRP <- as.numeric(hpc$Global_reactive_power)
voltage <- as.numeric(hpc$Voltage)
sm1 <- as.numeric(hpc$Sub_metering_1)
sm2 <- as.numeric(hpc$Sub_metering_2)
sm3 <- as.numeric(hpc$Sub_metering_3)

#define graphic device
png("plot4.png")
par(mfrow = c(2, 2)) 

# create plots
plot(datetime, gAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, sm1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, sm2, type="l", col="red")
lines(datetime, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.9, lwd=1, col=c("black", "red", "blue"), bty="n")

plot(datetime, gRP, type="l", xlab="datetime", ylab="Global_reactive_power")

# close graphic device
dev.off()