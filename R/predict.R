
#' @title Model prediction
#' @description Predict is inspired by the generic function from stats and make predictions based on the fitted blm model object.
#'
#' @param object a model object of class blm for which prediction is desired.
#' @param ... additional data (explanatory variables) in data.frame format that affects the predictions. If ommited, the fitted values are used.
#' @return If additional data is provided, it gives the predicted values by evaluating the regression function. Otherwise, it gives the predictions based on the data used to fit the model
#' @import stats
#' @export

# Creating polymorphic function predict
predict.blm <- function(object, ...) {
  arguments = list(...)

  formula = object$formula
  posterior = object$posterior
  beta = object$beta

  theta_x = noresponse_matrix(formula, ...)

  # Generalizing theta for old and new data (using '...' method)
  m_xy = posterior$m_xy
  S_xy = posterior$S_xy

  # Dealing with many data points:
  means = vector(length = nrow(theta_x))

  for(i in seq_along(means)){
    means[i] = sum(t(m_xy) %*% theta_x[i,])
  }

  # Making the output in the same way as lm
  names(means) = seq(1, length(means))

  return(means)
}

noresponse_matrix <- function(model, ...){
  responseless = delete.response(terms(model))

  data_frame = model.frame(responseless, ...)

  res = model.matrix(responseless, data_frame)
  return(res)
}