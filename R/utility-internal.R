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
    return(invisible)
  }
}