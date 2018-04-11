library(tidyverse)

#Load CSV File
#read_csv (faster)
#read.csv (slower)

#only R can load rds files
#read_rds
#feather-- newer. Written to be cross compatible

#Excel ffiles
library(read_excel)
read_excel(filename, sheet = sheetnameornumber)

#for SASS, SPS, Stata -- use Haven package
#some things in these finals dont make any sense in R software (i.e. value labels)
read_dta(system.file()) 
write_dta(name, "url")


read_sas()
read_sav()


#TIDY DATA

#most soci sci data is stored in **tabular structure**...this makes sense for R, functions
#however, tabular data might not be necessarily tidy! (tidy is necessary for tidyverse use)

#TIDY?
#There are three interrelated rules which make a dataset tidy:
#Each variable must have its own column.
#Each observation must have its own row.
#Each value must have its own cell.

#GATHERING
#Bring variable spread across multiple columns into single column
#wide to long

## # A tibble: 3 x 3
##       country `1999` `2000`
## *       <chr>  <int>  <int>
## 1 Afghanistan    745   2666
## 2      Brazil  37737  80488
## 3       China 212258 213766

#here^ year is defined across two column instead of one

table4a %>% 
  gather(`1999`, `2000`, key = "year", value = "cases")

#tablename %>%
#  gather(name of column to gather, name of column to gather, key="name of var whose values form the column names", value="name of ")
#key and value didnt exist on old dataset, we created them


## # A tibble: 6 x 3
##       country  year  cases
##         <chr> <chr>  <int>
## 1 Afghanistan  1999    745
## 2      Brazil  1999  37737
## 3       China  1999 212258
## 4 Afghanistan  2000   2666
## 5      Brazil  2000  80488
## 6       China  2000 213766


#SPREADING
#spreading opposite of gathering, brings back obs thats been spread into multiple rows into single row
#long to wide

table2
## # A tibble: 12 x 4
##        country  year       type      count
##          <chr> <int>      <chr>      <int>
##  1 Afghanistan  1999      cases        745
##  2 Afghanistan  1999 population   19987071
##  3 Afghanistan  2000      cases       2666
##  4 Afghanistan  2000 population   20595360
##  5      Brazil  1999      cases      37737
##  6      Brazil  1999 population  172006362
##  7      Brazil  2000      cases      80488
##  8      Brazil  2000 population  174504898
##  9       China  1999      cases     212258
## 10       China  1999 population 1272915272
## 11       China  2000      cases     213766
## 12       China  2000 population 1280428583


#cases and pop are vars, shouldnt be in multiple rows
#here, single observation is a country in time, a country year pair
spread(key = type, value =count)
#spread(key=name of variable, 
#value=name of column that contains the name of the values for those variables)

#SEPARATING
#not tidy bc cells rate column has two values
#also bc two variables in rate column (cases and pop need own columns)
#need to separate out so column reps numerator and column reps denom
#separate(column name to be separated, into =c("new column name","other new column name"))

table3
## # A tibble: 6 x 3
##       country  year              rate
## *       <chr> <int>             <chr>
## 1 Afghanistan  1999      745/19987071
## 2 Afghanistan  2000     2666/20595360
## 3      Brazil  1999   37737/172006362
## 4      Brazil  2000   80488/174504898
## 5       China  1999 212258/1272915272
## 6       China  2000 213766/1280428583

table3 %>% 
  separate(rate, into = c("cases", "population"))
## # A tibble: 6 x 4
##       country  year  cases population
## *       <chr> <int>  <chr>      <chr>
## 1 Afghanistan  1999    745   19987071
## 2 Afghanistan  2000   2666   20595360
## 3      Brazil  1999  37737  172006362
## 4      Brazil  2000  80488  174504898
## 5       China  1999 212258 1272915272
## 6       China  2000 213766 1280428583



#UNITING
#combine two columns into a single columns... 
#for when you have a single variable split across two columns
#tablename %>%
#unite(name of new column, name of old column1, name of old column2, sep = " ")
#*add the sep argument if you want to mash the columns together... otherwise insert underscore

## # A tibble: 6 x 4
##       country century  year              rate
## *       <chr>   <chr> <chr>             <chr>
## 1 Afghanistan      19    99      745/19987071
## 2 Afghanistan      20    00     2666/20595360
## 3      Brazil      19    99   37737/172006362
## 4      Brazil      20    00   80488/174504898
## 5       China      19    99 212258/1272915272
## 6       China      20    00 213766/1280428583

table5 %>% 
  unite(new, century, year, sep = "")
## # A tibble: 6 x 3
##       country   new              rate
## *       <chr> <chr>             <chr>
## 1 Afghanistan  1999      745/19987071
## 2 Afghanistan  2000     2666/20595360
## 3      Brazil  1999   37737/172006362
## 4      Brazil  2000   80488/174504898
## 5       China  1999 212258/1272915272
## 6       China  2000 213766/1280428583


#PRACTICE

#race
library(tidyverse)
library(rcfss)
race %>%
  gather(`50`, `100`, `150`, `200`, `250`, `300`, `350`, key="length", value="score") %>%
  arrange(Name, length)

#clinical trial
results %>%
  spread(key="Treatment", value="value") %>%
  arrange(Cont)

#would need to find function to extract "5" from "Ind5"
#then we can convert from "charachter" to "numeric" how??
#maybe as.numeric, as.character
  
#grades
grades %>%
  gather(Fall,Spring,Winter,key="season",value="score") %>%
  spread(Test,score) %>%
  rename("Test1" = "1") %>%
  rename("Test2" = "2") %>%
  arrange(ID)

