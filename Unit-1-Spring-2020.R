# UNIT-1 PRACTICE
install.packages(c("brew", "countrycode", "devtools", "googleVis", "knitr", "MCMCpack", "repmis", "RCurl", "rmarkdown", 
                   "textreg", "WDI", "xtable", "Zelig"))
sessionInfo()
library(formatR)
View(formatR)
Number <- 10
Number
Words <- "Hello World"
class(Words)

## Vectors
NumericVect <- c(2.8, 2, 14.8)
# Show NumericVect's contents
NumericVect
CharacterVect <- c("Albania", "Botswana", "Cambodia")
# Show CharacterVect's contents
CharacterVect

#Binding NumericVect & CharacterVect using cbind
StringNumObject <- cbind(CharacterVect, NumericVect)
StringNumObject

#Dataframes
StringNumObject <- data.frame(CharacterVect, NumericVect)
StringNumObject

#Names Command in data frame
names(StringNumObject)

#Reassign row names
row.names(StringNumObject) <- c("First", "Second", "Third")
# Display new row names
row.names(StringNumObject)

#find mean of CharacterVect
mean(StringNumObject$CharacterVect)

# 3.1.2 Component Selection - the $ sign is called the Component Selector
NewNumeric <- StringNumObject$NumericVect
NewNumeric
# Its very important to know how to use Compoent Selector  to make tables for presentation documents

#attach and with
attach(cars)
#display speed
head(speed)
head(dist)
detach(cars)
#with command
with(StringNumObject, {
  mean(NumericVect)
}
)

#Subscripts
head(cars)
cars[3:7,]
cars[4, 2]
cars[4, "dist"]
cars[4, c("speed", "dist")]

# 3.1.4 Functions and Commands
NumericVect
mean(x = NumericVect)
MeanNumericVect <- mean(x = NumericVect)

#3.1.5 Arguments - arguments modify what commands above do
?command
?mean

# # Round command - rounds a vector of numbers
# # round MeanNumbericVect to one decimal type
# round(x = MeanNumericVect, digits = 1)
# round(mean(NumericVect), digits = 1) # stacking arguments inside arguments - thisis difficult to read
# #therefore we can use piping function to make the code more easily understandable %>%
# # the basic idea of pipe function is that the output  of one function is set as the first argument of the next
# 
# #find mean of NumericVect using Pipe function
# # For %>% load Magrittr package
# #Find mean of NumericVect and round to 1 decimal place
# mean(NumericVect) %>% round(digits = 1)
# 
# #3.1.6 Workplace and History
# #Use ls command to list all objects in your current workspace
# ls()
# 
# # removing specific objcts from workspace using rm command
# rm(CharacterVect, Words)
save.image(file = "DecemberWorkspace.RData")
load(file = "DecemberWorkspace.RData")
save(Comp, file = "Comp.RData") #giving error
history()
library(ggplot2)
ggplot2::qplot(...)
y <- as.character("0.7")
as.numeric(y)
opt

changethisstupid <- c(5.6, 9.6, 3.4)
options(digits = 9)
changethisstupid
%%
  % StringNumObject <- cbind(CharacterVect, NumericVect)
%%
  
  3+5
x = c(1, 2, 3, 4)
x
plot(x)

---
  title: "Unit 1 R Markdown"
author: "Rinku"
date: "1/5/2020"
output:
  html_document: default
word_document: default
---
  
  ```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

# UNIT 1 R Review Part 1.R
## Manipulation and Import

### R Data Manipulation and Data Import
```{r}

#Vectors
age = c(22,21,24,19,20,23)
age
age[2]
yrs_math_ed = c(4,5,2,5,3,5)
yrs_math_ed

#data frames
df1 = data.frame(Age = age, Years = yrs_math_ed)
df1
df1[4,2] #Data in the 4th row and 2nd column
df1[1,] #all the data in the 1st row
df1$Math_Level #all the data in the fourth column
str(df1)
```

### Add a two more columns (variables).
```{r}
a = c("Mary","Martha","Kim","Kristen","Amy","Sam")
b = c("English","Math","Sociology","Math","Music","Dance")

#Make a data frame
df2 = data.frame(Name = a, Major = b)
df2
str(df2)
```

### Put it together 
```{r}
#Make another data frame
df3 = data.frame(Age = age, Years = yrs_math_ed,Name = a, Major = b)
df3
```

### Doing it a different way
```{r}
#Cbind combines columns
df4 = cbind(df1,df2)
df4
```

### Checking variable classes
```{r}
#str and class show what type of variable it is
str(df4)
class(df4$Name)
summary(df4)
```

### Define and try and add a new row (student)
```{r}
#define a new row / student
d = c(19,4,"John","Math")

