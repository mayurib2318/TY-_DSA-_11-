# 1. Perform a one-sample t-test to check if the mean mpg in mtcars differs from 20.
t.test(mtcars$mpg, mu = 20)

# 2. Compare Petal.Width across species in iris using ANOVA.
anova_result <- aov(Petal.Width ~ Species, data = iris)
summary(anova_result)

# 3. Find the correlation between mpg and hp in mtcars.
cor(mtcars$mpg, mtcars$hp)

# 4. Perform a paired t-test on Sepal.Length and Sepal.Width in iris.
t.test(iris$Sepal.Length, iris$Sepal.Width, paired = TRUE)

# 5. Check if Ozone and Temp in airquality are significantly correlated.
# 'use="complete.obs"' handles the missing values (NAs) in the data.
cor.test(airquality$Ozone, airquality$Temp, use = "complete.obs")