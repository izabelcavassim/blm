context("confint")

test_that("fitted values of blm approximate lm values", {
  #set.seed(100)

  # Creating an example
  n = 1000
  x = rnorm(n)
  z = rnorm(n)
  predictors = data.frame(x, z)
  y = with(predictors, rnorm(n, mean = 3*x + 5*z + 2))
  model <- y ~ x + z

  test_blm = blm(model, alpha = 3, beta = 3.5)
  test_lm = lm(model)

  expect_equal(fitted(test_blm), fitted(test_lm), tolerance = 0.08)

})

