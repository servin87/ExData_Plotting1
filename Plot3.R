library(lubridate)##Loads lubridate to use dmy and hms functions
##Loads data for dates of interest
data <-fread("household_power_consumption.txt", skip = 66637, nrows = 2880)
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                 "Sub_metering_3") ##Names the columns
png(filename = "Plot3.png", width = 480, height = 480) ## Calls the png device
plot(with(data, dmy(Date) + hms(Time)),data$Sub_metering_1, type="l",xlab = "", 
     ylab="Energy sub metering") ##Plots Sub_metering_1 data
##Plots Sub_metering_2 data
lines(with(data, dmy(Date) + hms(Time)),data$Sub_metering_2, col="red")
##Plots Sub_metering_3 data
lines(with(data, dmy(Date) + hms(Time)),data$Sub_metering_3, col="blue")
##Adds the legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_1"), 
       lwd= 1, col=c("black","red", "blue"))
dev.off() ##Closes the connection with the device

