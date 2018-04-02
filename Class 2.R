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
# <- save transformed data 
  