# ---------
# Plot1.R ... generates a histogram of the Global Active Power in the EPC data set
#         ... renders histogram to disk as a PNG file named 'Plot1.png'
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
png(filename = "Plot1.png")
with(EPC, {
  hist(Global_active_power
        ,col  = "red"
        ,main = "Gloabl Active Power"
        ,xlab = "Global Active Power (kilowatts)")  
})
dev.off()
