# 1. Check the structure of the built-in 'airquality' dataset.
str(airquality)


# 2. Find the total number of missing values (NAs) in 'airquality'.
sum(is.na(airquality))

# 3. Get the descriptive summary statistics for the 'mtcars' dataset.
summary(mtcars)

# 4. Find the mean horsepower (hp) in the 'mtcars' dataset.
mean(mtcars$hp)

# 5. Calculate the average Sepal.Width, grouped by each 'Species' in 'iris'.
tapply(iris$Sepal.Width, iris$Species, mean)
