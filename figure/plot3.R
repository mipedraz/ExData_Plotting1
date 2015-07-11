#reading in data 
mydata<-read.table("Downloads/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
mydate<-mydata$Date
mydate1<-as.Date(mydate, "%d/%m/%Y")
index<-which(mydate1=="2007-02-01" | mydate1== "2007-02-02")
myData<-mydata[66637:69516, ]
myData$Time<-strptime(myData$Time, format="%H:%M:%S")
myData$Global_active_power<-as.numeric(as.character(myData$Global_active_power))
#plot3
png("plot3.png", width=480, height=480)
plot(myData$Sub_metering_1, type="l", xaxt='n', ylab="Enery Submetering", xlab="")
lines(myData$Sub_metering_2, type="l", xaxt='n', col="red")
lines(myData$Sub_metering_3, type="l", xaxt='n', col="blue")
axis(side=1,  at=c(0, 1450, 2900), labels=c("Thu", "Fri", "Sat"))
legend("topright", lty=1 , col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
