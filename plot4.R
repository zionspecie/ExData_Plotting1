# plot4.png
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# Plot 1
plot(df$Datetime, df$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power", xaxt = "n")
#The x-axis wasn't showing Sat so I'm adding it manually
axis.POSIXct(1,
             at = seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-03"), by = "1 day"),
             format = "%a")
# Plot 2
plot(df$Datetime, df$Voltage, type = "l",
     xlab = "datetime", ylab = "Voltage", xaxt = "n")
axis.POSIXct(1,
             at = seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-03"), by = "1 day"),
             format = "%a")
# Plot 3
plot(df$Datetime, df$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", xaxt = "n")
lines(df$Datetime, df$Sub_metering_2, col = "red")
lines(df$Datetime, df$Sub_metering_3, col = "blue")
axis.POSIXct(1,
             at = seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-03"), by = "1 day"),
             format = "%a")
legend("topright", bty = "n", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4
plot(df$Datetime, df$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power", xaxt = "n")
#The x-axis wasn't showing Sat so I'm adding it manually
axis.POSIXct(1,
             at = seq(as.POSIXct("2007-02-01"), as.POSIXct("2007-02-03"), by = "1 day"),
             format = "%a")
dev.off()
