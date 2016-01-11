## getting the data
dataP1<-read.csv("household_power_consumption.txt", colClasses = "character", sep=";")
library(lubridate)
#dataP11<-dataP1[(as.Date(dataP1$Date)=="01-02-2007" | as.Date(dataP1$Date)=="02-02-2007"), ]
dataP11<-dataP1[((as.Date(dataP1$Date)=="01-02-2007" | as.Date(dataP1$Date)=="02-02-2007")) & !is.na(dataP1$Global_active_power), ]
dP1<-as.numeric(as.character(dataP11$Global_active_power))
## creating my plot1
#windows(7, 10)
hist(dP1, col = "red" , main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", sub=" ", col.main="black", col.lab="black", col.sub="black")
## Copy my plot1 to a PNG file
library(datasets)
dev.copy(png, file = "plot1.png")
dev.off()