#' holiday_df function
#'
#' @description
#' this function creates a dataframe with two columns: holiday and countdown. The columns contain six rows, which state the holiday name and how many until that holiday.
#'
#'
#' @returns the function returns a dataframe which is always updated with six holidays and the number of days until them, respectively
#' @export
#'
#' @examples
#' holiday_df()
holiday_df <- function() {

  holidays <- c("New Years Day", "Valentine", "St Patricks",
                "Juneteenth", "Halloween", "Christmas")

  day_counts <- numeric(length(holidays))

  for (i in seq_along(holidays)) {
    string <- holiday_countdown(holidays[i])
    day_counts[i] <- as.numeric(stringr::str_extract(string, "\\d+"))
  }

  holiday_df <- data.frame(
    holiday = holidays,
    countdown = day_counts
  )

  holiday_df
}
