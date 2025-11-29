## code to prepare `toymaker` dataset goes here
library(sn)
library(tidyverse)

# toymaker dataset
set.seed(67)

# elf identifier variable. 1225 observations
total_elves <- 1225
elf_id <- 0001:total_elves
elf_id <- sprintf("%04d", 1:total_elves)

# sex variable
sex <- as.factor(sample(c("Male", "Female"), total_elves, T))

# age
age <- pmax((round(rsn(total_elves, xi = c(100:total_elves), omega = 1200, alpha = 10, dp = NULL))), 100)

# job_type
job_type <- as.factor(sample(c("Full-time", "Part-time"), total_elves, T, prob = c(.75, .25)))

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

# Professor's assistance:
toymaker <- toymaker %>%
  mutate(
    # 1. Base productivity (toys per hour) - varies by elf
    # This could be influenced by experience (but with diminishing returns)
    # Add some random variation so not all elves are identical
    base_productivity = 5 + (work_experience / 500) + rnorm(n(), 0, .3),
    base_productivity = pmax(base_productivity, 0.5), # minimum floor
    base_productivity = round(base_productivity),

    # 2. Toys per week = productivity * hours worked
    toys_per_week = round(base_productivity * weekly_hours),

    # 3. Quality rate increases with experience (with diminishing returns)
    # Using a logistic-style curve to keep it between 0 and 1
    quality_rate = 0.70 + 0.25 * (1 - exp(-work_experience / 1500)) +
      rnorm(n(), 0, 0.03),
    quality_rate = pmax(0.5, pmin(0.99, quality_rate)), # bound between 50-99%
    quality_rate = round(quality_rate, 2),

    # 4. Defected toys based on quality rate
    defected_toys_per_week = round(toys_per_week * (1 - quality_rate)),

    # 5. Verify the quality rate calculation
    calculated_quality_rate = 1 - (defected_toys_per_week / toys_per_week),
    calculated_quality_rate = round(calculated_quality_rate, 2)
  )

toymaker <- toymaker %>%
  select(elf_id, sex, age, job_type, weekly_hours, work_experience, base_productivity, toys_per_week, defected_toys_per_week, quality_rate)

usethis::use_data(toymaker, overwrite = TRUE)
