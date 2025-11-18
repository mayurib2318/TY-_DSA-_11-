# 1. Bin Sepal.Length into Short, Medium, Long (terciles).
iris$Sepal.Length_Cat <- cut(iris$Sepal.Length,
                             breaks = quantile(iris$Sepal.Length, probs = c(0, 1/3, 2/3, 1)),
                             labels = c("Short", "Medium", "Long"),
                             include.lowest = TRUE)

# 2. Convert Species to dummy variables.
dummy_vars <- model.matrix(~ Species - 1, data = iris)
iris <- cbind(iris, dummy_vars)

# 3. Define Min-Max Normalization function and apply to mpg.
min_max_norm <- function(x) {
  return ((x - min(x)) / (max(x) - min(x)))
}
mtcars$mpg_norm <- min_max_norm(mtcars$mpg)

# 4. Standardize Sepal.Width (Z-score).
iris$Sepal.Width_Std <- scale(iris$Sepal.Width)

# 5. Create new feature: efficiency = mpg / hp.
mtcars$efficiency <- mtcars$mpg / mtcars$hp