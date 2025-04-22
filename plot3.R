# Download data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "household_power_consumption.zip", mode = "wb")
unzip("household_power_consumption.zip")

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                   na.strings = "?")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
df <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
df$Datetime <- as.POSIXct(paste(df$Date, df$Time))

#Plot 3
png("plot3.png", width = 480, height = 480)
plot(df$Datetime, df$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(df$Datetime, df$Sub_metering_2, col = "red")
lines(df$Datetime, df$Sub_metering_3, col = "blue")
axis.POSIXct(1, at = seq(min(df$Datetime), max(df$Datetime), by = "1 day"), format = "%a")
legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#The x-axis wasn't showing Sat so I'm adding it manually
axis.POSIXct(1,
             at = seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-03"), by = "1 day"),
             format = "%a")
dev.off()