#' plot_holiday_countdowns function
#'
#' @description
#' This function creates a simple bar chart visualization, ascending the holidays in the order they are closet to further from today!
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
    ggplot2::aes(holiday, countdown, fill = holiday) +
    ggplot2::geom_col() +
    ggplot2::labs(title = "Holidays Coming Up",
         x = "Holiday",
         y = "Days Until") +
    ggplot2::geom_text(ggplot2::aes(label = countdown),
              vjust = "bottom",
              nudge_y = 5) +
    ggplot2::theme_minimal()

}
