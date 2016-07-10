# ---------
# DataUtils.R ... contains helper functions for working with data
# ---------


# subsetPlotData
# =========
# loads EPC data and subsets to include only 01,02 Feb 2007
# saves subset data to disk (preserving format of original EPC file)
# load all records
subsetPlot <- function () {
  # load raw data
  EPC <- read.table('household_power_consumption.txt'
                    ,header           = TRUE
                    ,sep              = ';'
                    ,stringsAsFactors = FALSE
                    ,na.strings       = '?')
  # subset to desired range
  EPC <- subset(EPC, Date == '1/2/2007' 
                   | Date == '2/2/2007')
  # write tructed table to disk
  write.table(EPC
              ,file      = 'household_power_consumption_2007_FEB_01_02.txt'
              ,row.names = FALSE
              ,sep       = ';'
              ,na        = '?')
  # side-effecting function has no return value
}


# loadPlotData
# =========
# reads EPC data; performs conversion of date and time values
# returns data frame
loadPlotData <- function (sourceFile) {
  # load raw data 
  EPC = read.table(sourceFile
                   ,header           = TRUE
                   ,sep              = ";"
                   ,stringsAsFactors = FALSE
                   ,na.strings       = "?")
  # massage textual values into dates and times
  EPC$Time <- as.POSIXlt(paste(EPC$Date,EPC$Time),format="%d/%m/%Y %H:%M:%S")
  EPC$Date <- as.Date(EPC$Date,format="%d/%m/%Y")
  # return
  EPC
} 
