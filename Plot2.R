# ---------
# Plot2.R ... generates a step plot of the Global Active Power by Time in the EPC data set
#         ... renders step plot to disk as a PNG file named 'Plot2.png'
# ---------
source('DataUtils.R')
EPC <- loadPlotData('household_power_consumption_2007_FEB_01_02.txt')

png(filename = "Plot2.png")
with(EPC, {
  plot(Time, Global_active_power
        ,type = 's'
        ,xlab = ""
        ,ylab = "Global Active Power (kilowatts)")
})
dev.off()
