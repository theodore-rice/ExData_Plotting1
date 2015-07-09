##The file is in my working directory"
data<-read.table("household_power_consumption.txt",na.strings="?",header=TRUE,sep=";")
##Pull out the desired dates
data2<-rbind(subset(data,data$Date=="1/2/2007"),subset(data,data$Date=="2/2/2007"))
##Global active power is a character, convert to numeric.
data2$Global_active_power<-as.numeric(data2$Global_active_power)
##Plot and save a a PNG
png("plot1.png")
hist(data2$Global_active_power,xlab="Global Active Power (kilowats)",col="red",main="Global Active Power")
dev.off()