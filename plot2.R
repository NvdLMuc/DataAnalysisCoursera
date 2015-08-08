plot2 <- function (){
  # Plot graph 2 for Assignement 1 in course Exploratory Data Analysis
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
  png(file="plot2.png",width=480,height=480)
  plot(Data$Timestamp,as.numeric(Data$Global_active_power),
       xlab="",
       ylab="Global active power (kilowatts)",
       col="black",
       type="l",
       lty=1,
       pch=NA,
       main="Global active power")
  dev.off()
 
  return(0)
}


