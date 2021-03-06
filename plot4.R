#######Draw Plot 4
##1. Load data from file
data1 <- read.csv("household_power_consumption.txt", sep =";", header = T, na.strings = "?", nrows =2075259, check.names = F, stringsAsFactors = F, comment.char = "", quote='\"')
##2. Convert column date
data1$Date <- as.Date(data1$Date, format ="%d/%m/%Y")
##3. Get subset data 
myData <- subset(data1, subset= (Date >= "2007-02-01"  & Date <= "2007-02-02"))
##4.Remove old data  
rm(data1)
##5. Convert dates
myDateTime <- paste(as.Date(myData$Date), myData$Time)
myData$Datetime <- as.POSIXct(myDateTime)

##6. Draw plot 4
par(mfrow= c(2,2),mar = c(4,4,2,1), oma = c(0,0,2,0))
with(myData, { 
  plot(Global_active_power ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  plot(Voltage ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "datetime")
  plot(Sub_metering_1 ~ Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = "Red")
  lines(Sub_metering_3 ~ Datetime, col = "Blue")
  legend ("topright", lty = 1, col= c("black","blue","red" ), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type = "l", ylab = "Global Recctive Power (kilowatts)", xlab = "")
})
##7. Copy to file
dev.copy(png, file = "plot4.png")
dev.off()
#7. Remove  myData, myDateTime in environment
rm(myData)
rm(myDateTime)