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

    # Transforming in a dataframe
    plot_data = as.data.frame(cbind(fit, resid))

    # Plotting with smoothing function defined by the formula of blm object
    p1 =  ggplot2::ggplot(plot_data, ggplot2::aes(x = fit, y = resid)) +  ggplot2::geom_point() +  ggplot2::geom_smooth(formula = object$formula, colour = 'red') +  ggplot2::theme_bw()
    p1 = p1 +  ggplot2::geom_hline(yintercept=0, linetype="dotted") +
    ggplot2::labs(
      x = 'Fitted values',
      y = 'Residuals',
      title = 'Residuals vs Fitted'
    )


    # Second plot: Standardized residuals vs Theoretical quantiles

    # Standardized residual:
    sd_resid = resid/sd(resid)

    # Theoretical Quantile plot:
    plot2_data = as.data.frame(cbind(resid(object), sd_resid))
    p2 = ggplot2::ggplot(plot2_data, ggplot2::aes(sample = sd_resid)) +  ggplot2::theme_bw()
    p2 = p2 + ggplot2::stat_qq() +
    ggplot2::labs(
        x = 'Theoretical Quantiles',
        y = 'Standardized residuals',
        title = 'Normal Q-Q plot'
    )
    # Third plot: Fitted values vs square root of standardized residuals
    plot3_data = as.data.frame(cbind(fit, sd_resid))
    p3 = ggplot2::qplot(plot3_data[,1], plot3_data[,2], main = 'Scale-Location', xlab = 'Fitted values', ylab='sqrt(Standardized residuals)') + ggplot2::theme_bw()


    gridExtra::grid.arrange(p1, p2,p3, ncol=2, nrow =2)

  }

  }
