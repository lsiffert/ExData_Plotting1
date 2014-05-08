## This function has the purpose of reading data from household power consumption file
## and creating an histogram plot of data between 01 and 02 (comprised) Feb 2007

makePlot1 <- function() {
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
    png(filename='plot1.png')
    ## Creating plot
    hist(mySubsetData$Global_active_power/1000,col='red',main='Global Active Power', xlab='Global Active Power (kilowatts)', breaks=seq(0,4,by=0.25))
    ## Closing png file and saving
    dev.off()
    
}