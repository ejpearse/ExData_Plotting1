# plot4.R

# Import and set up data

setwd("H:\\Rprojects\\Data visualisation\\Plot\\ExData_Plotting1")

Power_cons <- read.csv("H:\\Statistics Courses\\Exploratory Data Analysis\\Project 1\\household_power_consumption.txt",
                       sep=";",header=TRUE,na.strings="?",
                       colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))

Power_cons$Date2  <- as.Date(Power_cons$Date,"%d/%m/%Y") 

date3 <- (Power_cons$Date2==as.Date(c("01/02/2007"),"%d/%m/%Y")) | 
         (Power_cons$Date2==as.Date(c("02/02/2007"),"%d/%m/%Y"))

Power2 <- Power_cons[date3,]
Power2$DateTime <- strptime(paste(Power2$Date, Power2$Time), "%d/%m/%Y %H:%M:%S")

# Create Plot4.R and print to png device

png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))
fsize <- 1.0
with(Power2,plot(x=DateTime,y=Global_active_power,ylab="Global Active Power",xlab="",type="n",cex.lab=fsize))
with(Power2,lines(x=DateTime,y=Global_active_power))

with(Power2,plot(x=DateTime,y=Voltage,xlab="datetime",type="n"),cex.lab=fsize)
with(Power2,lines(x=DateTime,y=Voltage,col="black"))


with(Power2,plot(x=DateTime,y=Sub_metering_1,ylab="Energy sub metering",xlab="",type="n",cex.lab=fsize))
with(Power2,lines(x=DateTime,y=Sub_metering_1,col="black"))
with(Power2,lines(x=DateTime,y=Sub_metering_2,col="red"))
with(Power2,lines(x=DateTime,y=Sub_metering_3,col="blue"))
legend("topright", lty=1, col = c("black", "red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), bty="n")

with(Power2,plot(x=DateTime,y=Global_reactive_power,xlab="datetime",type="n",cex.lab=fsize))
with(Power2,lines(x=DateTime,y=Global_reactive_power,col="black"))
dev.off()

par(mfrow = c(1, 1))