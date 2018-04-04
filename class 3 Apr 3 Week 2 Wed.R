ggplot(data= diamonds) +
  geom_histogram(mapping = aes(x = price, binwidth = 400)) #wtf
diamonds %>%
  count(cut_width(price, 500))
#see^ how many diamonds are 0-500$, 500-1000$, etc.... cut_width() is useful af


#how to do this with pipe???
diamonds1 <-filter(diamonds, 2<y & y<20)
ggplot(data = diamonds1, mapping = aes (x = x, y=y)) + geom_point()

View(scorecard)

#two continuous variables:
#boxplot oo la la
ggplot(data = diamonds, mapping = aes(x = carat, y=price)) +
  geom_boxplot(mapping = aes(group = cut_width(carat, 0.2), y=price))
#scatterplot oo la la
ggplot(data = diamonds) + 
  geom_point(mapping = aes(x= carat, y=price), alpha = 1/100)

#coool plots
install.packages("hexbin")
library(hexbin)
ggplot(data = diamonds) +
  geom_hex(mapping = aes(x = carat, y = price))

#CLASS
library(tidyverse)
ggplot(data=mpg) +
  geom_histogram(mapping = aes(x = hwy)) +
  geom_rug()
#this^ same as below
ggplot(mpg, aes(hwy)) +
  geom_histogram(bins=10)

#covariation methods
#1) 2d graph, 2) multiple windows plot 3) utilizing channels

#1) hwy vs class--boxplot

#2) facetwrap: compare 4 wheel, rear wheel, front wheel, to find differences in dist. of hi
ggplot(mpg, aes(hwy)) +
  geom_histogram() +
  facet_wrap(~ drv)
ggplot(mpg, aes(hwy)) +
  geom_scatterplot() + #WRONG
  facet_wrap(~ drv)

#3) utilizing addl channels
#i.e. we use 2 channels, vertical, horizontal to communicate info 
# (i.e. vertical horizontal position)
#but there are more channels we can use: use **color** channel to communicate info
#--i.e. 2-seaters in blue, SUVs in red (on scatterplot of mpg vs. price or something)
#can also use size channel [we are talking about a scatterplot]... little dots for each
#datapoint get larger
#cramming too much info makes it confusing

#APPLICATION
library(rcfss)
data("scorecard")
str(scorecard)
?scorecard

#Which type of college has the highest average SAT score?
ggplot(scorecard, aes(satavg)) +
  geom_histogram() +
  facet_wrap(~type)

sum(is.na(scorecard$satavg))

ggplot(scorecard, aes(type, satavg)) +
  geom_boxplot()

#What is the relationship between college attendance cost and faculty salaries? 
#How does this relationship differ across types of colleges?

ggplot(scorecard, aes(cost, avgfacsal)) +
  geom_point(alpha=0.2) + 
  geom_smooth()

ggplot(scorecard, aes(cost, avgfacsal)) +
  geom_hex() + 
  geom_smooth()

ggplot(scorecard, aes(cost, avgfacsal, color=type)) +
  geom_point() + 
  geom_smooth()

a<-filter(scorecard, type=="Private, for-profit")
ggplot(a, aes(cost, avgfacsal)) +
  geom_point() 

#How are a college’s Pell Grant recipients related to the average student’s 
#education debt?

ggplot(scorecard, aes(pctpell, debt, color=type)) +
  geom_point(alpha=0.25) +
  geom_smooth()


