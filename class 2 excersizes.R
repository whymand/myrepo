library(tidyverse)

library(devtools)
library(rcfss)
data("scorecard")
glimpse(scorecard)
View(scorecard)
firstgen40 <- filter(scorecard, firstgen > 0.4)
firstgen40

arrange(scorecard, desc(cost)) %>%
  slice(1:10)
