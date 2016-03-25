## Generate the Craigslist dictionary data for use in R package

craigs_places <- read.csv("dictionary/places.csv", stringsAsFactors = FALSE)

save(craigs_places, file = "data/craigs_places.rda")