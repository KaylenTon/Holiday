#' scale_color_holiday_c()
#'
#' @description
#' This function applies a holiday color palette to your visualization's CONTINUOUS variables.
#'
#' @param palette The only available palette at the moment is "Christmas".
#' @param ... compatible with ggplot2, this mapping accepts any other arguments provided by ggplot2's scale_color_ and scale_fill_
#'
#' @returns Applies the holiday color palette to your visualization's CONTINUOUS variables.
#' @export
#'
#' @examples
#' ggplot(toymaker, aes(x = job_type, y = age, color = age)) + geom_point(size = 4, alpha = .1) + scale_color_holiday_c(Christmas)
scale_color_holiday_c <- function(palette, ...) {
  ggplot2::scale_colour_gradientn(
    colours = palette@colors,
    ...
  )
}
