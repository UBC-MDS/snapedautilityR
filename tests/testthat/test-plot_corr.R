# Create toy data frame for testing
test_df <- data.frame(
  'num_a' = c(1,5,7,3,16),
  'num_b' = c(0.5,0.8,0.9,1.5,5.4),
  'num_c' = c(98,73,56,98,698),
  "char_d" = c("a","b","c","d","e")
)

test_df_not_df <- as.character(test_df)


# Tests whether input data is of type data.frame
test_that("The input 'data' must be of type data.frame", {
  expect_error(plot_corr(test_df_not_df))
})


# Tests whether input features is a vector
test_that("The input 'features' must be a vector", {
  expect_error(plot_corr(test_df, c(1,2,3)))
})

# Tests whether input data has at least two numeric features
test_that("The input 'data' must have at least two numeric features", {
  expect_error(plot_corr(test_df, c('a')))
})

# Tests whether output plot is a ggplot object
plot <- plot_corr(test_df, features = NULL)

test_that("The output plot must be of 'ggplot' type",{
  expect_true(ggplot2::is.ggplot(plot))
})

