context("blm")

test_that("we can fit blm objects", {
  # Creating a example
  sample = 30
  x = rnorm(sample, 20, 3)
  y = rnorm(sample, x, 1)
  #Using alpha and beta as 1
  test_blm = blm(y ~ x, alpha = 1, beta = 1)

  # If it is a blm class
  expect_that(test_blm, is_a("blm"))

  # If blm has the amount of outputs I built
  expect_that(str(test_blm), prints_text("List of 9"))

  # If it throws an error when beta and alpha are not explicitly declared
  expect_that(blm(y~ x, 1, 2),  throws_error())

  # If it throws an error when beta and alpha are not positive
  # Alpha negative
  expect_that(blm(y~ x, alpha = -1, beta = 2),  throws_error())
  # Beta negative
  expect_that(blm(y~ x, alpha = 1, beta = -2),  throws_error())

  # Alpha and beta negative
  expect_that(blm(y~ x, alpha = -1, beta = -2),  throws_error())

  # I need to test for y not being a empty list
  # I need to test for x not being a empty list
  # I need to test for x and y be the same length

})