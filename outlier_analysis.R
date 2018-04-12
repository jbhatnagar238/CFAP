#outlier analysis ----


marks= c(1:80, 100, 1000)
marks2= c(1:80, 100)
marks
par(mfrow=c(1,2))
boxplot(marks2) 
summary(marks2)
abline(h=c(1,21,41,41.23,61,100))
boxplot(marks)
abline(h=c(1.00,   21.25,   41.50 ,  52.93  , 61.75, 1000.00 ))
mean(marks2) ; mean(marks)
median(marks2) ; median(marks2)
summary(marks)

# 4 figures arranged in 2 rows and 2 columns
attach(mtcars)
par(mfrow=c(2,2))
plot(wt,mpg, main="Scatterplot of wt vs. mpg")
plot(wt,disp, main="Scatterplot of wt vs disp")
hist(wt, main="Histogram of wt")
boxplot(wt, main="Boxplot of wt")

#identify outlier ----
set.seed(482)
y =rnorm(100)
boxplot(y)
identify(rep(1, length(y)), y, labels=seq_along(y))
