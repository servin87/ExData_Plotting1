library(lubridate) ##Loads lubridate to use dmy and hms functions
##Loads data for dates of interest
data <-fread("household_power_consumption.txt", skip = 66637, nrows = 2880)
names(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", 
                 "Sub_metering_3") ##Names the columns
png(filename = "Plot4.png", width = 480, height = 480) ## Calls the png device
par(mfcol=c(2,2)) ##Creates a 2x2 grid for the plots
plot(with(data, dmy(Date) + hms(Time)),data$Global_active_power, type="l",xlab = "", 
     ylab="Global Active Power") ##Adds plot 1,1
plot(with(data, dmy(Date) + hms(Time)),data$Sub_metering_1, type="l",xlab = "", 
     ylab="Energy sub metering") ##Adds plot 2,1 (sub_metering_1 data)
##Adds Sub_metering_2 data to plot 2,1
lines(with(data, dmy(Date) + hms(Time)),data$Sub_metering_2, col="red")
##Adds Sub_metering_3 data to plot 2,1
lines(with(data, dmy(Date) + hms(Time)),data$Sub_metering_3, col="blue")
##Adds the legent to plot 2,1
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_1"), 
       lwd= 1, col=c("black","red", "blue"), bty ="n")
##Adds plot 1,2
plot(with(data, dmy(Date) + hms(Time)),data$Voltage, type="l",xlab = "datetime", 
     ylab="Voltage")
##Adds plot 2,2
plot(with(data, dmy(Date) + hms(Time)),data$Global_reactive_power, type="l",xlab = "datetime", 
     ylab="Global_reactive_power")
dev.off() ##Closes the connection with the device
