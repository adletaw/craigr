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
  require(magrittr)

  ## The raw query
  raw_query <- read_html(query)

  ## Get the total result count and convert to numeric
  tot_results <- raw_query %>%
    html_nodes("span.totalcount") %>%
    extract(1) %>%
    html_text() %>%
    as.numeric()

  return(tot_results)
}