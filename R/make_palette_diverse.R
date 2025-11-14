make_palette_diverse <- function(palette) {
  function(n) {
    index <- round(seq(1, length(palette), length.out = n))
    palette[index]
  }
}
