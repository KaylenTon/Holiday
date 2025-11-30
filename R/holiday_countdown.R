#' holiday_countdown function
#'
#' @param holiday Choose a holiday and make sure to put it in quotes: New Years Day, Valentine, St Patricks, Juneteenth, Halloween, OR Christmas.
#'
#' @returns A string message telling you how many days are left until the chosen holiday!
#' @export
#'
#' @examples
#' holiday_countdown("Christmas")
holiday_countdown <- function(holiday) {

  today <- Sys.Date()
  current_year <- format(today, "%Y")

  month_day <- holiday_list[[holiday]]
  holiday_date <- as.Date(paste0(current_year, "-", month_day))

  if (holiday_date < today) {
    next_year <- as.numeric(current_year) + 1
    holiday_date <- as.Date(paste0(next_year, "-", month_day))
  }

  days_left <- as.numeric(holiday_date - today)

  return(paste0("There are ", days_left, " days until ", holiday, "!"))

}
