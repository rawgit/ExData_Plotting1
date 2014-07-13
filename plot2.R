# Read the data file into data frame df
df <- read.csv("household_power_consumption.txt",sep=";",
               na.strings="?",as.is=T)

# Coerce Date and Time column types and format
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- strptime(paste(df$Date,df$Time),"%Y-%m-%d %H:%M:%S")

# Subset the frame
df <- df[with(df,Date <= "2007-02-02" & Date >= "2007-02-01"),]

# Open graphics device
png(file="plot2.png",height=480,width=480)

# Set parameter for multiple row - column plot
par(mfrow=c(1,1))

# Plot the line graph
with(df,plot(Time,Global_active_power,xlab="",
             ylab="Global Active Power (kilowatts)",typ="l"))

# Close graphics device
dev.off()