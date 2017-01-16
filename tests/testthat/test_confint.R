
context("confint")

test_that("confidence intervals of blm approximates lm", {

  # Creating an example
  n = 100
  x = rnorm(n)
  y = rnorm(n, mean = 3*x)
  model <- y ~ x

  #Using alpha and beta as 1
  test_blm = blm(model, alpha = 1, beta = 1)
  test_lm = lm(model)

  expect_equal(confint(test_blm, parm = 'x')[1], confint(test_lm, parm = 'x')[1], tolerance = 0.05)
  expect_equal(confint(test_blm, parm = 'x')[2], confint(test_lm, parm = 'x')[2], tolerance = 0.05)
  expect_equal(confint(test_blm, parm = '(Intercept)')[1], confint(test_lm, parm = '(Intercept)')[1], tolerance = 0.06)
  expect_equal(confint(test_blm, parm = '(Intercept)')[2], confint(test_lm, parm = '(Intercept)')[2], tolerance = 0.06)
  expect_error(confint(test_blm, parm = 'y')[1], NA)
})

