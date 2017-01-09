context("confint")

test_that("fitted values of blm approximate lm values", {
  set.seed(100)

  # Creating an example
  n = 100
  x = rnorm(n)
  y = rnorm(n, mean = 3*x)
  model <- y ~ x

  test_blm = blm(model, alpha = 3, beta = 3.5)
  test_lm = lm(model)

  expect_equal(fitted(test_blm), fitted(test_lm), tolerance = 0.1)

})

