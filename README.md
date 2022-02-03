
<!-- README.md is generated from README.Rmd. Please edit that file -->

# snapedautilityR

<!-- badges: start -->

[![R-CMD-check](https://github.com/UBC-MDS/snapedautilityR/workflows/R-CMD-check/badge.svg)](https://github.com/UBC-MDS/snapedautilityR/actions)
[![codecov](https://codecov.io/gh/UBC-MDS/snapedautilityR/branch/master/graph/badge.svg?token=ldT1wNBOky)](https://codecov.io/gh/UBC-MDS/snapedautilityR)
<!-- badges: end -->

snapedautilityR is an open-source library that generate useful function
to kickstart EDA (Exploratory Data Analysis) with just a few lines of
code. The system is built around quickly analyzing the whole dataset and
providing a detailed report with visualization. Its goal is to help
quick analysis of feature characteristics, detecting outliers from the
observations and other such data characterization tasks.

## Features

1.  `plot_histograms`: Plots the distribution for numerical, categorical
    and text features
2.  `detect_outliers`: Generate a violin plot that indicates the
    outliers that deviate from other observations on data.
3.  `plot_corr`: Generates Correlation Plots for numerical (Pearson’s
    correlation), categorical (uncertainty coefficient) and
    categorical-numerical (correlation ratio) datatypes seamlessly for
    all data types.

## Installation

You can install the released version of snapedautilityR from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("snapedautilityR")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("UBC-MDS/snapedautilityR")
```

## Usage

``` r
library(snapedautilityR)
library(palmerpenguins)
## basic example code for each utility function

# detect_outliers function
detect_outliers(c(1, 1, 2, 3, 4, 5, 6, 9, 10, 13, 40))

# plot_corr function
numerical_features <- c("bill_length_mm", "body_mass_g", "bill_depth_mm")
plot_corr(penguins, features = numerical_features)

# plot_histograms function
df <- penguins
plot <- plot_histograms(df, c("species", "bill_length_mm", "island"), 2, 100, 100)
```

## Contributors

| Core contributor | Github.com username |
|------------------|---------------------|
| Kyle Ahn         | @AraiYuno           |
| Harry Chan       | @harryyikhchan      |
| Dongxiao Li      | @dol23asuka         |

Interested in contributing? Check out the contributing guidelines.
Please note that this project is released with a Code of Conduct. By
contributing to this project, you agree to abide by its terms.

## Similar Work

We recognize EDA (exploratory data analysis) and preprocessing packages
are common in the R open source ecosystem. Our package aims to do a few
things very well, and be light weight. A non exhaustive list of EDA
helper packages in R include:

-   [`dlookr`](https://cran.r-project.org/web/packages/dlookr/index.html)

    -   This package includes handful tools to diagnose, explore and
        transform the data.

-   [`DataExplorer`](https://rdocumentation.org/packages/DataExplorer/versions/0.8.2)

    -   This package provides an easy to generate report, visualization
        and feature engineering functions for data analysis/predictive
        modeling.

## License

`snapedautilityR` was created by Kyle Ahn, Harry Chan and Dongxiao Li.
It is licensed under the terms of the MIT license.
