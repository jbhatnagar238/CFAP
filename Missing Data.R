#Missing Values

v1 =c(1,2,3,NA,NA,6)
v1
is.na(v1)   #tells whether there are missing values
sum(is.na(v1))          #tells how many missing values
mean(v1)
mean(v1, na.rm=T)      #na.rm removes the values
v1a = na.omit(v1)
v1a
sum(v1a) ; mean(v1a) ; median(v1a) ; mode(v1a) ; range(v1a)
mean(v1, na.rm=T)

v1[is.na(v1)] = mean(v1, na.rm=T)
v1


library(VIM)
data(sleep, package = VIM)

head(sleep)
dim(sleep)
complete.cases(sleep)
sum((complete.cases(sleep)))        #gives no. of complete cases
sum((!complete.cases(sleep)))       #gives no. of incomplete cases

sleep[complete.cases(sleep),]
sleep[!complete.cases(sleep),]


is.na(sleep$Dream)
sum(is.na(sleep$Dream))
colSums(is.na(sleep))
rowSums(is.na(sleep))

library(mice)
mice :: md.pattern(sleep)

#visualisation ----
VIM:: aggr(sleep, prop = F, numbers = T)
