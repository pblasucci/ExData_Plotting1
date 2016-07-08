EPC <- read.table('household_power_consumption_2007_FEB_01_02.txt'
                  ,header = TRUE
                  ,sep = ';'
                  ,na.strings = '?'
                  ,stringsAsFactors = FALSE)


EPC$Time <- as.POSIXlt(paste(EPC$Date,EPC$Time),format = "%d/%m/%Y %H:%M:%S")
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")

#png(filename = "Plot2.png")
plot(EPC$Time, EPC$Global_active_power
     ,type = 's'
     ,main = ""
     ,xlab = ""
     ,ylab = "Global Active Power (kilowatts)")
#dev.off()