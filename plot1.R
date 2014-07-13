# Read the file into data frame df
df <- read.csv("household_power_consumption.txt",sep=";",na.strings = "?",
               as.is=T)

# Coerce Date and Time column type and format
df$Date <- as.Date(df$Date,"%d/%m/%Y")
df$Time <- strptime(paste(df$Date,df$Time),"%Y-%m-%d %H:%M:%S")

# Subset the data frame
df <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

# Open graphics device
png(file="plot1.png",height=480,width=480)

# Set parameter for multiple row - column plot
par(mfrow=c(1,1))

# Plot the graph
hist(df$Global_active_power,main = "Global Active Power",
     xlab="Global Active Power (kilowatts)",col="red")

# Close graphics device
dev.off()