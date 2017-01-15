
context("coefficients")

test_that("coefficients are printed as expected", {

  # Creating an example
  n = 100
  x = rnorm(n)
  y = rnorm(n, mean = 3*x)
  model <- y ~ x

  #Using alpha and beta as 1
  test_blm = blm(model, alpha = 1, beta = 1)
  test_lm = lm(model)

  expect_equal(names(coef(test_blm)[1,1]), "(Intercept)")
  expect_equal(names(coef(test_blm)[1,2]), "x")
})

test_that("blm coefs approximates lm coefs", {
  # Creating an example
  n = 100
  x = rnorm(n)
  y = rnorm(n, mean = 3*x)
  model <- y ~ x

  #Using alpha and beta as 1
  test_blm = blm(model, alpha = 1, beta = 1)
  test_lm = lm(model)

  coef_blm = as.numeric(coef(test_blm))
  coef_lm = as.numeric(coef(test_lm))

  expect_equal(coef_blm, coef_lm, tolerance = 0.05)

})