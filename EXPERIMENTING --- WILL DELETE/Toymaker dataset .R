# toymaker dataset
set.seed(6767)

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

# Test Visualizations (for assessing distribution purposes)
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
