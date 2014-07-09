# This script downloads the source file and saves a file
# with only the two dates of interest as DATAFILE_ABRIDGED.
# Script only runs if DATAFILE_ABRIDGED does not already exists
# If the file exists but is corrupt, delete the file and rerun this script

URL = 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
DESTFILE = 'exdata_data_household_power_consumption.zip'
DATAFILE = 'household_power_consumption.txt'
DATAFILE_ABRIDGED = 'household_power_consumption_abridged.txt'

if (!file.exists(DATAFILE_ABRIDGED)) {
    message('--- ', DATAFILE_ABRIDGED, ' not found, downloading ', DESTFILE)
    download.file(URL, DESTFILE, method='curl')
    message('--- Extracting ', DATAFILE, ' from ', DESTFILE)
    unzip(DESTFILE)
    message('--- Reading unfiltered data from ', DATAFILE)
    dt <- read.table(DATAFILE, header=TRUE, sep=";",
                     na.strings="?", stringsAsFactors=FALSE)
    message('--- Keep only 2007-02-01 and 2007-02-02')
    dt <- dt[dt$Date == "1/2/2007" | dt$Date == "2/2/2007",]
    message('--- Writing to ', DATAFILE_ABRIDGED)
    write.table(dt, DATAFILE_ABRIDGED,
                row.names=FALSE, na="?",
                sep=";")
} else {
    message('--- ', DATAFILE_ABRIDGED, ' already exists,')
    message('    no action needed.  Delete ', DATAFILE_ABRIDGED)
    message('    to force a new prepared file.')
}