# Forked and cloned the repository /ExData_Plotting1
# Set the working directory to the project directory

setwd("C:/Users/Arvin/Desktop/EDA-assignments/Assignment1/EDA-Assignment1")

# Reading in the data : household_power_consumption.txt file 

EnergyData<-read.table ("C:/Users/Arvin/Desktop/EDA-assignments/household_power_consumption.txt", 
stringsAsFactors = FALSE, header = TRUE, sep = ";", dec=".")

#Check the number of observations=2075259 and 9 variables and the class of the observations
summary(EnergyData)
str(EnergyData)

# Changing the classes of the columns to appropriate class

EnergyData$Date<- as.POSIXct(EnergyData$Date, format= "%Y-%m-%d")
EnergyData$Time <- as.POSIXct(EnergyData$Time, format= "%H:%M:%S")
EnergyData$Global_active_power <-as.numeric(EnergyData$Global_active_power, na.strings= "?")
EnergyData$Global_reactive_power<- as.numeric(EnergyData$Global_reactive_power, na.strings= "?")
EnergyData$Voltage<- as.numeric (EnergyData$Voltage, na.strings= "?")
EnergyData$Global_intensity <-as.numeric (EnergyData$Global_intensity)
EnergyData$Sub_metering_1<- as.numeric (EnergyData$Sub_metering_1)
EnergyData$Sub_metering_2<- as.numeric (EnergyData$Sub_metering_2)

 summary(EnergyData)

# Selecting the subset of data corresponding to 2 days (02/01/2007 and 02/02/2007)
# for data analysis; The subset data will be called EnergyData_subset
EnergyData_sub<-subset(EnergyData, Date== "2007-02-01" | Date== "2007-02-02")
summary(EnergyData_sub)

# Creating histogram for the EnergyData_sub datasetand variable Global Active
# Power.


hist(EnergyData_sub$Global_active_power, col="red", xlab= "Global Active Power(killowatts)", 
ylab= "Frequency", main= "Global Active Power")


plot1<- function() {
     png(filename= "Plot1.png", width=480, height=480)
     hist(EnergyData_sub$Global_active_power, col="red", border="black", breaks=10,
     main= "Global Active Power", xlab= "Global Active Power (KW)", ylab= "Frequency")
     dev.off()
}