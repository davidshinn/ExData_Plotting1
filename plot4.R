source('prepare_data.R')
message('--- Reading ', DATAFILE_ABRIDGED)
dt <- read.table(DATAFILE_ABRIDGED, header=TRUE, sep=";",
                 na.string="?", stringsAsFactors=FALSE)

dt$datetime <- strptime(paste(dt$Date, dt$Time),
                        '%d/%m/%Y %H:%M:%S')

draw.plots <- function() {
    par(mfrow=c(2, 2))
    plot(x=dt$datetime, y=dt$Global_active_power,
         type='l',
         xlab='', ylab='Global Active Power')
    plot(x=dt$datetime, y=dt$Voltage,
         type='l',
         xlab='datetime', ylab='Voltage',
         cex.axis=0.80)
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
           bty="n",
           cex=0.75,
           legend=c("Sub_metering_1", "Sub_metering_2",
                    "Sub_metering_3"))
    with(dt, plot(x=datetime, y=Global_reactive_power,
                  type='l', cex.lab=0.80, cex.axis=0.70))
}
message('--- Display Plots to Screen')
draw.plots()
message('--- Saving to file plot4.png')
png(filename="plot4.png")
draw.plots()
dev.off()
