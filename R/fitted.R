#' @title Model fitted
#' @description fitted is inspired by the generic function from stats which extracts fitted values (response)
#'
#' @param object a model object of class blm for which the extraction of model fitted values is desired.
#' @param ... additional data.
#' @return fitted values extracted from the object model of class blm.
#' @import stats
#' @export

# You can only input the old data here, the newdata will be ignored in the predict function
fitted.blm <- function(object, ...) {
  fit <- predict(object)
  fit
}
