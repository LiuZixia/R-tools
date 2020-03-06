#install.packages("finch")
library("finch")
#Read this! https://github.com/ropensci/finch/blob/master/README.md
download.file(
  "http://ipt.vliz.be/eurobis/archive.do?r=sahfos-cpr-phyto&v=1.1",
  "./data/dwca-sahfos-cpr-phyto-v1.1.zip"
)
dwca_raw <-
  dwca_read("./data/dwca-sahfos-cpr-phyto-v1.1.zip", read = TRUE)
dwca_raw$files
dwca_raw$emlmeta

obis_northsea_phytoplankton <-
  obis_northsea[which(obis_northsea$scientificNameID %in% phytoplankton_species), ]