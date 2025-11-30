#' plot_holiday_countdowns function
#'
#' @returns a bar chart in ascending order, visualizing six holidays and how far they are in days
#' @export
#'
#' @examples
#' plot_holiday_countdowns()
plot_holiday_countdowns <- function() {

  holiday_df <- holiday_df() |>
    dplyr::arrange(countdown)

  holiday_df$holiday <- factor(holiday_df$holiday, levels = holiday_df$holiday)

  ggplot2::ggplot(holiday_df) +
    aes(holiday, countdown, fill = holiday) +
    geom_col() +
    labs(title = "Holidays Coming Up",
         x = "Holiday",
         y = "Days Until") +
    geom_text(aes(label = countdown),
              vjust = "bottom",
              nudge_y = 5) +
    theme_minimal()

}
