#' @title Plot blm object
#'
#' @description It returns different plots of object blm
#' @param object an blm object for which the plots are desired.
#' @param ... additional arguments.
#' @return plot of Residuals vs Fitted values.
#' @export
#' @seealso blm, fitted.
plot.blm <- function(object, ...) {
  data = object$data

  if(is.null(data) == FALSE && ncol(data) == 2){

    # First plot: fitted values vs residuals
    fit = fitted(object)
    resid = residuals(object)

    #plot(fit, resid, pch = 20, xlab = 'Fitted values', ylab = 'Residuals', main = 'Residuals vs Fitted')
    #abline(h = 0, col = "gray60", lty = 2)
    # Transforming in a dataframe
    #plot_data = as.data.frame(cbind(fit, resid))

    # Plotting with smoothing function defined by the formula of blm object
    p1 = ggplot(plot_data, aes(x = fit, y = resid)) + geom_point() + geom_smooth(formula = object$formula, colour = 'red') + theme_bw()
    p1 = p1 + geom_hline(yintercept=0, linetype="dotted") +
    labs(
      x = 'Fitted values',
      y = 'Residuals',
      title = 'Residuals vs Fitted'
    )

    return(p1)

    # p2: Standardized residuals vs Theoretical quantiles

    # Standardized residual:
    sd_resid = resid/sd(resid)

    # Theoretical Quantile plot:
    qqplot(resid(test_blm), sd_resid, xlab = 'Theoretical Quantiles', ylab = 'Standardized residuals', main = 'Normal Q-Q plot')
  }
  if(is.null(data) == FALSE && ncol(data) > 2){
    # I DONT KNOW YET
  }
}