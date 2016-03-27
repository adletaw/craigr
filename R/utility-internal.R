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
create_vector <- function(env = environment(), names){
  for(i in 1:length(names)){
    assign(names[i],
           vector(),
           envir = env)
  }
  return(invisible())
}

#' Errors to NA
#'
#' @description If an object contains an error, return NA
#'
#' @param obj Object to check for an error
#'
#' @keywords internal
#' @export
#'
na_error <- function(obj){
  # Try the code
  if(class(obj) == "try_error"){
    return(NA)
  } else{
    return(obj)
  }
}