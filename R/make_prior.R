
#' @title Make the Prior Distribution
#'
#' @description It takes the model description and the prior precision alpha to build the prior distribution.
#'
#' @param model A formula describing the model.
#' @param alpha The prior precision, the hyperparameter of Prior Distribution.
#' @param ... additional data.
#' @return The mean and covariance matrix.
#' @export

make_prior <- function(model, alpha, ...){
  arguments = list(...)
  if (alpha < 0) stop('alpha must be positive and explicitly declared!')

  model = model.matrix(model)
  return(list(m_xy = rep(0, ncol(model)), S_xy = diag(1/alpha, nrow = ncol(model))))
}

