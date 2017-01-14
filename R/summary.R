#' @title blm Summary
#'
#' @description It is inpired by the generic and lm function 'summary' and it aims to format and summarize the statistical outputs from an object of class 'blm'.
#' @param object an blm object for which summary is desired.
#' @param ... additional arguments.
#' @return MAKE HERE IN MORE DETAIL.
#' @import stats
#' @export

summary.blm <- function(object, ...) {
  sapply(object$data, summary)
  cat('\nCall:\n')
  print(object$sys)

  cat('\nResiduals:\n')
  print(summary(residuals(object)))
  #sapply(object$residuals, summary)

  cat('\nCoefficients:\n')
  print(object$coefficients)

  # Finding out if the coefficients are significant or not
  # If 0 is outside the coefficient effect CI then we can conclude that we had
  # a significant effect
  coefs = row.names(coef(object))

  # I have decided just to check its significance in 5% alpha level
  test_significance = function(coefs, object){
  stars_sig = NULL
  for( i in 1:length(coefs)){
    CI = confint(object, parm = i)
    if(prod(CI) > 0){
      stars_sig[i] = '*'
    }
    else{
      stars_sig[i] = ' '
    }

  }
  return(stars_sig)
  }

  sigs = test_significance(coefs, object)
  cat('\nCoefficient Significance (0.05)\n')
  for(i in 1:length(coefs)){
    cat(sprintf("\"%s\" \"%s\"\n", coefs[i], sigs[i]))

  }
  cat('Adjusted R-squared:\n')

  # Defining the class blm
  obj <- list(data = object,
              sys = object$sys,
              residuals = residuals(object),
              coefficients = coef(object),
              significance = sigs)
  obj

}