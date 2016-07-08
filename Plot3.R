EPC <- read.table('household_power_consumption_2007_FEB_01_02.txt'
                  ,header = TRUE
                  ,sep = ';'
                  ,na.strings = '?'
                  ,stringsAsFactors = FALSE)

EPC$Time <- as.POSIXlt(paste(EPC$Date,EPC$Time),format = "%d/%m/%Y %H:%M:%S")
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")

png(filename = "Plot3.png")
plot(EPC$Time, EPC$Sub_metering_1
     ,type = 'S'
     ,xlab = ""
     ,ylab = "Energy sub metering")
lines(EPC$Time, EPC$Sub_metering_2, col = 'red'  )
lines(EPC$Time, EPC$Sub_metering_3, col = 'blue' )
legend("topright"
       ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       ,col = c('black','red','blue')
       ,lty = 1
       ,lwd = 1.5)
dev.off()
