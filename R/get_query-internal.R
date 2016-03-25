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
  require(magrittr)

  ## The raw query
  raw_query <- read_html(query)

  ## Select out the apartment ads
  raw_ads <- html_nodes(raw_query, "span.txt")

  ## Loop through to make sure no data is missing
  for(i in 1:length(raw_ads)){
    ## Post title
    title <- raw_ads[i] %>%
      html_node("span#titletextonly") %>%
      html_text()

    ## Post price
    price <- raw_ads[i] %>%
      html_node("span.price") %>%
      html_text() %>%
      string::str_extract("[0-9]+") %>%
      as.numeric()

    ## Post date
    date <- raw_ads[i] %>%
      html_node("time") %>%
      html_attr("datetime")

    ## Post url
    url <- raw_ads[i] %>%
      html_node("a") %>%
      html_attr("href")
  }

  ## Bind the data
  clean_data <- data.frame(Title = titles_clean,
                           Price = prices_clean,
                           Date  = dates_clean,
                           URL   = urls_clean)

  return(clean_data)
}