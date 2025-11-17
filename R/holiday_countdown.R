holiday_countdown <- function(holiday) {

  today <- Sys.Date()
  current_year <- format(today, "%Y")

  holiday_date <- holiday_list[[holiday]]
  holiday_date <- as.Date(paste0(current_year, "-", holiday_date))

  if (holiday_date < today) {
    next_year <- as.numeric(current_year) + 1
    holiday_date <- as.Date(paste0(current_year, "-", holiday_date))
  }

  daysLeft <- as.numeric(holiday_date - today)

  print(paste("There are", daysLeft, "days until", holiday, "!"))

}