#attempt to add a row
df5 = rbind(df4,d) #problem here is that Name and Major are factors
```


### Try and fix the problem.
```{r}
#try and fix the problem
dfCopy = df4
dfCopy$Name = as.character(df4$Name)
dfCopy$Major = as.character(df4$Major)
summary(dfCopy)
```

### Try and add the student again.
```{r}
#add the student to the end of the data frame.
df5 = rbind(dfCopy,d)
df5
```

### Look at the classes again.
```{r}
#recheck the class
str(df5)
summary(df5)
```

### Return/assign the right class to each variable.
```{r}
#fix the classes 
df5$Age = as.numeric(df5$Age)
df5$Years = as.numeric(df5$Years)
summary(df5)
df5$Name = as.factor(df5$Name)
df5$Major = as.factor(df5$Major)
summary(df5)
```

### Filtering
```{r}
#Filter the data frame
#All students with more than 4 years of Math
df5[df5$Years > 4,]
#All students with more than 4 years of Math and are 21 years of age or older
df5[(df5$Age >= 21 & df5$Years > 4), ]
#All students that are majoring in Math
df5[df5$Major == "Math",]
```

### Data Import from csv
```{r}
#Example1 = read.csv("/Users/bivin/Desktop/OLD COMPUTER ARCHIVES/KadAfrica/MSDS/DDS/DDS2/Unit 1 Git-ing Sta-R-ted/Datasets/BusinessSales.csv",header = TRUE)
# Example1$sales
Example1 = read.csv("/Users/Rinku/workspace/Rinku-MDS-6306-Doing-Data-Science/Unit 1/BusinessSales.csv")
Example1
Example1$sales

#BASIC PLOT FUNCTIONS
Example2 = read.csv(file.choose(), header = TRUE)
Example2$sales
### Scatterplots
```{r}
#plot(x,y,col,pch,type,ylab,xlab,main)
plot(Example1$ad_tv,Example1$sales, pch = 15,xlab = "TV Advertising $$$",ylab = "Sales $$$", main = "Sales v. Advertising")
abline(h = 55, col = "red",lwd = 5)
head(Example1)

### plotting wth mpg
```{r}
mpg
plot(mpg$hwy,mpg$cty,pch = 15) #NO LABLES ... AHHH!!!
plot(mpg$hwy,mpg$cty,pch = 15, main = "City MPG v. Highway MPG", ylab = "City MPG", xlab = "Highways MPG")

iris
#plot(Petal.Length, Sepal.Length)
# INCORRECT plot(Petal.Length$Sepal.Length, xlab = "Petal Length", ylab = "Sepal Length", main = "Iris Data")
#CORRECT
plot(iris$Sepal.Length,iris$Petal.Length, main = "Petal Length v Sepal Length", xlab = "Petal Length", ylab= "Sepal Length") #note domain and range of plot

### plot only viginica
```{r}
irisVir = iris[iris$Species == "virginica",]
plot(irisVir$Sepal.Length,irisVir$Petal.Length, col = "blue", ylim = c(0,7), xlim = c(4,8))
irisVers = iris[iris$Species == "versicolor",]
points(irisVers$Sepal.Length,irisVers$Petal.Length, col = "Red")
irisSet = iris[iris$Species == "setosa",]
points(irisSet$Sepal.Length,irisSet$Petal.Length, col = "green")

dev.off()
```

### histograms
```{r}
hist(mpg$cty,col = "blue", main = "Histogram of City MPG")

### boxplots
```{r}
boxplot(cty~class, data = mpg, main = "Boxplot: City MPG v. Class")
boxplot(mpg$cty~mpg$class, main = "Boxplot: City MPG v. Class")
```

### clearing the plot space
```{r}
dev.off()
```

### Dividing the plot space!  c(num rows, num columns)
```{r}
par(mfrow = c(1,2))

hist(mpg$cty,col = "blue", main = "Histogram of MPG", xlab = "MPG")
boxplot(cty~class, data= mpg, main = "Boxplot of MPG by Class", xlab = "Cylinder")
```

### You Try it! Make a histogram of the Iris Sepal Lengths
### Comment on the distribution (skewness?  number of modes? etc.)
hist(iris$Petal.Length, col = "pink", main = "Histogram of Iris Sepal Lengths")


# ```{r}
# hist(iris$Petal.Length, col = "blue", main = "Histogram of Iris Sepal Lengths")
# ```
dev.off()

### barplot
#BARPLOT OF MY DATA SCIENCE PROFILE
### barplot
dev.off()
```{r}
yrs_datascience_ed = c(2,3,1,0.5,0.2,0.6)
name = c("Rinku Lichti")
subject = c("Python","Computer Science","Statistics","Machine Learning","Domain Expertise","Mathematics")
df6 = data.frame(Years = yrs_datascience_ed, Name = name, Subject = subject)
barplot(df6$Years, names.arg = df6$Subject, ylab = "Years of Experience", main = "Rinku Lichti's Data Science Profile", col = "orange")

```{r}
age = c(22,21,24,19,20,23)
yrs_math_ed = c(4,5,2,5,3,5)
names = c("Mary","Martha","Kim","Kristen","Amy","Sam")
subject = c("English","Math","Sociology","Math","Music","Dance")

