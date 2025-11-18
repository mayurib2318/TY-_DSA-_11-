
# The 'mtcars' dataset is built into R.
print("1. First 15 rows of mtcars")
head(mtcars, 15)

# 2. .
# The 'iris' dataset is also built into R.
print("2. Max and Min Sepal.Length in iris")
max_sepal <- max(iris$Sepal.Length)
min_sepal <- min(iris$Sepal.Length)
print(paste("Maximum Sepal.Length:", max_sepal))
print(paste("Minimum Sepal.Length:", min_sepal))

# 3. 
print(" 3. Mean of mpg in mtcars ")
mean_mpg <- mean(mtcars$mpg)
print(paste("Mean MPG:", mean_mpg))

# 4. Display the structure of the airquality dataset.
# The 'airquality' dataset is built into R.
print(" 4. Structure of airquality dataset ")
str(airquality)

# 5. Check whether the number 100 is greater than 50 in R.
print(" 5. Logical Check: 100 > 50 ")
logical_check <- 100 > 50
print(logical_check)
