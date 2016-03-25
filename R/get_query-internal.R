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

  ## Remove everything before the first house listing
  return(raw_query)
}