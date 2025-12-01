scale_color_holiday_c <- function(palette, ...) {
  ggplot2::scale_colour_gradientn(
    colours = palette@colors,
    ...
  )
}
