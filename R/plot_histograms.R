#' Detect outliers in the given list
#' Plots histogram given numeric features of the input dataframe, and
#' plots bar charts for categorical features of the input dataframe
#'
#' @param df DataFrame that to be used for the plot
#'
#' @param features List of string feature names
#' 
#' @param facet_columns Number of columns in Integer type for facet options
#' 
#' @param width The width of sub-plot for each feature. Default set to 125
#' 
#' @param height The height of sub-plot for each feature Default set to 125
#' 
#' @return ggplot object consists of categorical and numeric histograms.
#' @export
#'
#' @examples
#' df <- penguins_data
#' plot <- plot_histograms(df, c("species", "bill_length_mm", "island"), 2, 100, 100)
plot_histograms <- function(df, features, facet_columns = 2, width = 125, height = 125) {

}