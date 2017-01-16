context('Residuals')

test_that("residual values of blm approximate lm values", {

  # Creating an example
  n = 100
  x = rnorm(n)
  y = rnorm(n, mean = 3*x)
  model <- y ~ x

  test_blm = blm(model, alpha = 3, beta = 3.3)
  test_lm = lm(model)

  #print(residuals(test_blm))
  #print(residuals(test_lm))
  expect_equal(residuals(test_blm), residuals(test_lm), tolerance = 0.1)

})
