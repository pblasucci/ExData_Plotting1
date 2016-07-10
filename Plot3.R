# ---------
# Plot3.R ... generates a step plot of the 3 sub meter readings by time in the EPC data set
#         ... renders step plot to disk as a PNG file named 'Plot3.png'
# ---------
source('DataUtils.R')
EPC <- loadPlotData('household_power_consumption_2007_FEB_01_02.txt')

png(filename = "Plot3.png")
with(EPC, {
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
        ,lwd    = 1.5)  
})
dev.off()
