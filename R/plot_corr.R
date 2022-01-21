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

}
