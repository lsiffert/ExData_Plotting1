## This function has the purpose of reading data from household power consumption file
## and creating a line plot of data between 01 and 02 (comprised) Feb 2007

makePlot2 <- function() {
    ## Reading data from csv file
    myData<-read.csv("Documents/household_power_consumption.txt",sep=";")
    ## Converting data
    myData$Time<-strptime(paste(myData$Date,myData$Time),'%d/%m/%Y %H:%M:%S')
    myData$Date<-as.Date(myData$Date,'%d/%m/%Y')
    ## Subsetting data to the selected dates
    mySubsetData<-subset(myData, Date>='2007-02-01' & Date<= '2007-02-02')
    ## Converting data into numeric (to draw plot it's better)
    mySubsetData$Global_active_power<-as.numeric(as.character(mySubsetData$Global_active_power))
    ## Open png file for writing plot
    png(filename='plot2.png')
    ## Creating plot
    plot(mySubsetData$Time,mySubsetData$Global_active_power,type='l', ylab='Global Active Power (kilowatts)',xlab='')
    ## Closing png file and saving
    dev.off()
    
}