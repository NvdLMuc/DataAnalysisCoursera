plot1 <- function (){
  # Plot graph 1 for Assignement 1 in course Exploratory Data Analysis
  Sys.setlocale("LC_ALL", "English")  # Required for display results in english
  
  #Read data 
  #Note: only required lines are read for this task and header information is added
  #      alternative to reading all data and selecting a subset
  body<-read.table("household_power_consumption.txt",header=FALSE,sep=";",nrows=2880,skip=66637,na.strings="?")
  hdr<- read.table("household_power_consumption.txt",header=TRUE ,sep=";",nrows=1)
  colnames(body) <- colnames(hdr)
  Data <- body

  #Create and save graph
  png(file="plot1.png",width=480,height=480)
  hist(as.numeric(Data$Global_active_power),
       xlab="Global active power (kilowatts)",
       col="red",
       main="Global active power")
  dev.off()
  
  return(0)
}

