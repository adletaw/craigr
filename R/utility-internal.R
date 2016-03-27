#' Check parameter class
#'
#' @description Check the class of a supplied parameter to make sure it matches
#' expectations.
#'
#' @param param The parameter to check the class of
#' @param expect_class Character string containing the name of the class
#' expected for \code{param}.
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

#' Errors to NA
#'
#' @description If a code chunk leads to an error, return NA
#'
#' @param ...Code to try
#'
#' @keywords internal
#' @export
#'
na_errors <- function(expr){
  # Try the code
  try_it <- try({expr}, silent = TRUE)

  # Check for an error
  if(class(try_it=="try-error")){
    # Return NA if an error is found
    return(NA)
  } else{
    # Return code output if error not found
    return(try_it)
  }
}