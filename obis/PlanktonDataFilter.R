library("finch")

#Import the phytoplankton species list from CPR-Phyto
dwca_raw <-
  dwca_read("./data/dwca-sahfos-cpr-phyto-v1.1.zip", read = TRUE)
dwca_raw_data <- as.data.frame(dwca_raw$data)
phytoplankton_species <- levels(factor(dwca_raw_data$occurrence.txt.scientificNameID))[-1]

#Use the CPR-Phyto list to filter the OBIS Belgium Northsea dataset
obis_northsea <- data.frame(read.csv("./data/obis_northsea_raw.csv")[, -1],stringsAsFactors = FALSE)
obis_northsea$scientificNameID <- as.character(obis_northsea$scientificNameID)
obis_northsea_phytoplankton <-
  obis_northsea[which(obis_northsea$scientificNameID %in% phytoplankton_species), ]
write.csv(obis_northsea_phytoplankton, file = "./data/obis_northsea_phytoplankton_raw.csv")
phytoplankton_species_northsea_id <- levels(factor(obis_northsea_phytoplankton$scientificNameID))
phytoplankton_species_northsea_name <- levels(factor(obis_northsea_phytoplankton$scientificName))
