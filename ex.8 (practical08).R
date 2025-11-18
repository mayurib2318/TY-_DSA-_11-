# 1. Build a regression model predicting Petal.Length from Sepal.Length in iris.
model_q1 <- lm(Petal.Length ~ Sepal.Length, data = iris)
summary(model_q1) # View model results

# 2. Create a multiple regression model predicting mpg using wt, hp, and drat in mtcars.
model_q2 <- lm(mpg ~ wt + hp + drat, data = mtcars)
summary(model_q2)

# 3. Check the R^2 and Adjusted R^2 of the model in Q2.
# This information is automatically displayed in the summary output from Q2.
summary(model_q2)

# 4. Plot residuals of your regression model in Q1 and interpret the result.
# Running plot() on an lm object generates four diagnostic plots, including the residuals.
plot(model_q1) # You may need to press Enter/Return four times to cycle through plots

# 5. Build a regression model predicting Ozone using Temp from the airquality dataset.
model_q5 <- lm(Ozone ~ Temp, data = airquality)
summary(model_q5)