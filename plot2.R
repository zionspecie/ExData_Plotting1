# Download data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "household_power_consumption.zip", mode = "wb")
unzip("household_power_consumption.zip")

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
df <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
# Use POSIXlt instead of POSIXct
df$Datetime <- as.POSIXct(paste(df$Date, df$Time))

#Plot 2
png("plot2.png", width = 480, height = 480)
plot(df$Datetime, df$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)", xaxt = "n")

#The x-axis wasn't showing Sat so I'm adding it manually
axis.POSIXct(1,
             at = seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-03"), by = "1 day"),
             format = "%a")
dev.off()