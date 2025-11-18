# 1. Create a histogram of mpg from the mtcars dataset.
hist(mtcars$mpg)

# 2. Generate a scatterplot of hp vs wt from mtcars.
plot(mtcars$wt, mtcars$hp) # Typically x-variable first (weight) then y-variable (horsepower)

# 3. Draw a boxplot of Ozone values from the airquality dataset.
boxplot(airquality$Ozone)

# 4. Find the correlation between Sepal.Length and Sepal.Width in iris.
cor(iris$Sepal.Length, iris$Sepal.Width)

# 5. Create a pair plot of the first four columns of mtcars.
# 'pairs' creates a scatterplot matrix.
pairs(mtcars[, 1:4])