plot3 <- function (){
  # Plot graph 3 for Assignement 1 in course Exploratory Data Analysis
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
  png(file="plot3.png",width=480,height=480)
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
  dev.off()
  
  return(0)
}
