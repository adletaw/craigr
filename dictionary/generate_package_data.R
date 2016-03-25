## Generate the Craigslist dictionary data for use in R package

craigs_places <- read.csv("dictionary/places.csv", stringsAsFactors = FALSE)

## Write to system data
devtools::use_data(craigs_places, internal = TRUE, overwrite = TRUE)
