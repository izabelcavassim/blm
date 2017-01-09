context("Predict")

test_that("predict values of blm approximate lm values", {
  #set.seed(100)

  # Creating an example
  n = 100
  x = rnorm(n)
  y = rnorm(n, mean = 3*x)
  model <- y ~ x

  test_blm = blm(y ~ x, alpha = 3, beta = 3.5)
  test_lm = lm(y ~ x)

  #print(predict(test_blm))
  #print(predict(test_lm))

  # Without new data
  expect_equal(predict(test_blm), predict(test_lm), tolerance = 0.05)

  # With new data:
  new_data <- data.frame(x=runif(10))
  expect_equal(predict(test_blm, new_data), predict(test_lm, new_data), tolerance = 0.1)

  # Test that new data is a data frame
  expect_that(new_data, is_a("data.frame"))
})
