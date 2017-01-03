
#' @title Bayesian linear model.
#'
#' @description Fits a model, given as a formula, optionally with data provided through the "..." parameter.
#'
#' @param model A formula describing the model.
#' @param prior The prior distribution (mean and variance)
#' @param alpha Hyperparameter of prior distribution.
#' @param beta Hyperparameter of posterior distribution.
#' @param ...     Additional data, for example a new data frame.
#' @return A fitted model.
#' @import stats
#' @export
# Creating the class blm

update <- function(model, prior, alpha, beta, ...){
  arguments = list(...)

  if(alpha < 0 || beta  < 0) stop('alpha and beta must be positive and explicitly declared!')

  data = model.frame(model)
  theta_x = noresponse_matrix(model)
  S_xy = solve(prior$S_xy + beta * t(theta_x) %*% theta_x)
  m_xy = beta * S_xy %*% t(theta_x) %*% y
  return(list(m_xy=m_xy, S_xy=S_xy))

}

noresponse_matrix <- function(model, ...){
  responseless = delete.response(terms(model))

  data_frame = model.frame(responseless, ...)

  res = model.matrix(responseless, data_frame)
  return(res)
}