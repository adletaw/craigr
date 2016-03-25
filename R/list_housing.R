#' List housing
#'
#' @description Get a list of housing available on craiglist using your own
#' specifications
#'
#' @param city Character string containing the city you want to look in. Default
#' is "Seattle".
#' @param key Optional character string containing a search term to filter
#' results.
#' @param price_min Optional numeric containing minimum price.
#' @param price_max Optional numeric containing maximum price.
#' @param sqft_min Optional numeric containing minimum square footage.
#' @param sqft_max Optional numeric containing maximum square footage.
#'
#' @export

list_housing <- function(location = "Seattle", area = "all", base_url = NULL,
                         query = NULL, bedrooms = NULL, bathrooms = NULL,
                         min_price = NULL, max_price = NULL,
                         min_sqft = NULL, max_sqft = NULL,
                         has_pic = FALSE, posted_today = FALSE,
                         pets_cat = FALSE, pets_dog = FALSE)
{
  ## Load in the dictionary of craigslist locations
  # load("R/sysdata.rda")

  ## Generate the base url based on specified location and area
  ## If "base_url" is specified, this section will be skipped
  if(missing("base_url"))
  {
    base_url <- get_base_url(location, area)
  }

  ## Generate the query based on supplied parameters
  # Vector to whold query components
  queries <- c("?")

  # Generate queries
  if(!(missing(query))){
    queries <- c(queries, paste0("query=", query))
  }
  if(!(missing(bedrooms))){
    queries <- c(queries, paste0("bedrooms=", bedrooms))
  }
  if(!(missing(bathrooms))){
    queries <- c(queries, paste0("bathrooms=", bathrooms))
  }
  if(!(missing(min_price))){
    queries <- c(queries, paste0("min_price=", min_price))
  }
  if(!(missing(max_price))){
    queries <- c(queries, paste0("max_price=", max_price))
  }
  if(!(missing(min_sqft))){
    queries <- c(queries, paste0("minSqft=", min_sqft))
  }
  if(!(missing(max_sqft))){
    queries <- c(queries, paste0("maxSqft=", max_sqft))
  }
  if(has_pic){
    queries <- c(queries, "hasPic=1")
  }
  if(posted_today){
    queries <- c(queries, "postedToday=1")
  }
  if(pets_cat){
    queries <- c(queries, "pets_cat=1")
  }
  if(pets_dog){
    queries <- c(queries, "pets_dog=1")
  }

  # Add queries to url
  if(length(queries) > 1){
    query_url <- paste0(base_url,
                        queries[1],
                        paste(queries[2:length(queries)], collapse = "&"))
  } else{
    query_url <- base_url
  }

  ## Scrape and clean the results of the query
  query_results <- get_query(query_url)

  return(query_results)
}