mtcars
?mtcars
data()    #available dataset in R
class(mtcars)
str(mtcars)
summary(mtcars)

names(mtcars)
mtcarsfit1 = lm(mpg ~ cyl + disp + hp +  drat +  wt +  qsec + vs + am + gear + carb, data=mtcars)
summary(mtcarsfit1)                

mtcarsfit2 = lm(mpg ~ . , data=mtcars)
summary(mtcarsfit2)                


library(MASS)
(model1a = lm(mpg ~ . , data =mtcars ))
(model1b = lm(mpg ~ 1 , data =mtcars ))   #1 is used to not take any other variable

summary(model1a)
summary(model1b)


stepboth = stepAIC(model1a, direction = "both")
fit1 = lm(mpg ~ wt + qsec + am, data = mtcars)
summary(fit1)


stepboth = stepAIC(model1b, direction = "forward", )


library(olsrr)
names(mtcars)
model <- lm(mpg ~ disp+hp+wt+qsec, data = mtcars )
k <- ols_step_all_possible(model)
plot(k)
k
