library(tidyverse)
x <- c(1, 2, 3, 4, 5)
y <- c(2, 4, 6, 8, 10)
sample_data <- data.frame(x,y)

ggplot(sample_data) + aes(x, y) + geom_line() + theme_classic(base_size = 11, base_family = "serif")
