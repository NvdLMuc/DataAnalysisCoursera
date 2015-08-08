plot4 <- function (){
  # Plot graph 4 for Assignement 1 in course Exploratory Data Analysis
  Sys.setlocale("LC_ALL", "English")  # Required for display results in english
  
  #Read data 
  #Note: only required lines are read for this task and header information is added
  #      alternative to reading all data and selecting a subset
  body<-read.table("household_power_consumption.txt",header=FALSE,sep=";",nrows=2880,skip=66637,na.strings="?")
  hdr<- read.table("household_power_consumption.txt",header=TRUE ,sep=";",nrows=1)
  colnames(body) <- colnames(hdr)
  
  # Process time information to POSIXct
  Timestamp <- strptime(mapply( paste0,body$Date,body$Time),"%d/%m/%Y %T ")
  Data <- cbind(Timestamp=Timestamp,body[,3:ncol(body)])
  
  #Create and save graph (Days of weeks are shown in local language, e.g. german)    

  png(file="plot4.png",width=480,height=480)  
  par(mfrow=c(2,2)) 
  # plot topleft
  plot(Data$Timestamp,as.numeric(Data$Global_active_power),
       xlab="",
       ylab="Global active power",
       col="black",
       type="l",
       lty=1,
       pch=NA)
  
  # plot topright
  plot(Data$Timestamp,as.numeric(Data$Voltage),
       xlab="datetime",
       ylab="Voltage",
       col="black",
       type="l",
       lty=1,
       pch=NA)
  
  # plot bottomleft
  plot(Data$Timestamp,as.numeric(Data$Sub_metering_1),
       type="n",xlab="",ylab="Energy sub metering",main="") 
  lines(Data$Timestamp,as.numeric(Data$Sub_metering_1),
        col="black",
        type="l",
        lty=1,
        pch=NA)
  lines(Data$Timestamp,as.numeric(Data$Sub_metering_2),
        col="red",
        type="l",
        lty=1,
        pch=NA)
  lines(Data$Timestamp,as.numeric(Data$Sub_metering_3),
        col="blue",
        type="l",
        lty=1,
        pch=NA)  
  legend("topright",pch=NA,lty=1,
         col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  # plot bottomright
  plot(Data$Timestamp,as.numeric(Data$Global_reactive_power),
       xlab="datetime",
       ylab="Global_reactive_power",
       col="black",
       type="l",
       lty=1,
       pch=NA)
  dev.off()
  
  return(0)
}
