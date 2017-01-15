context("print")

test_that("print is giving an output", {
  library(ggplot2)
  # Creating an example
  n = 100
  x = rnorm(n)
  y = rnorm(n, mean = 3*x)
  model <- y ~ x

  test_blm = blm(model, alpha = 3, beta = 3.3)
  expect_error(print(test_blm), NA)
})