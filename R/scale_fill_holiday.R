#' scale_fill_holiday()
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
#' ggplot(toymaker, aes(sex, fill = sex)) + geom_bar() + scale_fill_holiday(Christmas)
scale_fill_holiday <- function(palette, ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = paste0("holiday_", palette@holiday),
    palette = function(n) get_colors(palette, n),
    ...
  )
}
