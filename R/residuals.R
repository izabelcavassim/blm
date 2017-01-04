#' @title Model Residuals
#'
#' @description It returns the model residuals from a blm object.
#' @param object an blm object for which the model residual is desired.
#' @param ... additional arguments.
#' @return residuals extracted from the blm object.
#' @import stats
#' @export
#' @seealso coefficients.blm, fitted.blm, blm, predict.blm

# Something is wrong with my residuals, it seems to be always positive
residuals.blm <- function(object, ...){
  observed = object$data[,1]
  x = as.data.frame(object$data[,2])
  predicted = predict(object, x)
  residuals = (observed - predicted)
  residuals
}