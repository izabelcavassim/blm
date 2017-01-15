
#' @title Bayesian linear model.
#'
#' @description coef is inspired in the generic function of stats and extracts model coefficients from objects .
#'
#' @param object a model object of class blm for which has at least one predictor variable.
#' @param ... additional arguments.
#' @return the coefficients of the model of class blm().
#' @import stats
#' @export

# Creating the polymorphic function and adding an alias to it:
coefficients.blm <- coef.blm <- function(object, ...) t(object$coefficients)
