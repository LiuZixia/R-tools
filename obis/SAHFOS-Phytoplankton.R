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

#install.packages("devtools")
#devtools::install_github("GBIF-Europe/darwinator")
#Read this! https://rdrr.io/github/GBIF-Europe/darwinator/f/vignettes/introduction.Rmd
library(darwinator)
