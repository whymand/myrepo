library(tidyverse)
install.packages("devtools")
devtools::install_github("uc-cfss/rcfss")
install.packages("nycflights13")
library(nycflights13)
nycflights13::flights
View(flights)

# Pick (subset) observations by their values (filter()).
# Reorder the rows (arrange()).
# Pick variables by their names (select()).
# Create new variables with functions of existing variables (mutate()).
# Collapse many values down to a single summary (summarise()).

# These can all be used in conjunction with 
# group_by() which changes the scope of each 
# function from operating on the entire dataset to 
# operating on it group-by-group

#The first argument is a data frame.
#The subsequent arguments describe what to do with the data frame, using the variable names (without quotes).
#The result is a new data frame.
#example: (flight=data frame, month, day are variable names)
jan1 <- filter(flights, month==1, day ==1)
jan1
#^created a new "fliter veiw" of the OG dataset; viewing all flights from Jan 1st (January AND 1st)
#then assign this filter to "jan 1"
# NOT (month=1)... ALWAYS (month==1)
#when doing math, use    near(a, b)  not  (a==b)

#boolean: &=and, |=or, !=not, (e.g. x & !y)
filter(flights, month == 11 | month == 12)
#all flights from nov OR dc^

filter(flights, month %in% c(11, 12))
#returns all flights where the month=11or12

#NA=missing value
# is.na() ...is a value missing?
# filter() only inc values where TRUE, not FALSE, not NA
# need to explicitly ask for missing vals uf u want them
# filter(x = c(NA, ))

save30 <- filter(flights, dep_delay > 60, dep_delay - arr_delay >= 30)
#flights that left at least 60 minutes late, but made up at least 30 minutes in flight
View(filter(flights, between(dep_delay, 11, 12)))

#ARRANGE
#sorts sheet in ascending order of a column(s)
#arrange(dataset,columname,columnname)
#each columname after the first one is a tiebreaker
#for the column in front of it/. i.e.: same year, different month
arrange(flights, year, month, day) #sorts flights by date
arrange(flights, dep_time, day)
#descending order instead of ascending: 
arrange(flights, desc(year), desc(month), desc(day))

#SELECT
#focus in on the variables you care about
#select(flights, year, month) = get rid of all the columns except year and month
select(flights,starts_with("d"))
#^only shows columns with names that start with d
#starts_with("abc"): matches names that begin with “abc”.
#ends_with("xyz"): matches names that end with “xyz”.
#contains("ijk"): matches names that contain “ijk”.
#matches("(.)\\1"): selects variables that match a regular expression. This one matches
#any variables that contain repeated characters. You’ll learn more about regular expressions in strings.
#num_range("x", 1:3) matches x1, x2 and x3.
