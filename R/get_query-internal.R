#' get_query
#'
#' @description Query Craigslist and clean the scrape data
#'
#' @param query The URL specifying the query
#' @param type What type of thing you want to look up on craiglist.  Currently
#' only apartment searches are available.  Default is \code{apa} for "apartment".
#'
#' @return
#'
#' @keywords internal
#' @export
#'
get_query <- function(query, type = "apa")
{
  require(rvest)

  ## The raw query
  raw_query <- read_html(query)

  ## Select out the apartment ads
  raw_ads <- html_nodes(raw_query, "span.txt")

  # ## Get the titles
  titles_raw   <- html_nodes(raw_ads, "span#titletextonly")
  titles_clean <- html_text(titles_raw)

  ## Get the prices
  prices_raw   <- html_nodes(raw_ads, "span.price")
  prices_clean <- html_text(prices_raw)

  ## Get the post date
  dates_raw   <- html_nodes(raw_ads, "time")
  dates_clean <- c()
  for(i in 1:length(dates_raw)){
    dates_clean[i] <- html_attr(dates_raw[i], "datetime")
  }

  ## Get the url
  urls_raw   <- html_nodes(raw_ads, "a")
  urls_clean <- c()
  for(i in 1:length(urls_raw)){
    urls_clean[i] <- html_attr(urls_raw[i], "href")
  }

  ## Bind the data
  clean_data <- data.frame(Title = titles_clean,
                           Price = prices_clean,
                           Date  = dates_clean,
                           URL   = urls_clean)

  return(clean_data)
}