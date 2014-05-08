## This function has the purpose of reading data from household power consumption file
## and creating a line plot of data between 01 and 02 (comprised) Feb 2007

makePlot3 <- function() {
    ## Reading data from csv file
    myData<-read.csv("Documents/household_power_consumption.txt",sep=";")
    ## Converting data
    myData$Time<-strptime(paste(myData$Date,myData$Time),'%d/%m/%Y %H:%M:%S')
    myData$Date<-as.Date(myData$Date,'%d/%m/%Y')
    ## Subsetting data to the selected dates
    mySubsetData<-subset(myData, Date>='2007-02-01' & Date<= '2007-02-02')
    ## Converting data into numeric (to draw plot it's better)
    mySubsetData$Global_active_power<-as.numeric(mySubsetData$Global_active_power)
    ## Open png file for writing plot
    png(filename='plot3.png')
    ## Creating plot
    plot(mySubsetData$Time,mySubsetData$Sub_metering_1,type='l', ylab='Energy sub metering',xlab='')
    lines(mySubsetData$Time,mySubsetData$Sub_metering_2,col='red',type='l')
    lines(mySubsetData$Time,mySubsetData$Sub_metering_3,col='blue',type='l')
    legend("topright",c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lty=c(1,1,1),cex=0.8)
    ## Closing png file and saving
    dev.off()
    
}