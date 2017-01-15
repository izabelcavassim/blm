#' @title Model print
#'
#' @description It prints the called function and the coefficients of a blm model object.
#' @param x an blm object for which print is desired.
#' @param ... additional arguments.
#' @return The linear function used and coefficients of an object of class "blm".
#' @import stats
#' @export

# Print gives/print the called function and the coefficients
print.blm <- function(x, ...){
  cat('\nCall:\n')
  print(x$sys)

  cat('\nCoefficients:\n')
  t(x$coefficients)
}