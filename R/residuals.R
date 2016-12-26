#' @title Model Residuals
#'
#' @description It returns the model residuals from a blm object.
#' @parm object an blm object for which the model residual is desired.
#' @parm ... additional arguments.
#' @return residuals extracted from the blm object.
#' @import stats
#' @export
#' @seealso coefficients.blm, fitted.blm, blm, predict.blm

residuals.blm <- function(object, ...){
  observed = object$data[,1]
  x = as.data.frame(object$data[,2])
  predicted = predict(object, x)
  residuals = (observed - predicted)
  residuals
}