library("readr") ##Loads library "readr" to use function fread
##Loads only the data for the dates of interest
data <-fread("household_power_consumption.txt", skip = 66637, nrows = 2880)
##Assigns names to the columns
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global_intensity", "Sub_metering_1", "
                 Sub_metering_2", "Sub_metering_3")
png(filename = "Plot1.png", width = 480, height = 480) ## Calls the png device
hist(data$Global_active_power, breaks = 12, xlab = "Global Active Power (kilowatts)",
main = "Global Active Power", col = "red") ##Creates the histogram
dev.off() ##Closes the connection with the device
