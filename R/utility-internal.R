#' Check parameter class
#'
#' @description Check the class of a supplied parameter to make sure it matches
#' expectations.
#'
#' @keywords internal
#' @export
#'
check_class <- function(param, expect_class){
  if(class(param)!=expect_class){
    stop(paste("must be of class", expect_class, sep = " "))
  } else{
    return(invisible())
  }
}

#' Create empty vectors
#'
#' @description Create any number of empty vectors and assign them to the parent
#' environment.
#'
#' @param ... Names for any number of vectors to create
#'
#' @keywords internal
#' @export
#'
create_vector <- function(...){
  for(i in 1:length(list(...))){
    assign(...[[i]],
           vector(),
           envir = parent.env(environment()))
  }
  return(invisible())
}