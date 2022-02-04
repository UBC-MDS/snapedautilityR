#' Plot Histograms
#'
#' Detect outliers in the given list.
#' Plots histogram given numeric features of the input dfframe, and
#' plots bar charts for categorical features of the input dfframe
#'
#' @param df dfFrame that to be used for the plot
#'
#' @param features List of string feature names
#'
#' @param facet_columns Number of columns in Integer type for facet options
#' @return ggplot object consists of categorical and numeric histograms.
#' @export
#'
#' @examples
#' library(palmerpenguins)
#' df <- penguins
#' plot_histograms(df, c("species", "flipper_length_mm", "bill_length_mm", "body_mass_g", "island"), 3)
plot_histograms <- function(df, features, facet_columns = 2) {
    if (!is.data.frame(df)) {
      stop("The input data must be in type of data.frame.")
    }
    else if (length(features) == 0 || !all(features %in% names(df))) {
      stop("All features must exist in the columns of the input data.frame.")
    }
    else if (!(facet_columns > 0 && facet_columns %% 1 == 0)) {
      stop("facet_columns must be a value of positive integer")
    }

    cat_rel_height <- 1
    numeric_rel_height <- 1

    # Create categorical histogram
    cat_cols <- df |>
      dplyr::select(!tidyselect::vars_select_helpers$where(is.numeric)) |>
      dplyr::select(dplyr::any_of(features))
    if (length(cat_cols) > 0) {
      cat_histogram <- cat_cols |>
        tidyr::pivot_longer(dplyr::everything()) |>
        ggplot2::ggplot(ggplot2::aes(x = .data$value)) +
        ggplot2::geom_bar(fill = "lightblue") +
        ggplot2::facet_wrap(~ name, ncol = facet_columns, scales = "free") +
        ggplot2::labs(title = "Histograms for Categorical Features")
    } else {
      cat_rel_height <- 0
      cat_histogram <- ggplot2::ggplot()
    }

    # Create numeric histogram
    numeric_cols <- df |>
      dplyr::select(tidyselect::vars_select_helpers$where(is.numeric)) |>
      dplyr::select(dplyr::any_of(features))
    if (length(numeric_cols) > 0) {
      numeric_histogram <- numeric_cols |>
        tidyr::pivot_longer(dplyr::everything()) |>
        ggplot2::ggplot(ggplot2::aes(x = .data$value)) +
        ggplot2::geom_histogram(fill = "lightblue", bins = 30) +
        ggplot2::facet_wrap(~ name, ncol = facet_columns, scales = "free") +
        ggplot2::labs(title = "Histograms for Numeric Features")
    } else {
      numeric_rel_height <- 0
      numeric_histogram <- ggplot2::ggplot()
    }

    cowplot::plot_grid(
      cat_histogram,
      numeric_histogram,
      rel_heights = c(cat_rel_height, numeric_rel_height),
      nrow = 2
    )
}
