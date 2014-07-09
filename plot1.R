source('prepare_data.R')
message('--- Reading ', DATAFILE_ABRIDGED)
dt <- read.table(DATAFILE_ABRIDGED, header=TRUE, sep=";",
                 na.string="?", stringsAsFactors=FALSE)

dt$datetime <- strptime(paste(dt$Date, dt$Time),
                        '%d/%m/%Y %H:%M:%S')
message('--- Display Histogram of Global Active Power')
hist(dt$Global_active_power,
     main='Global Active Power',
     xlab=c('Global Active Power (kilowatts)'),
     col='red')
message('--- Saving to file plot1.png')
png(filename="plot1.png")
hist(dt$Global_active_power,
     main='Global Active Power',
     xlab=c('Global Active Power (kilowatts)'),
     col='red')
dev.off()