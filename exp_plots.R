# Use clean_dr.R script to download and read in 13-14 data

setwd("~/Documents/github/dispute_resolution_data")

# bar plot of total due process complaints by state
barplot(dr$Due.Process.Complaints..DPC..Total..3., names.arg = dr$State,
        las = 2, cex.names = .6)

# box plot of total due process complaints by state
boxplot(log(dr$Due.Process.Complaints..DPC..Total..3.))

# Plot 3 panels showing outcomes of total due process complaints per state

# plot of total due process hearings and resulting in res meeting and settlement
ca <- subset(dr, State == "California")
ny <- subset(dr, State == "New York")
pdf(file = "dpc1.pdf", height = 10, width = 5)
op <- par() ## original par settings
par(mfrow = c(3, 1))
plot(dr$Due.Process.Complaints..DPC..Total..3., dr$DPC.Resolution.Meetings...Written.Settlement.Agreements..3.1a.,
     col = rgb(238, 130, 238, alpha = 128, maxColorValue = 255),
     pch = 16,
     cex = 2, 
     xlim = c(0, max(dr$DPC.Resolution.Meetings.Total..3.1.)), ylim = c(0, max(dr$DPC.Resolution.Meetings.Total..3.1.)),
     xlab = "", ylab = "")
title(main = "Total Complaints v. Written Settlements in 12-13",
      xlab = "Total Due Process Complaints", ylab = "Written Settlement Agreements")
text(ca$Due.Process.Complaints..DPC..Total..3., ca$Written..Signed.Complaints..WSC..Total..1.,
     labels = "California", pos = 3, offset = .75)
text(ny$Due.Process.Complaints..DPC..Total..3., ny$Written..Signed.Complaints..WSC..Total..1.,
     labels = "New York", pos = 3, offset = .75)

# plot of total due process hearings and number of ajudicated cases
plot(dr$Due.Process.Complaints..DPC..Total..3., dr$DPC.Hearings..fully.adjudicated..Total..3.2.,
     col = rgb(238, 130, 238, alpha = 128, maxColorValue = 255),
     pch = 16,
     cex = 2, 
     xlim = c(0, max(dr$DPC.Resolution.Meetings.Total..3.1.)), ylim = c(0, max(dr$DPC.Resolution.Meetings.Total..3.1.)),
     xlab = "", ylab = "")
title(main = "Total Complaints v. Fully Ajudicated Cases in 12-13",
      xlab = "Total Due Process Complaints", ylab = "Fully Ajudicated Cases")
text(ca$Due.Process.Complaints..DPC..Total..3., ca$DPC.Hearings..fully.adjudicated..Total..3.2.,
     labels = "California", pos = 3, offset = .75)
text(ny$Due.Process.Complaints..DPC..Total..3., ny$DPC.Hearings..fully.adjudicated..Total..3.2.,
     labels = "New York", pos = 3, offset = .75)

# plot of total due process hearings and number withdrawn or dismissed
plot(dr$Due.Process.Complaints..DPC..Total..3., dr$DPC.Withdrawn.or.Dismissed..3.4.,
     col = rgb(238, 130, 238, alpha = 128, maxColorValue = 255),
     pch = 16,
     cex = 2, 
     xlim = c(0, max(dr$DPC.Resolution.Meetings.Total..3.1.)), ylim = c(0, max(dr$DPC.Resolution.Meetings.Total..3.1.)),
     xlab = "", ylab = "")
title(main = "Total Complaints v. Withdrawn or Dismissed Cases in 12-13",
      xlab = "Total Due Process Complaints", ylab = "Withdrawn or Dismissed Cases")
text(ca$Due.Process.Complaints..DPC..Total..3., ca$DPC.Withdrawn.or.Dismissed..3.4.,
     labels = "California", pos = 3, offset = .75)
text(ny$Due.Process.Complaints..DPC..Total..3., ny$DPC.Withdrawn.or.Dismissed..3.4.,
     labels = "New York", pos = 3, offset = .75)
dev.off()

par(op) ## reset par() to original settings