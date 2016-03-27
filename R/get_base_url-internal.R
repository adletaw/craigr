#' get_base_url
#'
#' @description Create the base url based on supplied location data and
#' desired search type.
#'
#' @param location The general location of your search (e.g. "Seattle").  This
#' is used as the craigslist subdomain, (e.g. "seattle.craigslist.org).
#' @param area The specific area of your search (e.g. "tacoma"). This
#' is used to refine the search.
#' @param type What type of thing you want to look up on craiglist.  Currently
#' only apartment searches are available.  Default is \code{apa} for "apartment".
#'
#' @return base_url A character string containing the base url upon which
#' queries will be added.
#'
#' @keywords internal
#' @export
#'
get_base_url <- function(location, area, type = "apa")
{
  ## Generate the base url
  if(area == "all"){
    return(paste0("https://", location, ".craigslist.org/search/", type))
  } else {
    return(paste0("https://", location, ".craigslist.org/search/", area, "/",
                  type))
  }
}