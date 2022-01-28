library(palmerpenguins)

test_that("Test Invalid Input DataFrame", {
    expect_error(
        plot_histograms(
            as.list(penguins),
            c("species", "flipper_length_mm", "bill_length_mm", "body_mass_g", "island")
        )
    )

    expect_error(
        plot_histograms(
            NULL,
            c("species", "flipper_length_mm", "bill_length_mm", "body_mass_g", "island")
        )
    )

    expect_error(
        plot_histograms(
            "String Input",
            c("species", "flipper_length_mm", "bill_length_mm", "body_mass_g", "island")
        )
    )
})

test_that("Test Invalid Input features", {
    expect_error(
        plot_histograms(
            penguins,
            c("species", "does not exist", "bill_length_mm", "body_mass_g", "island")
        )
    )

    expect_error(
        plot_histograms(
            penguins,
            NULL
        )
    )

    expect_error(
        plot_histograms(
            penguins,
            c()
        )
    )
})

test_that("Test Invalid Input facet_columns", {
    expect_error(
        plot_histograms(
            penguins,
            c("species", "flipper_length_mm", "bill_length_mm", "body_mass_g", "island"),
            0
        )
    )

    expect_error(
        plot_histograms(
            penguins,
            c("species", "flipper_length_mm", "bill_length_mm", "body_mass_g", "island"),
            NULL
        )
    )

    expect_error(
        plot_histograms(
            penguins,
            c("species", "flipper_length_mm", "bill_length_mm", "body_mass_g", "island"),
            3.5
        )
    )
})

test_that("Test Plots on Penguins Data", {
  one_cat_hist <- plot_histograms(penguins, c("species"))
  vdiffr::expect_doppelganger("one_categorical_histogram", one_cat_hist)

  two_cat_hist <- plot_histograms(penguins, c("species", "island"))
  vdiffr::expect_doppelganger("two_categorical_histograms", two_cat_hist)

  one_num_hist <- plot_histograms(penguins, c("flipper_length_mm"))
  vdiffr::expect_doppelganger("one_numeric_histogram", one_num_hist)

  two_num_hist <- plot_histograms(penguins, c("flipper_length_mm", "bill_length_mm"))
  vdiffr::expect_doppelganger("two_numeric_histograms", two_num_hist)

  one_cat_one_num_hist <- plot_histograms(penguins, c("species", "bill_length_mm"))
  vdiffr::expect_doppelganger("one_categorical_one_numeric_histograms", one_cat_one_num_hist)

  two_cat_two_num_hist <- plot_histograms(penguins, c("species", "island", "flipper_length_mm", "bill_length_mm"))
  vdiffr::expect_doppelganger("two_categorical_two_numeric_histograms", two_cat_two_num_hist)

  two_cat_three_num_hist <- plot_histograms(penguins, c("species", "island", "flipper_length_mm", "bill_length_mm", "body_mass_g"))
  vdiffr::expect_doppelganger("two_categorical_three_numeric_histograms", two_cat_three_num_hist)
})