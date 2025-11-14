# Toymaker dataset
set.seed(67)

elf_id <- 0001:1225

sex <- c("Male", "Female", "Non-Binary")
sex <- sample(sex,1225,T)

days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday") # Sundays are off
# Elves are either part-time or full-time

age <- rnorm(100:4500, 1225, T)


