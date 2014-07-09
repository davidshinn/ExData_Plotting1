source('prepare_data.R')
message('--- Reading ', DATAFILE_ABRIDGED)
dt <- read.table(DATAFILE_ABRIDGED, header=TRUE, sep=";",
                 na.string="?", stringsAsFactors=FALSE)

dt$datetime <- strptime(paste(dt$Date, dt$Time),
                        '%d/%m/%Y %H:%M:%S')
message('--- Display Global Active Power over time')
plot(x=dt$datetime,
     y=dt$Global_active_power,
     type='l',
     ylab='Global Active Power (kilowatts)',
     xlab = '')
message('--- Saving to file plot2.png')
png(filename="plot2.png")
plot(x=dt$datetime,
     y=dt$Global_active_power,
     type='l',
     ylab='Global Active Power (kilowatts)',
     xlab = '')
dev.off()