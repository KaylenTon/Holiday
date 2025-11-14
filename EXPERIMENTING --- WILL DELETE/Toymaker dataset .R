# Toymaker dataset
set.seed(67)

# elf identifier variable. 1225 observations
elf_id <- 0001:1225

# sex variable
sex <- c("Male", "Female")
sex <- sample(sex,1225,T)
table(sex) # table() shows the count per category

days <- c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday") # Sundays are off
# Elves are either part-time or full-time

age <- sample(100:5000, 1225, T)


# Creating Dataframe
toymaker <- data.frame(elf_id, sex, age)
