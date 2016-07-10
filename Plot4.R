# ---------
# Plot4.R ... generates a plot pf plots of all the readings by time in the EPC data set
#         ... renders plot pf plots to disk as a PNG file named 'Plot4.png'
# ---------
source('DataUtils.R')
EPC <- loadPlotData('household_power_consumption_2007_FEB_01_02.txt')

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
