
#' Bayesian linear model.
#'
#' coef is inspired in the generic function of stats and extracts model coefficients from objects .
#'
#' @param object a model object of class blm for which has at least one predictor variable.
#' @param ... additional arguments.
#' @return fitted arguments of the model (the point estimates of predictors).
#' @import stats
#' @export

# Creating the polymorphic function and adding an alias to it:
coefficients.blm <- coef.blm <- function(object, ...) t(object$coefficients)
