#Logistic Analysis

dataset =read.csv(file.choose())
dataset = read.csv('./Data/logr2.csv')
dataset
summary(dataset)

#split the dataset into training set and test set

library(caTools)
set.seed(2000)
split = sample.split(dataset$purchased, SplitRatio = 0.75)
training_set = subset(dataset, split==T)
testset = subset(dataset, split==F)
class(dataset$gender)
dim(training_set) ; dim(testset)
nrow(testset) ; nrow(training_set)
length(dataset)
length(dataset$age)


#fitting logistic regression to training set
logitmodel1 = glm(purchased ~ gender + age + salary, family = binomial, data = training_set)
summary(logitmodel1)

#dropping insignificant in logistic regression
logitmodel2 = glm(purchased ~  + age + salary, family = binomial, data = training_set)
summary(logitmodel2)   #AIC is slightly more but less no. of variables

test_set2 = data.frame((age = c(40,65)), salary = c(40000,50000))
test_set2
prob_pred2 = predict(logitmodel2, type = 'response', newdata =test_set2)
prob_pred2
cbind(test_set2, prob_pred2)


#predicting data from testset
testset
prob_pred = predict(logitmodel2, type ='response', newdata= testset)
df_prob_pred = as.data.frame(prob_pred)
summary(df_prob_pred)
head(df_prob_pred)

y_pred = ifelse(prob_pred > 0.5, 1, 0)
y_pred
sum(y_pred)
sum(!y_pred)
sum(testset$purchased)

cbind(testset$purchased, y_pred)

#making the confusion matrix
cm =table(testset[,5], y_pred)           #cm gives t-t, t-f, f-t, f-f values in form of matrix
cm
library(caret)
caret::confusionMatrix(cm)
