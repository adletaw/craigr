#' get_num_results
#'
#' @description Find out how many results are available for the search
#'
#' @param query The URL specifying the query
#'
#' @return
#'
#' @keywords internal
#' @export
#'
get_num_results <- function(query)
{
  require(rvest)

  ## The raw query
  raw_query <- read_html(query)
}