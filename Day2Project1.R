#case study - denco

sales1 = read.csv("./Data/denco.csv")

sales2 = read.csv(file.choose())            #popup to choose file
str(sales2)
#using gsheet
#install.packages(ghseet)
library(gsheet)
url = "https://docs.google.com/spreadsheets/d/1h7HU0X_Q4T5h5D1Q36qoK40Tplz94x_HZYHOJJC_edU/edit#gid=216113907"

sales3 = as.data.frame(gsheet2tbl(url))
str(sales3)

#head(sales1,n=7)
#names(sales1)

sales = sales1  # keeping a backup
str(sales)
class(sales)
?summary
summary(sales)      #always do summary before analysing

str(sales)
dim(sales)
unique(sales$custname)       #unique coustomers
length(unique(sales$custname)) #no. of unique coustomer
length(unique(sales$region ))

aggregate(sales$revenue , by=list(sales$custname), FUN=sum)    #revenue by coustomer
df1 = aggregate(sales$revenue , by=list(sales$custname), FUN=sum)
head(df1)    #first 5-6 values
str(df1)

df1=df1[order(df1$x, decreasing=TRUE),]
head(df1,5)
head(df1[order(df1$x, decreasing=TRUE),], 5)

aggregate(sales$margin, by = list(sales$region), FUN = mean) #do it again

#Aggregate Formula
(df2 = aggregate(revenue ~ custname + region, data=sales, FUN=sum))
df2
head(df2[order(df2$revenue,decreasing=T),],10)

#List
list1= tapply(sales$revenue, sales$custname, FUN=sum)
head(list1)
list1
head(sort(list1, decreasing=T))
summary(df3)
str(df3)

#dplyr
names(sales)

library(dplyr)

sales %>% filter(margin > 1000000) %>% arrange(region, desc(revenue))
filter(sales, margin > 1000000)


sales %>% filter(region == '01-East' & revenue > 400000) %>% select(partnum, region, revenue)

names(sales)
sales %>% group_by(region) %>% 
  summarize(Revenue = sum(revenue)) %>% arrange(desc(Revenue))



library(data.table)
dt1 = as.data.table(sales)
dt2 = dt1[, sum(revenue), by=custname]
names(dt2)
dt1[, dt1[, sum(revenue), by=custname]]

dt1[, order(, decreasing = T)]

# Select
library(sqldf)
df5 =sqldf("Select custname, sum(revenue) from sales Group By custname order by sum(revenue) desc ")
head(df5)

# Freqency --------
names(sales)
t1 = table(sales$custname)
head(t1)
t2 = sort(t1, decreasing = T)
head(t2)
tail(t2)
head(sort(table(sales$custname), decreasing=T), n=10)
tail(sort(table(sales$custname), decreasing=T), n=10)


#xtab
#
head(sort(xtabs(~ custname, sales), decreasing=T))
#
#
library(dplyr)
sales %>% dplyr::count(custname, sort=TRUE)

sales %>% dplyr::group_by(custname) %>% dplyr::summarise(n = n()) %>% dplyr::arrange(desc(n))



#plyr
df2a= plyr::count(sales, c('custname'))
str(df2a); names(df2a)
head(df2a[order(-df2a$freq),])

#excercise
names(sales)
sales %>% group_by(partnum) %>% select(partnum , margin ) %>% arrange(desc(margin))

# Summarise by Part Num

df3a= aggregate(sales$revenue, by=list(sales$partnum), FUN=sum)
df3a[order(-df3a$x),][1:5,]

df3b = aggregate(revenue ~ partnum, data=sales, FUN=sum)
head(df3b)
head(df3b[order(df3b$revenue, decreasing=T),])

sales %>% dplyr::group_by(partnum) %>% dplyr::summarise(n = n()) %>% dplyr::arrange(desc(n))


# which parts have highest Profit : partno - sum(profit)
names(sales)
df4a = aggregate(margin ~ partnum, data=sales, FUN=sum)
head(df4a)

