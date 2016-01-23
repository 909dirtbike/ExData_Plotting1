
## read in raw data
raw<-read.table("./household_power_consumption.txt", header = TRUE, sep = ";", 
                na.strings = "?", as.is = c(1,2,3,4,5,6,7,8,9))

## format Date
raw$Date<-strptime(raw$Date, format = "%d/%m/%Y")

## subset days of interest
data<-subset(raw, raw$Date >= '2007-02-01' & raw$Date <= '2007-02-02')

##remove raw data
rm(raw)

## set parameters
par(mfrow = c(1,1))

##Create Plot 1 to onscreen device
with(data, hist(Global_active_power, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)"))

##Copy plot to a png file
dev.copy(png, file= "plot1.png")

## close the PNG device
dev.off()

