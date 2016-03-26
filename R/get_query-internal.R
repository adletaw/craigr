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
#' @import magrittr
#' @keywords internal
#' @export
#'
get_query <- function(query, type = "apa")
{
  ## The raw query
  raw_query <- rvest::read_html(query)

  ## The base url (for appending to listing URLs)
  base_url <- rvest::html_nodes(raw_query, ".header-logo") %>%
    extract(1) %>%
    rvest::html_attr("href")

  ## Select out the apartment ads
  raw_ads <- rvest::html_nodes(raw_query, "span.txt")

  ## Start empty vectors to hold ad data
  titles <- c()
  prices <- c()
  dates  <- c()
  urls   <- c()

  ## Loop through to make sure no data is missing
  for(i in 1:length(raw_ads)){
    ## Post title
    title <- raw_ads[i] %>%
      rvest::html_node("span#titletextonly") %>%
      rvest::html_text()

    ## Post price
    price <- try({raw_ads[i] %>%
      rvest::html_node("span.price") %>%
      rvest::html_text() %>%
      stringr::str_extract("[0-9]+") %>%
      as.numeric()
    }, silent = TRUE)

    # If there was an error, set price to NA
    if(class(price)=="try-error"){
      price <- NA
    }

    ## Post date
    date <- raw_ads[i] %>%
      rvest::html_node("time") %>%
      rvest::html_attr("datetime")

    ## Post url
    url <- raw_ads[i] %>%
      rvest::html_node("a") %>%
      rvest::html_attr("href") %>%
      paste0(base_url, .)

    ## Populate data vectors
    titles <- c(titles, title)
    prices <- c(prices, price)
    dates  <- c(dates,  date)
    urls   <- c(urls,   url)
  }

  ## Bind the data
  clean_data <- data.frame(Title = titles,
                           Price = prices,
                           Date  = dates,
                           URL   = urls)

  return(clean_data)
}