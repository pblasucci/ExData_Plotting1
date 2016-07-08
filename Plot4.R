EPC <- read.table('household_power_consumption_2007_FEB_01_02.txt'
                  ,header = TRUE
                  ,sep = ';'
                  ,na.strings = '?'
                  ,stringsAsFactors = FALSE)

EPC$Time <- as.POSIXlt(paste(EPC$Date,EPC$Time),format = "%d/%m/%Y %H:%M:%S")
EPC$Date <- as.Date(EPC$Date, format = "%d/%m/%Y")

png(filename = "Plot4.png")
par(mfrow = c(2,2))

with(EPC, {
  plot(Time, Global_active_power
       ,type = 's'
       ,xlab = ""
       ,ylab = "Global Active Power")
  
  plot(Time, Voltage
       ,type = 's'
       ,xlab = "datetime"
       ,ylab = "Voltage")
  
  plot(Time, Sub_metering_1
       ,type = 's'
       ,xlab = ""
       ,ylab = "Energy sub metering")
  lines(Time, Sub_metering_2, col = 'red'  )
  lines(Time, Sub_metering_3, col = 'blue' )
  legend("topright"
         ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
         ,col = c('black','red','blue')
         ,lty = 1
         ,lwd = 1.5
         ,bty = 'n')
  
  plot(Time, Global_reactive_power
       ,type = 'l'
       ,xlab = "datetime")
})

dev.off()