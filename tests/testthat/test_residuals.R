context('Residuals')

test_that("residual values of blm approximate lm values", {
  #set.seed(100)

  # Creating an example
  n = 10
  x = rnorm(n)
  y = rnorm(n, mean = 3*x)

  test_blm = blm(y ~ x, alpha = 3, beta = 3.3)
  test_lm = lm(y ~ x)

  print(residuals(test_blm))
  print(residuals(test_lm))
  expect_equal(residuals(test_blm), residuals(test_lm), tolerance = 0.08)

})
