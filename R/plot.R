#' @title Plot blm x
#'
#' @description It returns different plots of x blm
#' @param x an blm x for which the plots are desired.
#' @param ... additional arguments.
#' @return plot of Residuals vs Fitted values.
#' @import ggplot2
#' @import gridExtra
#' @export
#' @seealso blm, fitted.
plot.blm <- function(x, ...) {
  data = x$data

  # First plot: fitted values vs residuals
  fit = fitted(x)
  resid = residuals(x)

  # Transforming in a dataframe
  plot_data = as.data.frame(cbind(fit, resid))

  # Plotting with smoothing function defined by the formula of blm x
  p1 =  ggplot2::ggplot(plot_data, ggplot2::aes(x = fit, y = resid)) +  ggplot2::geom_point() +  ggplot2::geom_smooth(formula = x$formula, colour = 'red') +  ggplot2::theme_bw()
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
  plot2_data = as.data.frame(cbind(resid(x), sd_resid))

  y <- quantile(plot2_data$sd_resid[!is.na(plot2_data$sd_resid)], c(0.25, 0.75))
  predictor <- qnorm(c(0.25, 0.75))
  slope <- diff(y)/diff(predictor)
  int <- y[1L] - slope * predictor[1L]

  p2 = ggplot2::ggplot(plot2_data, ggplot2::aes(sample = sd_resid)) +  ggplot2::theme_bw()
  p2 = p2 + ggplot2::stat_qq()
  p2 = p2 +  ggplot2::geom_abline(intercept=int, linetype="dotted", slope = slope) +
  ggplot2::labs(
      x = 'Theoretical Quantiles',
      y = 'Standardized residuals',
      title = 'Normal Q-Q plot'
  )

  # Third plot: Y x X
  plot3_data = as.data.frame(x$data)
  p3 = ggplot2::qplot(plot3_data[,2], plot3_data[,1], main = 'Regression Model', xlab = 'Predictor (x)', ylab='Response (y)') + ggplot2::theme_bw() +  ggplot2::geom_smooth(formula = x$formula, colour = 'red')

  # Fourth plot: histogram of residuals
  p4 = qplot(resid, geom="histogram", bins = 40) +  ggplot2::theme_bw() + ggplot2::labs(
    x = 'Residual',
    y = 'Density',
    title = 'Histogram of Residuals'
  )


  gridExtra::grid.arrange(p1, p2,p3, p4, ncol=2, nrow =2)


  }
