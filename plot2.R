
## read in raw data
raw<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
                na.strings = "?", as.is = c(1,2,3,4,5,6,7,8,9))

## format Date
raw$Date2<-raw$Date

raw$Date2<-strptime(raw$Date2, format = "%d/%m/%Y")

## subset days of interest
data<-subset(raw, raw$Date2 >= '2007-02-01' & raw$Date2 <= '2007-02-02')

##remove raw data
rm(raw)

##Concatenate date and time
data$DateTime<-paste(data$Date, data$Time)

##Convert DateTime to POSIXlt format
data$DateTime<-strptime(data$DateTime, format = "%d/%m/%Y %H:%M:%S")

## set parameters
par(mfrow = c(1,1))

##Create Plot 2 to onscreen device
plot.new()
with(data, plot(DateTime ,Global_active_power, type = "l", ylab="Global Active Power (kilowatts)", xlab = "", lty=1))


##Copy plot to a png file
dev.copy(png, file= "plot2.png")


## close the PNG device
dev.off()
