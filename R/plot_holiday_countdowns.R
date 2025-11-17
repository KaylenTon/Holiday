plot_holiday_countdowns <- function() {
  ggplot2::ggplot(holiday_df) +
    aes(holiday, countdown) +
    geom_col() +
    labs(title = "Holidays Coming Up",
         x = "Holiday",
         y = "Days Until") +
    theme_minimal()
}

plot_holiday_countdowns()
