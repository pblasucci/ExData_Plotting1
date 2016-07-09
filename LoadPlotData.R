# load all records
EPC <- read.table('household_power_consumption.txt'
                  ,header = TRUE
                  ,sep = ';'
                  ,na.strings = '?'
                  ,stringsAsFactors = FALSE)
# subset to desired range
EPC <- subset(EPC, Date == "1/2/2007" | Date == "2/2/2007")
# write tructed table to disk
write.table(EPC
            ,file = "household_power_consumption_2007_FEB_01_02.txt"
            ,row.names = FALSE
            ,sep = ';'
            ,na = '?')