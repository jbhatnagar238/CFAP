#generating data

rollno = paste('s', 1:30, sep='')
rollno

name = paste('Student', 1:30, '- xyz', sep = '')
name

set.seed(12)
married = sample(c('True', 'False'), size=30, replace = T)
married

set.seed(13)
gender = sample(c('M', 'F'), size=30, replace = T)
gender

set.seed(14)
course = sample(c('BTech', 'MTech', 'PhD'), size = 30, replace = T, p=c(0.5, 0.3, 0.2))
course

age1 = runif(30, min = 20, max = 40)  #floor, ceilling, trunked, round
age = round(age1, digits = 0)
age

#ageX = round(runif(30, min = 20, max = 40), digits = 0)
#ageX

marks1 = rnorm(30, mean = 60, sd = 30)
marks = round(marks1, digits = 0)
marks

df = data.frame(rollno, name, gender, age, course, marks, married)
df




#method 1 for sample data
sample(nrow(df), 3)
(df1 = df[sample(nrow(df), 3), ])
(df2 = subset(df, gender=='F' & age>25, select= c(rollno, name)))

#method 2 for sample data
library(dplyr)
(df3 = sample_n(df, 10))
(df4 = sample_frac(df, 0.3))
(df5 =df[which(gender=='F' & age>25),])
(df6 =df[which(gender=='F' | age>25),])


#method3 for sample data
library(caTools)
set.seed(2000)
split = sample.split(df, SplitRatio = 0.75)
training_set = subset(dataset, split==T)
testset = subset(dataset, split==F)
class(testset)
dim(training_set) ; dim(testset)
nrow(testset) ; nrow(training_set)
length(dataset)
length(dataset$age)

write.csv(df, './Data/students3.csv')

library(xlsx)
write.xlsx(df, './Data/students3.Xlsx', sheetName ="IITG1", row.names =F, append = T)
