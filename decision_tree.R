#decision tree

library(rpart)
library(rpart.plot)

#students - gender - buy a product

rollno = paste('s', 1:1000, sep='')
rollno

#variable gender
set.seed(108)
gender = sample(x=c('male', 'female'), size = 1000, replace = T, prob = c(0.5,0.5))
gender
head(gender)
table(gender)

#variable - buy: Decision
set.seed(1008)
buy = sample(x =c('Buy', 'NotBuy'), size = 1000, replace = T, prob = c(0.5, 0.5))
head(buy)
table(buy)

#create dataframe
students1 = data.frame(gender, buy)
rownames(students1) = rollno
head(students1)


#table
table(students1)
prop.table(table(students1))
addmargins(prop.table(table(students1)))


#model1
fit1 = rpart(buy ~ gender, data = students1, minsplit=4, minbucket=2)  #check what is minsplit, minbucket
fit1
summary(fit1)
rpart.plot(fit1)
rpart.plot(fit1, main='classification tree', nn=T, type=4, extra = 104)
