#' @title blm Summary
#'
#' @description It is inpired by the generic and lm function 'summary' and it aims to format and summarize the statistical outputs from an object of class 'blm'.
#' @param object an blm object for which summary is desired.
#' @param ... additional arguments.
#' @return MAKE HERE IN MORE DETAIL.
#' @import stats
#' @export

summary.blm <- function(object, ...) {
  sapply(object$data, summary)
  cat('\nCall:\n')
  print(object$Call)

  cat('\nResiduals:\n')
  print(summary(object$Residuals))
  #sapply(object$residuals, summary)

  cat('\nCoefficients:\n')
  print(object$Coefficients)
  print('Estimate, Std error, t value, Pr(>|t|)')

  cat('\nResidual standard error, numberX, on numberZ degrees of freedom\n')
  cat('\nMultiple R-squared:\n')
  cat('Adjusted R-squared:\n')

}