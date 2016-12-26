#' @title Model Deviance
#'
#' @description It returns the deviance of a fitted blm model object.
#' @parm object an blm object for which deviance is desired.
#' @parm ... additional arguments.
#' @return The deviance value from the object of class blm.
#' @import stats
#' @export

deviance.blm <- function(object, ...){
  observed = object$data[,1]
  fit = fitted(object)
  dev = (fit - observed)^2
  sum(dev)
}