#' Connect to Craigslist
#'
#'@description Initialize the connection with Craigslist
#'
#'@param subdomain Character string specifying which Craigslist location you
#'want to use.  This is used as the subdomain, e.g. "seattle.craigslist.org"
#'
#' @export

connect <- function(subdomain = "seattle")
{
  url <- paste0("https://", subdomain, ".craigslist.org")

}