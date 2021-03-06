# plot2.R

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

# Create Plot2.R and print to png device

png(filename = "plot2.png",
    width = 480, height = 480, units = "px")
with(Power2,plot(x=DateTime,y=Global_active_power,ylab="Global Active Power (kilowatts)",xlab="",type="n"))
with(Power2,lines(x=DateTime,y=Global_active_power))
dev.off()
