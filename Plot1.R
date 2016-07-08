EPC <- read.table('household_power_consumption_2007_FEB_01_02.txt'
                  ,header = TRUE
                  ,sep = ';'
                  ,na.strings = '?'
                  ,stringsAsFactors = FALSE)

EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")
EPC$Time <- strptime(EPC$Time, format = "%H:%M:%S")

png(filename = "Plot1.png")
hist(EPC$Global_active_power
     ,col = "red"
     ,main = "Gloabl Active Power"
     ,xlab = "Global Active Power (kilowatts)")
dev.off()
