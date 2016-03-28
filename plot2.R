library(data.table)

plot2 <- function(){
  
  hpc <- fread("household_power_consumption.txt")
  
  
  beginin<-as.Date("2007-02-01",format="%Y-%m-%d")
  end<- as.Date("2007-02-02",format="%Y-%m-%d")
  
  hpc<- subset(hpc, (as.Date(hpc$Date,format="%d/%m/%Y") >= beginin) & (as.Date(hpc$Date,format="%d/%m/%Y") <= end))
  
  ##dates<-strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
  
  plot(x=strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S"),y=as.numeric(hpc$Global_active_power), type="l", ylab= "Global Active Power (kilowatts)", xlab="")
  
  dev.copy(png, file= "plot2.png")
  
  dev.off()

}
