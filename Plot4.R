# ---------
# Plot4.R ... generates a plot pf plots of all the readings by time in the EPC data set
#         ... renders plot pf plots to disk as a PNG file named 'Plot4.png'
# ---------
# load source data
EPC <- read.table('../household_power_consumption.txt'
                  ,header           = TRUE
                  ,sep              = ';'
                  ,stringsAsFactors = FALSE
                  ,na.strings       = '?')
# subset to desired range
EPC <- subset(EPC, Date == '1/2/2007' 
                 | Date == '2/2/2007')
# massage textual values into dates and times
EPC$Time <- as.POSIXlt(paste(EPC$Date,EPC$Time),format="%d/%m/%Y %H:%M:%S")
EPC$Date <- as.Date(EPC$Date,format="%d/%m/%Y")
# render to PNG
png(filename = "Plot4.png")
par(mfrow = c(2,2)) # layout 4 plots in a 2x2 square
with(EPC, {
  # upper left
  plot(Time, Global_active_power
       ,type = 's'
       ,xlab = ""
       ,ylab = "Global Active Power (kilowatts)")
  # upper right
  plot(Time, Voltage
        ,type = 's'
        ,xlab = "datetime"
        ,ylab = "Voltage")
  # lower left
  plot(Time, Sub_metering_1
       ,type = 'S'
       ,xlab = ""
       ,ylab = "Energy sub metering")
  lines(Time, Sub_metering_2
        ,col = 'red'  )
  lines(Time, Sub_metering_3
        ,col = 'blue' )
  legend("topright"
         ,legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
         ,col    = c('black','red','blue')
         ,lty    = 1
         ,lwd    = 1.5
         ,bty    = 'n')
  #lower right
  plot(Time, Global_reactive_power
        ,type = 'l'
        ,xlab = "datetime")
})
dev.off()
