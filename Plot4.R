# Forked and cloned the repository /ExData_Plotting1
# Set the working directory to the project directory

setwd("C:/Users/Arvin/Desktop/EDA-assignments/Assignment1/EDA-Assignment1")

# Reading in the data : household_power_consumption.txt file 

EnergyData<-read.table ("C:/Users/Arvin/Desktop/EDA-assignments/household_power_consumption.txt", 
                        stringsAsFactors = FALSE, header = TRUE, sep = ";", dec=".")


#Check the number of observations=2075259 and 9 variables and the class of the observations
summary(EnergyData)
str(EnergyData)

#Combining the date and time columns for further analysis and creating a new column.
DateTime <- strptime(paste(EnergyData$Date, EnergyData$Time, sep= " "), "%d/%m/%Y %H:%M:%S")
EnergyData<- cbind(EnergyData, DateTime)

# Changing the classes of the columns to appropriate class

EnergyData$Date<- as.POSIXct(EnergyData$Date, format= "%d/%m/%Y")
EnergyData$Time <- as.POSIXct(EnergyData$Time, format= "%H:%M:%S")
EnergyData$Global_active_power <-as.numeric(EnergyData$Global_active_power, na.strings= "?")
EnergyData$Global_reactive_power<- as.numeric(EnergyData$Global_reactive_power, na.strings= "?")
EnergyData$Voltage<- as.numeric (EnergyData$Voltage, na.strings= "?")
EnergyData$Global_intensity <-as.numeric (EnergyData$Global_intensity)
EnergyData$Sub_metering_1<- as.numeric (EnergyData$Sub_metering_1)
EnergyData$Sub_metering_2<- as.numeric (EnergyData$Sub_metering_2)

 summary(EnergyData)
 str(EnergyData)
 
 # Selecting the subset of data corresponding to 2 days (02/01/2007 and 02/02/2007)
# for data analysis; The subset data will be called EnergyData_subset
EnergyData_sub<-subset(EnergyData, Date== "2007-02-01" | Date== "2007-02-02")
summary(EnergyData_sub)

str(EnergyData_sub)

#Creating Plot4

par(mfrow= c(2,2))
with(EnergyData_sub, plot(DateTime, Global_active_power, type="h", xlab="", ylab="Global Active Power"))
with(EnergyData_sub, plot(DateTime, Voltage, type="h", xlab="Date-Time", ylab="Voltage"))
with(EnergyData_sub, plot(EnergyData_sub$DateTime, EnergyData_sub$Sub_metering_1, type="o", xlab="", ylab="Energy sub metering"))
lines(EnergyData_sub$DateTime, EnergyData_sub$Sub_metering_2, type="o", col="red")
lines(EnergyData_sub$DateTime, EnergyData_sub$Sub_metering_3, type="o", col="blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"))
with(EnergyData_sub, plot(DateTime, Global_reactive_power, type="o", xlab="DateTime", ylab="Global_reactive_power"))

