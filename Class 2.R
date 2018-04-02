#break down task into series of discrete steps: can tell computer
#find avg price of ideal cut diamond?
data("diamonds")#1 idenitify the input 
diamonds_ideal <- filter(diamonds, cut == "ideal") #2 filter for ideal cut diamonds, assign this filter to a new variable
summarize(diamonds_ideal, avg_price = mean(price)) #3 find the mean of the price column of the new variable

#find average price for each cut of diamonds
data("diamonds") #input
dcut <- group_by(diamonds, cut) #group by/aggregates [column 1 = cut]
summarize(dcut, avg_price = average(price)) #create a new column "avg_price"

#find avg carat size and price for each cut of I colored diamonds
data("diamonds") #input
di<- filter(diamonds, color=="I") #filter for only I colored diamonds
di<-group_by(di, cut) #group_by cut
summarize(di, carat=mean(carat), price=mean(price)) #summarize (create two new columns: avgprice and avgsize)

#---------------------
# dplyr package is the verbiage for data transformation
# each function follows same order of arguments
#  dataframe is nice tabular format that u can use dyplr transf functions on..
# tidying is making ur data into the nice dataframe format. Here r some things about dataframe:
#transformation function commonalities
# - first argument is always a dataframe/input
# - next arguments are always what u want to do with dataframe
# - result of transf function is always a new dataframe
# both British and American spellings work!
# <- save transformed data , assign to object... (<-) will show you output

#MiSsInG vAlUeS D: D: <>:  (O): o:  0:  {O}: {D:}
# na.rm argument
#when filter, if u want to keep rows with missing values filter( is [condish] | na.rm=true )
#summarize(df, meanx=mean(x, na.rm = TRUE))... enables u to calculate mean when there r missing values
#tibble dataframes are good

#piping
#pipes make things clear? [see pre class 2]

#this is confusing because recursive (multiple serially unfolding assignations to delay)
#fudge up your data if you run out of order
by_dest <- group_by(flights, dest)
delay <- summarise(by_dest,
                   count = n(),
                   dist = mean(distance, na.rm = TRUE),
                   delay = mean(arr_delay, na.rm = TRUE)
)
delay <- filter(delay, count > 20, dest != "HNL")


#assign the outcome of each function to "delays"
# Pipes - clear: place %>% at the end of each funding
delays <- flights %>% 
  group_by(dest) %>% 
  summarize(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")

#this is WRONG
delays <- flights %>% 
  group_by(flights, dest) %>% 
  summarize(flights, #respecifying 'flights' goes back to OG dataset; we want group_by()
            count = n(),
            dist = mean(distance, na.rm = TRUE),
            delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(flights, count > 20, dest != "HNL")
#also, do NOT make assignments in the pipe!!!!!!
