# Download and read 13-14 dispute resolution data
setwd("~/Documents/github/dispute_resolution_data")
url.name <- "http://www2.ed.gov/programs/osepidea/618-data/state-level-data-files/part-b-data/dispute-resolution/bdispres2012-13.csv"
download.file(url.name, destfile = "dr_12_13.csv", method = "curl")

dr <- read.csv("dr_12_13.csv", stringsAsFactors = FALSE, skip = 4, nrows = 61)