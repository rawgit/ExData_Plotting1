# Read the data file into dta frame df
df <- read.csv("household_power_consumption.txt",sep=";",
               na.strings="?",as.is=T)

# Coerce Date and Time column type and format
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- strptime(paste(df$Date,df$Time),"%Y-%m-%d %H:%M:%S")

# Subset the data frame
df <- df[with(df,Date <= "2007-02-02" & Date >= "2007-02-01"),]

# Open graphics device
png(file="plot3.png",height=480,width=480)

# Set parameter for multiple row - column plot
par(mfrow=c(1,1))

# Plot the graph and add components - lines and legend
with(df,plot(Time,Sub_metering_1,xlab="",ylab="Energy sub metering",typ="l"))
with(df,lines(Time,Sub_metering_2,col="red"))
with(df,lines(Time,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1))

# Close graphics device
dev.off()