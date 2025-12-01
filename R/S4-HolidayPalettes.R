setClass("HolidayPalette",
         slots = c(
           holiday = "character",
           colors = "character",
           type = "character" # c or d for continuous or discrete
         ))

Christmas <- new("HolidayPalette",
                 holiday = "Christmas",
                 colors = c("#0b322d",
                            "#005F54",
                            "#008d78",
                            "#00BE9C",
                            "#fbc2bb",
                            "#fb88a1",
                            "#f54679",
                            "#E60031",
                            "#a70027",
                            "#6C001A"),
                 type = "both"
                 )

# get_colors and get_continuous -------------------------------------------

setGeneric("get_colors",  function(object, n = NULL, ...) standardGeneric("get_colors"))

setMethod("get_colors", "HolidayPalette",
          function(object, n = NULL, ...) {
            cols <- object@colors
            total <- length(cols)

            # Default n: use full palette (10 colors)
            if (is.null(n) || n >= total) return(cols)

            # Generate n evenly spaced indices
            idx <- round(seq(1, total, length.out = n))
            cols[idx]
          })

setGeneric("get_continuous", function(object, n, ...) standardGeneric("get_continuous"))

setMethod("get_continuous", "HolidayPalette",
          function(object, n, ...) {
            ramp <- grDevices::colorRampPalette(object@colors)
            ramp(n)
          })

# scale_color + discrete and continuous -----------------------------------

scale_color_holiday <- function(palette, ...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = paste0("holiday_", palette@holiday),
    palette = function(n) get_colors(palette, n),
    ...
  )
}

scale_color_holiday_c <- function(palette, ...) {
  ggplot2::scale_colour_gradientn(
    colours = palette@colors,
    ...
  )
}

# scale_fill + discrete and continuous ------------------------------------

scale_fill_holiday <- function(palette, ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = paste0("holiday_", palette@holiday),
    palette = function(n) get_colors(palette, n),
    ...
  )
}

scale_fill_holiday_c <- function(palette, ...) {
  ggplot2::scale_fill_gradientn(
    colours = palette@colors,
    ...
  )
}
