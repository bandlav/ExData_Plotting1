plot3<-function(){
  tf<-read.csv2('household_power_consumption.txt') 
  tf1<-subset(tf,Date=='1/2/2007')
  tf2<-subset(tf,Date=='2/2/2007')
  tf1$Time<-as.character(tf1$Time)
  tf2$Time<-as.character(tf2$Time)
  tf1$Time<-as.POSIXct(tf1$Time,format='%H:%M:%S')
  tf2$Time<-as.POSIXct(tf2$Time,format='%H:%M:%S')+86400
  tff<-rbind(tf1,tf2)
  #tff$Date<-as.character(tff$Date)
  #tff$Time<-as.character(tff$Time)
  tff$Global_active_power<-as.character(tff$Global_active_power)
  tff$Global_reactive_power<-as.character(tff$Global_reactive_power)
  tff$Voltage<-as.character(tff$Voltage)
  tff$Global_intensity<-as.character(tff$Global_intensity)
  tff$Sub_metering_1<-as.character(tff$Sub_metering_1)
  tff$Sub_metering_2<-as.character(tff$Sub_metering_2)
  tff$Sub_metering_3<-as.character(tff$Sub_metering_3)
  
  plot(tff$Time,tff$Sub_metering_1,type='n',xlab='',ylab='Energy sub metering')
  points(tff$Time,tff$Sub_metering_1,type='l')
  points(tff$Time,tff$Sub_metering_2,type='l',col='red')
  points(tff$Time,tff$Sub_metering_3,type='l',col='blue')
  legend('topright',pch=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
  
  dev.copy(png,file='plot3.png')
  dev.off()
}