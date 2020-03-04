#Install required packages
#library(devtools)
#install_github("iobis/robis")
library(robis)
library(sf)

##Define Belgian part of the North Sea
#northsea_region <- "POLYGON ((2.238333 51.08931, 2.238333 51.87611, 3.370403 51.87611, 3.370403 51.08931, 2.238333 51.08931))"
##Download data from OBIS and write to file
#obis_northsea <- occurrence(geometry = northsea_region, enddepth = 10)
#write.csv(obis_northsea, file = "./data/obis_northsea_raw.csv")
obis_northsea <- read.csv("./data/obis_northsea_raw.csv")[,-1]