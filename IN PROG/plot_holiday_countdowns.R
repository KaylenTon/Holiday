plot_holiday_countdowns <- function() {

  holiday_df <- holiday_df() |>
    dplyr::arrange(countdown)

  holiday_df$holiday <- factor(holiday_df$holiday, levels = holiday_df$holiday)

  ggplot2::ggplot(holiday_df) +
    aes(holiday, countdown) +
    geom_col() +
    labs(title = "Holidays Coming Up",
         x = "Holiday",
         y = "Days Until") +
    theme_minimal()

}
