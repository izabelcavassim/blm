
#' @title Model confint.
#'
#' @description Confint is inspired by stats function and computes the confidence intervals for the fitted arguments of a blm model.
#'
#' @param object a model object of class blm for which has at least one predictor variable.
#' @param parm a specified parameter/argument from the model to be extracted the confidence intervals. It could be numbers (columns of the model data.frame) or names: 'y', 'x', 'z'...
#' @param level the confidence level required, which quantiles are extracted in the base of: c(level/2, 1-level/2).
#' @param ... additional arguments.
#' @return It will returns the lower and upper confidence intervals of each parameter given.
#' @import stats
#' @export

noresponse_matrix <- function(model, ...){
  responseless = delete.response(terms(model))

  data_frame = model.frame(responseless, ...)

  res = model.matrix(responseless, data_frame)
  return(res)
}

confint.blm <- function(object, parm, level= 0.95, ...) {
  theta_x = noresponse_matrix(object$formula, ...)
  beta = object$beta
  S_xy = object$posterior$S_xy
  m_xy = object$posterior$m_xy

  if(parm == 'y'){

    # Calculating Standard deviation to be used in qnorm
    sds = vector(length = nrow(theta_x))

    for(i in seq_along(sds)){
      S_xxy = 1/beta + (t(theta_x[i,]) %*% S_xy %*% theta_x[i,])
      sds[i] = sqrt(S_xxy)
    }

    fitted = predict(object, ...)
    quantil_lower = qnorm(p = (1-level)/2, mean = fitted, sd = sds, lower.tail = F)
    quantil_upper = qnorm(p = (1 - (1 -level)/2), mean = fitted, sd = sds, lower.tail = F)

    quantiles = cbind(quantil_lower, quantil_upper)
    colnames(quantiles) = c((1-level)/2, (1 - (1 -level)/2))

    # it returns the confint of the fitted data
    return(quantiles)
  }

  # Other coefficients than 'y'
  if(is.null(parm)){
    parm = rownames(object$coefficients)
  }

  quantil_lower = qnorm(p = (1-level)/2, mean = m_xy[parm,], sd = sqrt(diag(S_xy)[parm]), lower.tail = F)
  quantil_upper = qnorm(p = (1 - (1 -level)/2), mean =m_xy[parm,], sd = sqrt(diag(S_xy)[parm]), lower.tail = F)

  quantiles = cbind(quantil_lower, quantil_upper)

  colnames(quantiles) = c((1-level)/2, (1 - (1 -level)/2))
  rownames(quantiles) = parm
  return(quantiles)
}

