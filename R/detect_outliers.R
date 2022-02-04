#' Detect outliers
#'
#' Detect outliers in the given list
#' Returns a threshold value for the lower bound and upper bound of the outliers and Plot a violin plot of the observations
#'
#' @param s list of double that contains the data
#' @param width The width of ggplot. Default set to 150
#' @param height The height of ggplot. Default set to 150
#'
#' @return List of double
#'   A Threshold value for the lower bound and upper bound of the outliers
#' @return ggplot object
#'   A Boxplot of the given values and outliers
#' @export
#'
#' @examples
#' detect_outliers(c(1,1,2,3,4,5,6,9,10,13,40), 150, 150)
detect_outliers <- function(s, width = 150, height = 150) {

  if(!is.numeric(s)) {
    stop("s has to be a numeric vector")
  }

  if(!is.numeric(width)) {
    stop("width has to be a numeric vector")
  }

  if(!is.numeric(height)) {
    stop("height has to be a numeric vector")
  }

  if(length(s) < 2) {
    stop("s must have at least two elements")
  }
  # Return Lower Bound and Upper Bound
  threshold = 1.5
  q1 <- unname(stats::quantile(s, 0.25))
  q3 <- unname(stats::quantile(s, 0.75))
  iqr <- q3 - q1

  data <- tibble::tibble(
    values = s
  )

  # Box Plot
  boxplot <- data |>
    ggplot2::ggplot(
      ggplot2::aes(
        x = values,
      )
    ) +
    ggplot2::geom_boxplot()


  # Returns
  list(q1 - threshold * iqr, q3 + threshold * iqr, boxplot)
}

