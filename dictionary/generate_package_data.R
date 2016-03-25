## Generate the Craigslist dictionary data for use in R package

craigs_places <- read.csv("places.csv", stringsAsFactors = FALSE)

save(craigs_places, file = "../data/craigs_places.rda", verbose = TRUE)