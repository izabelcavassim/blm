#' @title Model print
#'
#' @description It prints the called function and the coefficients of a blm model object.
#' @parm object an blm object for which print is desired.
#' @parm ... additional arguments.
#' @return The linear function used and coefficients of an object of class "blm".
#' @import stats
#' @export

# Print gives/print the called function and the coefficients
print.blm <- function(object, ...){
  cat('\nCall:\n')
  print(object$sys)

  cat('\nCoefficients:\n')
  t(object$coefficients)
}