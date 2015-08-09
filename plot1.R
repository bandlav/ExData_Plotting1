plot1<-function(){
  tf<-read.csv2('household_power_consumption.txt') 
  tf1<-subset(tf,Date=='1/2/2007')
  tf2<-subset(tf,Date=='2/2/2007')
  tff<-rbind(tf1,tf2)
  tff$Date<-as.character(tff$Date)
  tff$Time<-as.character(tff$Time)
  tff$Global_active_power<-as.character(tff$Global_active_power)
  tff$Global_reactive_power<-as.character(tff$Global_reactive_power)
  tff$Voltage<-as.character(tff$Voltage)
  tff$Global_intensity<-as.character(tff$Global_intensity)
  tff$Sub_metering_1<-as.character(tff$Sub_metering_1)
  tff$Sub_metering_2<-as.character(tff$Sub_metering_2)
  tff$Sub_metering_3<-as.character(tff$Sub_metering_3)
  
  hist(as.numeric(tff$Global_active_power),xlab='Global Active Power (kilowatts)',col='red',main='Global Active Power')
  dev.copy(png,file='plot1.png')
  dev.off()
}