df3 = data.frame(Age = age, Years = yrs_math_ed, Name = names, Subject = subject)

barplot(df3$Years, names.arg = df3$Name, ylab = "Math Years", main = "Math Years")
```

### We want a barplot of frequency of each class of car.
###note here how the data is in a different format for mpg.
###it is not one row per relevant observation with the value at the end
###we need to actually count the number of each class and then plot

### We could count ... that would take a while

### We could turn class into a factor and then let summary count for us.
```{r}
dev.off()
mpg
summary(mpg$class)

mpg$classFact = as.factor(mpg$class)
head(mpg)
summary(mpg$classFact)

barplot(summary(mpg$classFact, main = "Number of each class"))
```

# UNIT 1 R Review Part 3.R
## Statistics in R

### Sampling Distribution of the Individual
```{r}
#draw a sample from a standard normal distribution
#run many times varying sample size and look at histogram and mean
sample1 = rnorm(1000,0,1) # draw a sample from a ND with a mean of 0 and SD of 1
hist(sample1)
mean(sample1)
sd(sample1)
```

### Another way to code the same thing
```{r}
population = rnorm(10000000,0,1) #note the number of draws here
hist(population)
sample1 = sample(population,100) #sample of size 100
hist(sample1)
mean(sample1)
sd(sample1)
```

### Sampling Distribution of the Sample Mean
now make a function in which you pass the sample size, the number of samples to take #and thus the number of sample means to return as well as the mean and sd.  

Define these outside the function so that they exist outside the function (global)
  
  ```{r}
xBarVec = c() #Global vector to hold the sample means
population = rnorm(10000000,0,1) #Simulating the population
```

### The Function
```{r}
#####################################################
# Function: xbarGenerator
# Arguments: samplesize: the size of the sample that each sample mean is based on. 
#            number_of_samples: the number of samples and thus sample means we will generate
# Author: Bivin Sadler
#####################################################

xbarGenerator = function(sampleSize = 30,number_of_samples = 100)
{
  for(i in 1:number_of_samples)
  {
    theSample = sample(population,sampleSize)
    xbar = mean(theSample)
    xBarVec = c(xBarVec, xbar)
  }
  return(xBarVec)
}

### Before you Run This.... What do you think will be the "Sampling Distribution of the Sample Mean"?
xbars = xbarGenerator(30,1000)
length(xbars)
hist(xbars)

# ## You Try It
# Now adapt the code above to generate a specified number of sample means of a specified size sample size 
#(this has already been done) from a normally distributed population with a specified mean and standard 
#deviation (currently it is forced to be from a standard normal distribuion N(0,1)).
# Run it a few times and use it generate 10000 sample means, each from a sample of size 50, from a normal 
#distribution with mean = 60 and sd = 10.  Provide a distribution (histogram) of the distrubtions as well. 
# What is the shape of the distribuion?  What is the mean and sd?  What should they be given the Central Limit 
#Theorem (CLT).  For a refresher of the CLT see the Stats Bridge Course!

xbarGenerator = function(sampleSize = 50,number_of_samples = 100, mean = 0, sd = 1)
{
  for(i in 1:number_of_samples)
  {
    theSample = rnorm(sampleSize,mean, sd)
    xbar = mean(theSample)
    xBarVec = c(xBarVec, xbar)
  }
  return(xBarVec)
}

### Before you Run This.... What do you think will be the "Sampling Distribution of the Sample Mean"?
xbars = xbarGenerator(50,1000, 60, 10)
hist(xbars)
summary(xbars)
sd(xbars)
10/sqrt(50)



#Possibe Solution
```{r}
xBarVec = c() #global vector to hold the sample means
#####################################################
# Funciton: xbarGenerator (Updated)
# Argements: samplesize: the size of the sample that each sample mean is based on. 
#            number_of_samples: the number of samples and thus sample means we will generate
# Author: Bivin Sadler
#####################################################
xbarGenerator2 = function(sampleSize = 30,number_of_samples = 100, mean = 0, sd = 1)
{
  for(i in 1:number_of_samples)
  {
    theSample = rnorm(sampleSize,mean,sd)
    xbar = mean(theSample)
    xBarVec = c(xBarVec, xbar)
  }
  return(xBarVec)
}

xbars = xbarGenerator2(60,1000,50,10)
hist(xbars)
summary(xbars)
sd(xbars)
10/sqrt(60)
```


pairs(~mpg+disp+drat+wt,data=mtcars, main="Simple Scatterplot Matrix")

dfsg


