# toymaker dataset
set.seed(67)

# elf identifier variable. 1225 observations
total_elves <- 1225
elf_id <- 0001:total_elves
elf_id <- sprintf("%04d", 1:total_elves)

# sex variable
sex <- as.factor(sample(c("Male", "Female"), total_elves, T))
table(sex) # table() shows the count per category

# age
age <- pmax(round(rnorm(total_elves, mean = 3140, sd = 1000)), 100)
hist(age)

# job_type
job_type <- as.factor(sample(c("Full-time", "Part-time"), total_elves, T, prob = c(.75, .25)))
table(job_type)

# creating dataframe + new variable: weekly_hours
toymaker <- data.frame(elf_id, sex, age, job_type) %>%
  mutate(weekly_hours = ifelse(job_type == "Full-time",
                               pmin(pmax(round(rnorm(n(), mean = 40, sd = 10)), 40), 60),
                               pmin(pmax(round(rnorm(n(), mean = 30, sd = 3)), 20), 34)
                              )
         )

# experience
# want: elf's work experience CAN'T surpass elf's age minus 25 ;
toymaker <- toymaker %>%
  rowwise() %>%
  mutate(
    work_experience = case_when(
      age <= 500 ~ round(runif(1, 75, age - 25)),
      age <= 1000 ~ round(runif(1, 476, age - 25)),
      age <= 2000 ~ round(runif(1, 976, age - 25)),
      age <= 3000 ~ round(runif(1, 1976, age - 25)),
      age <= 4000 ~ round(runif(1, 2976, age - 25)),
      TRUE        ~ round(runif(1, 3976, age - 25))
    )
  ) %>%
  ungroup()

# toys_made_per_week



# defected_toys_made_per_week




# Test Visualizations (for assessing distribution purposes)
head(toymaker)

toymaker %>%
  select(job_type, weekly_hours) %>%
  table()

hist(toymaker$weekly_hours[toymaker$job_type == "Full-time"])
hist(toymaker$weekly_hours[toymaker$job_type == "Part-time"])
hist(toymaker$weekly_hours)

toymaker %>%
  filter(age <= 1000) %>%
  group_by(job_type) %>%
  arrange(age) %>%
  count(job_type)

summary(toymaker$work_experience)
summary(toymaker$age - toymaker$work_experience)

min(toymaker$age - toymaker$work_experience)
which(toymaker$age <= toymaker$work_experience)
all(toymaker$age > toymaker$work_experience)
which(is.na(toymaker$age - toymaker$work_experience))
