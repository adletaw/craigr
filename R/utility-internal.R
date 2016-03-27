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
#' @param env The environment in which the vectors should be created
#' @param names A chracter vector of names of vectors to create
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

#' Convert errors to NA
#'
#' @description Given an expression, try to evaluate and return NA if there is
#' an error.
#'
#' @param expr The expression to evaluate
#'
#' @keywords internal
#' @export
#'
na_error <- function(expr){
  ## Try the expression
  try_it <- try(expr, silent = TRUE)

  if(class(try_it) == "try-error"){
    ## Return NA if there is an error
    return(NA)
  } else{
    ## Return the output of the expression if there is no error
    return(try_it)
  }
}