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
  raw_query <- xml2::read_html(query)

  ## The base url (for appending to listing URLs)
  base_url <- rvest::html_nodes(raw_query, ".header-logo") %>%
    extract(1) %>%
    rvest::html_attr("href")

  ## Select out the apartment ads
  raw_ads <- rvest::html_nodes(raw_query, "span.txt")

  ## Start empty vectors to hold ad data
  create_vector(env = environment(),
                c("titles", "prices", "beds", "sqfts", "dates", "urls",
                  "locales")
                )

  ## Loop through to make sure no data is missing
  for(i in 1:length(raw_ads)){
    ## Post title
    title <- raw_ads[i] %>%
      rvest::html_node("span#titletextonly") %>%
      rvest::html_text()

    ## Post price (returns NA if an error is generated)
    price <- try({raw_ads[i] %>%
      rvest::html_node("span.price") %>%
      rvest::html_text() %>%
      stringr::str_extract("[0-9]+") %>%
      as.numeric()
      }, silent = TRUE)

    if(class(price == "try-error")){price <- NA}

    ## Post date
    date <- raw_ads[i] %>%
      rvest::html_node("time") %>%
      rvest::html_attr("datetime")

    ## Post url
    url <- raw_ads[i] %>%
      rvest::html_node("a") %>%
      rvest::html_attr("href") %>%
      paste0(base_url, .)

    ## Approx location (returns NA if an error is generated)
    locale <- try({
      raw_ads[i] %>%
      rvest::html_node("span.pnr small") %>%
      rvest::html_text()
    }, silent = TRUE)

    if(class(locale == "try-error")){locale <- NA}

    ## Post bedrooms and sqft (returns NA if an error is generated)
    size <- try({
      raw_ads[i] %>%
      rvest::html_node("housing") %>%
      rvest::html_text()
    }, silent = TRUE)

    if(class(size == "try-error")){size <- NA}

    if(!is.na(size)){
      # Obtain num bedrooms (returns NA if an error is generated)
      bed <- try({
        size %>%
        stringr::str_extract("[0-9]*br") %>%
        stringr::str_replace("br", "")
      }, silent = TRUE)

      if(class(bed == "try-error")){bed <- NA}

      # Obtain square footage (returns NA if an error is generated)
      sqft <- try({
        size %>%
        stringr::str_extract("[0-9]*ft") %>%
        stringr::str_replace("ft", "")
      }, silent = TRUE)

      if(class(sqft == "try-error")){sqft <- NA}
    }

    ## Populate data vectors
    titles  <- c(titles,  title)
    prices  <- c(prices,  price)
    dates   <- c(dates,   date)
    urls    <- c(urls,    url)
    locales <- c(locales, locale)
    beds    <- c(beds,    bed)
    sqfts   <- c(sqfts,   sqft)
  }

  ## Remove parens from locations
  locales <- stringr::str_replace_all(locales, "[\\)\\()]", "")


  ## Bind the data
  clean_data <- data.frame(Title    = titles,
                           Date     = dates,
                           Price    = prices,
                           Bedrooms = beds,
                           SqFt     = sqfts,
                           Location = locales,
                           URL      = urls)

  return(clean_data)
}