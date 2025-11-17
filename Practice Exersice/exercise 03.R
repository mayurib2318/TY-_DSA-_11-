
library(ggplot2)

library(dplyr)
library(boot)
library(arules)


data(mtcars)

mpg_mean <- mean(mtcars$mpg)
mpg_median <- median(mtcars$mpg)
mpg_var <- var(mtcars$mpg)
mpg_sd <- sd(mtcars$mpg)
mpg_range <- range(mtcars$mpg)

mpg_mode <- as.numeric(names(sort(table(mtcars$mpg), decreasing=TRUE)[1]))

mpg_mean; mpg_median; mpg_mode; mpg_var; mpg_sd; mpg_range

table(mtcars$cyl)

hist(mtcars$mpg, freq = FALSE, main = "MPG Histogram with Density")
lines(density(mtcars$mpg), col="red", lwd=2)

boxplot(mpg ~ cyl, data = mtcars, main = "MPG by Cylinders")

summary(mtcars)

data(iris)

mu <- mean(iris$Sepal.Length)
sigma <- sd(iris$Sepal.Length)

x <- seq(min(iris$Sepal.Length), max(iris$Sepal.Length), length=200)
plot(x, dnorm(x, mean=mu, sd=sigma), type="l", main="Normal Curve")

shapiro.test(iris$Sepal.Length)

binom_sample <- rbinom(1000, size=10, prob=0.5)
hist(binom_sample, main="Binomial Distribution")

sample_mean <- mean(binom_sample)
sample_var <- var(binom_sample)

theoretical_mean <- 10 * 0.5
theoretical_var <- 10 * 0.5 * 0.5

sample_mean; sample_var; theoretical_mean; theoretical_var


t.test(mtcars$mpg, conf.level = 0.95)

boot_fn <- function(data, idx){ mean(data[idx]) }
boot_hp <- boot(mtcars$hp, boot_fn, R=1000)
boot.ci(boot_hp, type="norm")

auto <- mtcars %>% filter(am==0)
manual <- mtcars %>% filter(am==1)
t.test(auto$mpg, manual$mpg)


# 
titanic <- read.csv(file.choose(), header=TRUE)

t.test(iris$Sepal.Length, mu=5.5)

t.test(mtcars$mpg ~ mtcars$am)

tbl <- table(titanic$Survived, titanic$Sex)
chisq.test(tbl)

anova_model <- aov(Sepal.Length ~ Species, data = iris)
summary(anova_model)
TukeyHSD(anova_model)


cor(mtcars$mpg, mtcars$hp)

plot(mtcars$hp, mtcars$mpg, main="MPG vs HP")
abline(lm(mpg ~ hp, data=mtcars), col="red")

cor_matrix <- cor(mtcars)
cor_matrix

cor.test(iris$Sepal.Length, iris$Petal.Length, method="spearman")

data("Adult")
rules <- apriori(Adult, parameter=list(supp=0.5, conf=0.8))
inspect(head(rules))

# 
titanic$Sex <- as.factor(titanic$Sex)
titanic$Pclass <- as.factor(titanic$Pclass)
titanic$Survived <- as.factor(titanic$Survived)

log_model <- glm(Survived ~ Age + Sex + Pclass, data=titanic, family="binomial")
summary(log_model)
exp(coef(log_model))

# 
lm_model <- lm(Petal.Length ~ Sepal.Length, data=iris)
summary(lm_model)
plot(iris$Sepal.Length, iris$Petal.Length)
abline(lm_model, col="blue")
plot(resid(lm_model), main="Residual Plot")

# 
data_scaled <- scale(mtcars[, c("mpg", "hp", "wt")])
km <- kmeans(data_scaled, centers=3)
plot(data_scaled, col=km$cluster, main="K-means Clusters")
points(km$centers, col=1:3, pch=19, cex=2)
