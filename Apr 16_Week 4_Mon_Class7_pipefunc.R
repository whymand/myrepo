#PIPING +WRITING FUNCTIONS & CONDITIONAL STATEMENTS


#PIPING

library(tidyverse)
library(rcfss)
data("gun_deaths")
gun_deaths

#For each education category, how many white males where killed in 2012?

#four ways to do it

#intermediate steps
wm1<-filter(gun_deaths, sex=="M",race=="White",year=="2012")
wm2<-count(wm1, education)
wm2

#overwrite original
gun_deaths<-filter(gun_deaths, sex=="M",race=="White",year=="2012")
gun_deaths<-count(wm2, education)
gun_deaths

#function composition
data("gun_deaths")
count(filter(gun_deaths,sex=="M",race=="White",year=="2012"),education)

#pipe (the one professor likes)
gun_deaths %>%
  filter(sex=="M",race=="White",year=="2012") %>%
  group_by(education) %>%
  count()


#WRITING FUNCTIONS & CONDITIONAL STATEMENTS





