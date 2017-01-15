context("summary")

test_that("summary output everything I have planned", {

  # Creating an example
  n = 100
  x = rnorm(n)
  y = rnorm(n, mean = 3*x)
  model <- y ~ x

  #Using alpha and beta as 1
  test_blm = blm(model, alpha = 1, beta = 1)
  test_lm = lm(model)

  # If summary has the amount of outputs I built
  expect_that(str(summary(test_blm)), prints_text("List of 8"))

  # If R-squared matches
  output = summary(test_blm)
  expect_equal(output$R_squared, summary(test_lm)$r.squared, tolerance = 0.1)

})

