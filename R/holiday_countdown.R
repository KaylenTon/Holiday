holiday_countdown <- function(holiday) {

  today <- Sys.Date()
  current_year <- format(today, "%Y")

  month_day <- holiday_list[[holiday]]
  holiday_date <- as.Date(paste0(current_year, "-", month_day))

  if (holiday_date < today) {
    next_year <- as.numeric(current_year) + 1
    holiday_date <- as.Date(paste0(next_year, "-", month_day))
  }

  daysLeft <- as.numeric(holiday_date - today)

  print(paste0("There are ", daysLeft, " days until ", holiday, "!"))

}

holiday_countdown("NewYearsDay")
