library("tidyverse"
)
library(gapminder)
library(ggplot2)
library(tibble)

glimpse(gapminder)
ggplot(data=gapminder,mapping = aes(x=lifeExp)) +
         geom_histogram(binwidth = 2)

glimpse(gapminder)
ggplot(data=gapminder,mapping = aes(x=lifeExp)) +
  geom_histogram(binwidth = 2) + facet_grid(.~continent)
