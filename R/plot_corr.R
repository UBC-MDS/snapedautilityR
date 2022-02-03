#' A function that generates a pearson correlation plot for a list of numeric features in a given data frame.
#'
#' @param df The input data frame for plotting.
#' @param features A vector of characters that represents the features names. By default, NULL (returns the correlation plot of all numeric features).
#'
#' @return ggplot object, a correlation plot that illustrates the correlation between numeric features interactively.
#' @export
#'
#' @examples
#'
#' numerical_features <- c('Sepal.Length','Sepal.Width','Petal.Width')
#'
#' plot_corr(iris, features = numerical_features)
#'
plot_corr <- function(df, features=NULL) {

  # Tests whether input data is of data.frame type
  if (!is.data.frame(df)){
    stop("The thing you passed in `df` is not a valid data.frame")
  }

  # Tests whether input features is of the type vector
  if((!is.vector(features) | !is.character(features)) & (!is.null(features))){
    stop("Please pass in a vector for 'features'")
  }

  # Test whether the input data has at least two numeric features
  if (dplyr::select_if(df, is.numeric) |>  ncol() < 2) {
    stop("The 'df' needs at least two numeric features")
  }

  # Create a data frame with numeric features only
  num_df <- dplyr::select_if(df, is.numeric)

  if (length(features) > 0) {
    num_df <- num_df |> dplyr::select(all_of(features))
  }

  # Visualization
  corr_plot <- GGally::ggcorr(num_df, method = c("everything", "pearson")) +
          ggplot2::ggtitle("Correlation Matrix Plot for Numeric Features")

  corr_plot
}
