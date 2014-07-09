source('prepare_data.R')
message('--- Reading ', DATAFILE_ABRIDGED)
dt <- read.table(DATAFILE_ABRIDGED, header=TRUE, sep=";",
                 na.string="?", stringsAsFactors=FALSE)

dt$datetime <- strptime(paste(dt$Date, dt$Time),
                        '%d/%m/%Y %H:%M:%S')
message('--- Display Energy sub metering over time')
plot(x=dt$datetime, y=dt$Sub_metering_1,
     type='l', col='black',
     ylab='Energy sub metering',
     xlab='')
lines(x=dt$datetime, y=dt$Sub_metering_2,
       type='l', col='red')
lines(x=dt$datetime, y=dt$Sub_metering_3,
      type='l', col='blue')
legend("topright",
       col=c('black', 'red', 'blue'),
       lty=c(1, 1, 1),
       legend=c("Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3"))
message('--- Saving to file plot3.png')
png(filename="plot3.png")
plot(x=dt$datetime, y=dt$Sub_metering_1,
     type='l', col='black',
     ylab='Energy sub metering',
     xlab='')
lines(x=dt$datetime, y=dt$Sub_metering_2,
      type='l', col='red')
lines(x=dt$datetime, y=dt$Sub_metering_3,
      type='l', col='blue')
legend("topright",
       col=c('black', 'red', 'blue'),
       lty=c(1, 1, 1),
       legend=c("Sub_metering_1", "Sub_metering_2",
                "Sub_metering_3"))
dev.off()