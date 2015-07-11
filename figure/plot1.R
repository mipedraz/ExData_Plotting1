#reading in data 
mydata<-read.table("Downloads/household_power_consumption.txt", sep=";", header=TRUE, na.strings="?")
mydate<-mydata$Date
mydate1<-as.Date(mydate, "%d/%m/%Y")
index<-which(mydate1=="2007-02-01" | mydate1== "2007-02-02")
myData<-mydata[66637:69516, ]
myData$Time<-strptime(myData$Time, format="%H:%M:%S")
myData$Global_active_power<-as.numeric(as.character(myData$Global_active_power))
#plot 1: histogram of global active power
png("plot1.png", width=480, height=480)
hist(myData$Global_active_power, col="red", main= "Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()

