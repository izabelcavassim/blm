
context("confint")

test_that("Confidence interval", {

  sample = 30
  x = rnorm(sample, 20, 3)
  y = rnorm(sample, x, 1)
  #Using alpha and beta as 0
  test_blm = blm(y ~ x, alpha = 1, beta = 1)
  test_lm = lm(y ~ x)

  #expect_equal(confint(test_blm), confint(test_lm))
})