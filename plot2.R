# define input file and it's path
hpc_file <- "./household_power_consumption.txt"

# read input data into data.frame
hpc_data <- read.table(hpc_file, header=TRUE, sep=";", stringsAsFactors=FALSE)

# select required data
hpc <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007") ,]

#create numericc vector of the required column
gAP <- as.numeric(hpc$Global_active_power)

# concatenate date and time
datetime <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S") 

#define graphic device
png("plot2.png")

# create plot
plot(datetime, gAP, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# close graphic device
dev.off()