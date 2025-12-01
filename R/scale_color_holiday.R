scale_color_holiday <- function(palette, ...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = paste0("holiday_", palette@holiday),
    palette = function(n) get_colors(palette, n),
    ...
  )
}
