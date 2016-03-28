library(data.table)

plot3 <- function(){
  
  hpc <- fread("household_power_consumption.txt")
  
  
  beginin<-as.Date("2007-02-01",format="%Y-%m-%d")
  end<- as.Date("2007-02-02",format="%Y-%m-%d")
  
  hpc<- subset(hpc, (as.Date(hpc$Date,format="%d/%m/%Y") >= beginin) & (as.Date(hpc$Date,format="%d/%m/%Y") <= end))
  
  ##dates<-strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
  
  plot(x=strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S"),y=as.numeric(hpc$Sub_metering_1), type="l", ylab= "Energy sub metering", xlab="")
  lines(x=strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S") ,y=as.numeric(hpc$Sub_metering_2), col="red") 
  lines(x=strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S") ,y=as.numeric(hpc$Sub_metering_3), col="blue") 
  
  legend("topright", legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col = c("black","red","blue"),lty=1,cex =0.75)
  
  dev.copy(png, file= "plot3.png")
  
  dev.off()

}
