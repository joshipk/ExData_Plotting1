# define input file and it's path
hpc_file <- "./household_power_consumption.txt"

# read input data into data.frame
hpc_data <- read.table(hpc_file, header=TRUE, sep=";", stringsAsFactors=FALSE)

# select required data
hpc <- hpc_data[hpc_data$Date %in% c("1/2/2007","2/2/2007") ,]

#create numericc vector of the required column
gAP <- as.numeric(hpc$Global_active_power)

#define graphic device
png("plot1.png")

# create plot
hist(gAP, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# close graphic device
dev.off()