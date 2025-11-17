holidays <- c("New Years Day", "Valentine", "St Patricks",
              "Juneteenth", "Halloween", "Christmas")

day_counts <- numeric(length(holidays))   # empty numeric vector

for (i in seq_along(holidays)) {
  string <- holiday_countdown(holidays[i])
  day_counts[i] <- as.numeric(stringr::str_extract(string, "\\d+"))
}

holiday_df <- data.frame(
  holiday = holidays,
  countdown = day_counts
)

holiday_df
