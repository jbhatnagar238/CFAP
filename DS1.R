# Data structures in R

#Vectors----
v1 = c('A','B','C',1)     #create a vector
v1                        #print the vector
class(v1)                 #print class of Vector 
(v2 = c(1,2,3))           
class(v2)
(v3 =c(TRUE, FALSE, TRUE))
class(v3)
v4 = 100:200
v4
v5 = seq(1,10,2)
v5
v4; v5
v4 [c(1,3,4,101)]
-v4 [c(1,3,4,101)]
v4 [v4 > 150]
v7 = c('A' , 'C')
v7
v1
v1 [ v1 %in% v7]
v1 [ !v1 %in% v7]
length(v4)


#Matrix----
mym = matrix(1:24, ncol = 4, byrow = T)
mym

(mymat = matrix(1:100, nrow = 10, byrow = T))
mymat[2:4 , 3:4]
mymat

(mymat = matrix(1:24, nrow = 6, byrow = T))
rn = paste('R', 1:6, sep = '_')
cn = paste('C', 1:4, sep = '_')
dimnames(mymat) = list (c(rn), c(cn))
mymat

mymat[ 'R_1' , 'C_4' ]
mymat
colSums(mymat)
rowSums(mymat)
rowMeans(mymat)
colMeans(mymat)

#Arrays----
(myarray =array(101:124, dim = c(4,3,2)))
(myarray =array(101:124, dim = c(4,3,2), dimnames = list(c('S1', 'S2', 'S3', 'S4'), c('sub1', 'sub2', 'sub3'), c('Dept1', 'Dept2' ))))
myarray
apply(myarray, 2, sum)           #marks of all student in respective subject
apply(myarray, 1, sum)            #marks of each student in all subject   
apply(myarray, 3, sum)            #marks of all student of that dept in all subject
apply(myarray, c(2,3), mean)     #gives mean of subjective in departmentwise
apply(myarray, c(1,3), mean)      #mean of marks of each student in his subject with respect to department
apply(myarray, c(1,2), mean)      #mean of marks of students across department







#List----
listL1 = list (v1, students, mymat, myarray, 'dhiraj')
listL1



#Factors----
name =c('S1', 'S2', 'S3', 'S4', 'S5')
course = c('PHD', 'MTECH', 'BTECH', 'BTECH', 'PHD')
gender = c('M', 'F', 'M', 'F', 'M')
grades = c('A', 'B', 'C', 'A', 'F')
marks = c(runif(5,50,100))
df = data.frame(name, course, gender, grades, marks)
df
str(df)
df[1:2,]
df[,1:3]
df$course
df$grades
df$name = as.character(df$name)
str(df)
df$grades = factor(df$grades, ordered = T, levels = c('A', 'B', 'C', 'D', 'E', 'F'))      #ordered= t then order will be there if ordered =f then no order
str(df)
df$grades

#DataFrames----
rollno = c(1,2,3)
name = c('rohit', 'lalit', 'hitesh')
course = c('MBA', 'BBA', 'MCA')
dept = c('Dept1', 'Dept1', 'Dept2')
marks =floor(rnorm(3,50,10))
students = data.frame(rollno, name, course, dept, marks)
students
class(students)
str(students)
summary(students)


df = data.frame(rollno= c(1,2,3),name= c('rohit', 'lalit', 'hitesh'),course= c('MBA', 'BBA', 'MCA') , dept= c('Dept1', 'Dept1', 'Dept2'), marks= floor(runif(3,50,100)))
df






