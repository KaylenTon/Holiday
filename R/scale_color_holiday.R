#' scale_color_holiday()
#'
#' @description
#' This function applies a holiday color palette to your visualization's DISCRETE variables.
#'
#' @param palette The only available palette at the moment is "Christmas". It has 10 colors.
#' @param ... compatible with ggplot2, this mapping accepts any other arguments provided by ggplot2's scale_color_ and scale_fill_
#'
#' @returns Applies the holiday color palette to your visualization's DISCRETE variables.
#' @export
#'
#' @examples
#' ggplot(toymaker, aes(x = job_type, y = age, color = job_type)) + geom_point(size = 3) + scale_color_holiday(Christmas)
scale_color_holiday <- function(palette, ...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = paste0("holiday_", palette@holiday),
    palette = function(n) get_colors(palette, n),
    ...
  )
}
