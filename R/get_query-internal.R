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

  ## Select out the listing ads
  raw_ads <- rvest::html_nodes(raw_query, "p.result-info")

  ## Create data vectors
  create_vector(env = environment(),
                c("titles", "prices", "dates", "urls", "locales", "beds",
                  "sqfts"))


  ## Loop through to make sure no data is missing
  for(i in 1:length(raw_ads)){
    ## Get the current post
    post <- raw_ads[i]

    ## Post title
    title <- post %>%
      rvest::html_node("a.result-title") %>%
      rvest::html_text()

    ## Post price (returns NA if an error is generated)
    price <- na_error({
      post %>%
      rvest::html_node("span.result-price") %>%
      rvest::html_text() %>%
      stringr::str_extract("[0-9]+") %>%
      as.numeric()
    })

    ## Post date
    date <- post %>%
      rvest::html_node("time") %>%
      rvest::html_attr("datetime")

    ## Post url
    url <- post %>%
      rvest::html_node(".result-title") %>%
      rvest::html_attr("href")

    ## Approx location (returns NA if an error is generated)
    locale <- na_error({
      post %>%
      rvest::html_node(".result-hood") %>%
      rvest::html_text()
    })

    ## Post bedrooms and sqft (returns NA if an error is generated)
    size <- na_error({
      post %>%
      rvest::html_node(".housing") %>%
      rvest::html_text()
    })

    # Obtain num bedrooms (returns NA if an error is generated)
    bed <- na_error({
      size %>%
      stringr::str_extract("[0-9]*br") %>%
      stringr::str_replace("br", "")
    })

    # Obtain square footage (returns NA if an error is generated)
    sqft <- na_error({
      size %>%
      stringr::str_extract("[0-9]*ft") %>%
      stringr::str_replace("ft", "")
    })

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