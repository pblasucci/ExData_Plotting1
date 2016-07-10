# ---------
# Plot1.R ... generates a histogram of the Global Active Power in the EPC data set
#         ... renders histogram to disk as a PNG file named 'Plot1.png'
# ---------
source('DataUtils.R')
EPC <- loadPlotData('household_power_consumption_2007_FEB_01_02.txt')

png(filename = "Plot1.png")
with(EPC, {
  hist(Global_active_power
        ,col  = "red"
        ,main = "Gloabl Active Power"
        ,xlab = "Global Active Power (kilowatts)")  
})
dev.off()
