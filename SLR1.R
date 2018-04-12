#Simple Linear Regression : IIT Gauhati
# Regression : Areas vs Sales

#Method1 : creating data from Vectors
#X -is area sqft Y-sales in 1000s units; Find relationship betn X & Y
X = c(1.7,1.6,2.8,5.6,1.3,2.2, 1.3,1.1,3.2,1.5,5.2,4.6,5.8,3 )
Y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1 )

#create a data frame from X & Y
df1 = data.frame(X = c(1.7,1.6,2.8,5.6,1.3,2.2, 1.3,1.1,3.2,1.5,5.2,4.6,5.8,3 ), Y = c(3.7,3.9,6.7,9.5,3.4,5.6,3.7,2.7,5.5,2.9,10.7,7.6,11.8,4.1 ) )
df1
#first few values

#2nd method of importing data
#import from ggsheet  #pickup the correct url
library(gsheet)

#df2 = 
#first few values

#Third method of importing data from CSV file
df3 = read.csv("./Data/slr1.csv")
df3

#first few values

#Method4 for importing from CSV file with choose
df4 = read.csv(file.choose())
df4
#first few values

# Use Vector Data or method used to import data
#make one of the DF active
df = df1
df
#Find mean, sum of X & Y, Covariance, Correlation  ----
names(df)
sum(df$X) ;sum(df$Y)
mean(df$X) ; mean(df$Y)
cov(df$X, df$Y) ; cov(df$Y, df$X)         #covarience know what's this
cor(df$X, df$Y) ; cor(df$Y, df$X)         #corelation know what's this


#plot X & Y ----
plot(X,Y)
plot(df$X,df$Y)
plot(x = df$X, y = df$Y, xlab='Area in sqft', ylab = 'Sales Amount', type = 'p', ylim = c(0, max(df$Y)), main = 'Plot of Area Vs sales', xlim = c(0, max(df$X)), col='red', pch =15)

#draw abline/ prediction line ----
abline(Y,X)
abline(lm(df$Y~df$X), lty=3, lwd=4, col='green')
abline(v=c(3,5,5.5), h=c(6,8,10), col=c('red', 'blue', 'peachpuff4'))    #straight lines on X & Y axis

min(df$X)
range(df$X)
#Linear Model fit= lm(Y~X, data=)
fit1 = lm(Y ~ X, data=df)
fit1
summary(fit1)          #R-squared => gives % of change in Y explained by X, *F-statistic p-value <0.05, there exists a model to predict Y, atleast 1 of X which can explain variation in Y
names(fit1)
coef(fit1) [2]   #slope of line
coefficients(fit1)
fitted(fit1)         #fitted providing predicted value

#Print the Model, Summary, Coeff, Residuals


#understand the model values - R2, AdjR2, FStats, Residuals, Coeff p values - IMP STEP

#output of variable Names

#Print Slope value


#combine the data with Ypredicted, errors
cbind(df, fitted(fit1), fitted(fit1)-df$Y,residuals(fit1))
# Predictions
(Y = 0.9645 + 1.6699 * 4)  # Predict Y for X=4
(Y = coef(fit1)[1] + coef(fit1)[2] * 4)  # for X=4 using values from output of LM 

fitted(fit1)
cbind(df, fitted(fit1))  # combine data with predicted values
range(df$X)  #min to max value of X: area

# Create a Data Frame with sample values of X
new1 = data.frame(X=c(1.5, 2.3, 4.5))        #sample data for X for prediction, should be between the range of X values
new1
#prediction data should be in the form of Data Frame

#Predict

predict(fit1, newdata= new1) # Predict Function for 4 values of X
#fitted(fit1) is equal to predict function using original X values
cbind(new1, predictedY = predict(fit1, newdata= new1))

df$X
predictY = predict(fit1, newdata= data.frame(X=df$X))
cbind(df, predictY, fitted(fit1))
cbind(df, predictY)
library(forecast)
accuracy(fit1)


summary(fit1)
summary(fit1)$sigma  #Residual Std Error SD along the LM Line


#Assumption : Graphical Analysis : IMP STEP
plot(fit1, which = 1)
plot(fit1)
plot(df$X, df$Y) # plot of Y & X
plot(x=df$X, y=residuals(fit1)) # Linearity plot of residuals & X # No pattern for assumption that there is linearity betw X & Y
abline(h=0)
plot(residuals(fit1))

#Auto Collinearity : relation between successive values of Y
car::durbinWatsonTest(fit1)      #durbinWatsonTest to check corelation
#pvalue > 0 : Do not reject Ho that there is no correlation
#if P-value < 0.05 reject null hypothesis, if p-value>0.05 acept null-hypothesis
#null hypothsis is No auto-correlation


#Normality of residuals  - bell shaped curve
hist(residuals(fit1)) #distribution of Residuals

hist(residuals(fit1), freq=F)
lines(density(residuals(fit1)))

#histogram values to show how hist rectangle are created
(h=hist(residuals(fit1)))
names(h)
cbind(h$breaks, h$counts)

#Normality Plot to check assumptions of LM
qqnorm(residuals(fit1))
qqline(residuals(fit1))

#Equal Variance : 4th Assumption : homoscedasticity
plot(y=residuals(fit1), x=df$X)
abline(h=0)  #Variance across all x values is almost constant


#Outlier Analysis

boxplot(residuals(fit1), names=c('Residuals'))
identify(rep(1, length(residuals(fit1))), residuals(fit1), labels = seq_along(residuals(fit1)))

car::outlierTest(fit1)

car::outlierTest(lm(Y ~ X, data=df[-c(14,12),]))


