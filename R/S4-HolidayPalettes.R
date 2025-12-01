methods::setClass("HolidayPalette",
         slots = c(
           holiday = "character",
           colors = "character",
           type = "character" # c or d for continuous or discrete
         ))

#' Christmas holiday palette
#'
#' A discrete/continuous color palette for Christmas-themed plots.
#'
#' @name Christmas
#' @docType data
#' @keywords datasets
#' @export
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

methods::setGeneric("get_colors",  function(object, n = NULL, ...) standardGeneric("get_colors"))

methods::setMethod("get_colors", "HolidayPalette",
          function(object, n = NULL, ...) {
            cols <- object@colors
            total <- length(cols)

            # Default n: use full palette (10 colors)
            if (is.null(n) || n >= total) return(cols)

            # Generate n evenly spaced indices
            idx <- round(seq(1, total, length.out = n))
            cols[idx]
          })

methods::setGeneric("get_continuous", function(object, n, ...) standardGeneric("get_continuous"))

methods::setMethod("get_continuous", "HolidayPalette",
          function(object, n, ...) {
            ramp <- grDevices::colorRampPalette(object@colors)
            ramp(n)
          })
