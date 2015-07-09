##The file is in my working directory"
data<-read.table("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";")
##Pull out the desired dates
data2<-rbind(subset(data,data$Date=="1/2/2007"),subset(data,data$Date=="2/2/2007"))
##Global active power is a character, convert to numeric.
data2$Global_active_power<-as.numeric(data2$Global_active_power)
##Create new column:pasted time,date and tweak format
data2$DateTime<-paste(as.character(data2$Date),as.character(data2$Time),sep=" ")
data2$DateTime<-as.POSIXct(strptime(data2$DateTime,format="%d/%m/%Y %H:%M:%S"))
#plot it!
png("plot3.png")
plot(data2$DateTime,data2$Sub_metering_1,type="l",xlab="",ylab="Energy Sub Metering")
lines(data2$DateTime,data2$Sub_metering_2,type="l",xlab="",ylab="Energy Sub Metering", col="red")
lines(data2$DateTime,data2$Sub_metering_3,type="l",xlab="",ylab="Energy Sub Metering", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Submetering_3"),lty=c(1,1,1),col=c("black","red","blue"))
dev.off()