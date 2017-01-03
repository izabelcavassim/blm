
#' @title Bayesian linear model.
#'
#' @description Fits a model, given as a formula, optionally with data provided through the "..." parameter.
#'
#' @param model   a formula describing the model.
#' @param ...     additional data.
#'
#' @return a fitted model.
#' @export
# Creating the class blm

blm <- function(model, ...) {
  arguments = list(...)
  alpha = arguments$alpha
  beta = arguments$beta
  prior = make_prior(model, alpha,...) # it returns alpha
  posterior = update(model, prior, beta, ...)

  # Defining the class blm
  obj <- list(data = model.frame(model),
              variances = posterior$S_xy,
              prior = prior,
              alpha = alpha,
              beta = beta,
              posterior = posterior,
              formula = model,
              sys = sys.call(),
              coefficients = posterior$m_xy)
  class(obj) <- 'blm'
  obj
}

