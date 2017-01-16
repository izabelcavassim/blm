context('deviance')

test_that('blm Deviance approximates lm deviance', {

  # Creating an example
  n = 100
  x = rnorm(n)
  y = rnorm(n, mean = 3*x)
  model <- y ~ x

  test_blm = blm(model, alpha = 1, beta = 1)
  test_lm = lm(model)

  expect_equal(deviance(test_blm), deviance(test_lm), tolerance = 0.08)

  })