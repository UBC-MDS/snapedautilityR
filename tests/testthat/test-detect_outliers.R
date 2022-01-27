# Test Data
simple_data <- c(1, 2, 1, 2, 1, 1000)
empty_data <- c()

test_that("iqr outliers work with simple data", {
  output <- detect_outliers(simple_data)
  expect_equal(output[[1]],-0.5)
  expect_equal(output[[2]], 3.5)
  expect_equal(class(output[[3]])[[2]], "ggplot")
})

test_that("Test detect outliers with incorrect parameter", {
  expect_error(detect_outliers("abc"), "s has to be a numeric vector")
  expect_error(detect_outliers(100, simple_data, 100),
               "s must have at least two elements")
  expect_error(detect_outliers(simple_data, "100", 100),
               "width has to be a numeric vector")
  expect_error(detect_outliers(simple_data, 100, FALSE),
               "height has to be a numeric vector")
})

test_that("Test detect outliers with empty data", {
  expect_error(detect_outliers(empty_data), "s has to be a numeric vector")
  expect_error(detect_outliers(empty_data, 100, 100),
               "s has to be a numeric vector")
  expect_error(detect_outliers(empty_data, "100", 100),
               "s has to be a numeric vector")
  expect_error(detect_outliers(empty_data, "100", FALSE),
               "s has to be a numeric vector")
})
