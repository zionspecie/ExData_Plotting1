#Download and unzip
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "household_power_consumption.zip", mode = "wb")
unzip("household_power_consumption.zip")

# Read and preprocess
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE,
                   na.strings = "?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
df <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
df$Datetime <- strptime(paste(df$Date, df$Time), "%Y-%m-%d %H:%M:%S")

#Create Plot 1
png("plot1.png", width = 480, height = 480)
hist(df$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.off()
