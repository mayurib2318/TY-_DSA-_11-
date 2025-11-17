# 1. Create Variables to store:

#Your Name (character)
name <- "mayuri"
#Your age (numeric)
age <- 20
#Whether you are a student (logical)
student <- TRUE

# 2. Create a vector containing the numbers 1 to 10.

v1 <- c(1,2,3,4,5,6,7,8,9,10)

# 3. Create a sequence from 5 to 50 with a step size of 5.

seq1 <- seq(5,50,by=5)

# 4. Store the names of 5 fruits in a character vector and display the second and fourth fruit.

seqFruits <- c("Apple","Banana","Orange","Guava","Papaya")
seqFruits[2]
seqFruits[4]
seqFruits[c(2,4)]

# 5. Create a numeric vector of 10 random numbers between 1 and 100, then find:

seqRandom <- sample(1:100, 10)
print(seqRandom)

# a. Maximum, Minimum & Mean Value
max(seqRandom)
min(seqRandom)
mean(seqRandom)

# 6. Create a data frame with columns: Name, Age, Marks. Enter at least 5 records.

df <- data.frame(
  Name = c("Mayuri", "Borkar", "1", "2", "3"),
  Age = c(20, 21, 19, 22, 20),
  Marks = c(85, 92, 78, 88, 95)
)

# 7. Write code to sort the data frame by Marks in descending order.

sortedDF <- df[order(-df$Marks), ]
# 2. Operators in R:-

10+5
10 - 5
10 * 5
10 / 5
10 %% 3
10 %/% 3

15>10
7==7

a <- c(2, 4, 6, 8)
b <- c(1, 3, 5, 7)

a+b
a-b
a*b

a[a>5]
b[b<=4]

 5 %in% a
#6
x <- c(TRUE, FALSE, TRUE, FALSE)
y <- c(TRUE, TRUE, FALSE, FALSE)
x&y
x|y
!x
!y
#3 loops 
#1 
for(i in 1:10){
  print(i)
}
#2 
i <- 1
sum <- 0

while(i <= 100){
  sum <- sum + i
  i <- i + 1
}

print(sum)i <- 1
sum <- 0

while(i <= 100){
  sum <- sum + i
  i <- i + 1
}

print (sum)
#3 
for(i in 1:50){
  if(i %% 2 == 0){
    print(i)
  }
}
#4
for(i in 1:10){
  print(paste("7 x", i, "=", 7*i))
}

#5
n <- 8  
fact <- 1

for(i in 1:n){
  fact <- fact * i
}

print(fact)
#6
for(i in 1:4){
  for(j in 1:i){
    cat("*")
  }
  cat("\n")
}
# 4. Conditionals in R:-
num <- -5  
if (num > 0) {
  print("The number is positive")
} else if (num < 0) {
  print("The number is negative")
} else {
  print("The number is zero")
}

num <- 7  
if (num %% 2 == 0) {
  print("The number is even")
} else {
  print("The number is odd")
}

year <- 2024  
if ((year %% 4 == 0 && year %% 100 != 0) || (year %% 400 == 0)) {
  print("The year is a leap year")
} else {
  print("The year is not a leap year")
}

marks <- 45  
if (marks >= 40) {
  print("Pass")
} else {
  print("Fail")
}

marks <- 85  
if (marks >= 90) {
  print("Grade: A")
} else if (marks >= 75) {
  print("Grade: B")
} else if (marks >= 60) {
  print("Grade: C")
} else {
  print("Grade: Fail")

  

# 5. Functions in R:-
  # 1. Add two numbers
  a <- 5
  b <- 3
  sum_result <- a + b
  print(sum_result)
  
  # 2. Square a number
  n <- 4
  square_result <- n * n
  print(square_result)
  
  # 3. Factorial of a number using recursion
  num <- 5
  factorial_result <- 1
  for (i in 1:num) {
    factorial_result <- factorial_result * i
  }
  print(factorial_result)
  
  # 4. Check if a number is prime
  num_to_check <- 7
  is_prime <- TRUE
  if (num_to_check <= 1) {
    is_prime <- FALSE
  } else {
    for (i in 2:(num_to_check - 1)) {
      if (num_to_check %% i == 0) {
        is_prime <- FALSE
        break
      }
    }
  }
  print(is_prime)
  
  # 5. Calculate mean, median, and standard deviation of a vector
  vector <- c(1, 2, 3, 4, 5)
  mean_result <- mean(vector)
  median_result <- median(vector)
  sd_result <- sd(vector)
  
  print(mean_result)
  print(median_result)
  print(sd_result)
  
  # 6. Find the top 5 highest values in a column of a data frame
  data <- data.frame(scores = c(90, 85, 95, 88, 92, 99, 73))
  sorted_scores <- sort(data$scores, decreasing = TRUE)
  top_5_scores <- head(sorted_scores, 5)
  print(top_5_scores)
  
  rm(list = ls())
  
#6 Data analysis - Adult Dataset
  
  adult <- read.table(file.choose(),
                      sep = ",",
                      header = FALSE,
                      strip.white = TRUE,
                      na.strings = "?")
  
  colnames(adult) <- c(
    "age","workclass","fnlwgt","education","education_num",
    "marital_status","occupation","relationship","race","sex",
    "capital_gain","capital_loss","hours_per_week","native_country","income"
  )
  
  cat("Dataset successfully loaded!\n\n")
  
  # 2
  cat(" First 10 rows of dataset:\n")
  head(adult, 10)
  #3
  cat("Structure of dataset")
  str(adult)
  
  #4
  avg_age <- mean(adult$age, na.rm = TRUE)
  cat("\n Average Age:", round(avg_age, 2), "\n")
  
  # 5
  income_count <- table(adult$income)
  cat("\n  Count of salary groups:\n")
  print(income_count)
  
  # 6
  common_occ <- names(which.max(table(adult$occupation)))
  cat("\n Most common occupation:", common_occ, "\n")
  
  # 7
  avg_hours <- tapply(adult$hours_per_week, adult$income, mean, na.rm = TRUE)
  cat("\n Average Hours Per Week:\n")
  print(avg_hours)
  
  # 8
  edu_dist <- table(adult$education)
  barplot(edu_dist,
          main = "Education Level Distribution",
          xlab = "Education Level",
          ylab = "Frequency",
          las = 2,
          cex.names = 0.7)
  
  # 9
  country_income <- prop.table(table(adult$native_country, adult$income), 1)
  country_gt50k <- country_income[, ">50K"]
  top_country <- names(which.max(country_gt50k))
  
  cat("\n Country with highest percentage of >50K earners:", top_country, "\n")
  
  
  #7 IPL dataset 
  df <- read.csv(file.choose(), header = TRUE)
  View(df)
  
 #1
  df <- read.csv(file.choose(), header = TRUE)
  
 
  print("Dataset Loaded Successfully ")
  str(df)
  
  cat("\nFirst 10 Rows:\n")
  head(df, 10)
  
#3
  top_runs <- df[order(-df$Runs), c("Player", "Runs")]
  top5_runs <- head(top_runs, 5)
  cat("\nTop 5 Players with Highest Runs:\n")
  print(top5_runs)
  
  #4
  top_avg <- df[which.max(df$Batting_Average), c("Player", "Batting_Average")]
  cat("\nPlayer with Highest Batting Average:\n")
  print(top_avg)
  
  #5
  top_strike <- df[order(-df$Strike_Rate), c("Player", "Strike_Rate")]
  top10_strike <- head(top_strike, 10)
  
  barplot(
    top10_strike$Strike_Rate,
    names.arg = top10_strike$Player,
    las = 2,
    main = "Top 10 Players by Strike Rate",
    xlab = "Players",
    ylab = "Strike Rate"
  )
  #6
  cor_value <- cor(df$Matches, df$Runs, use = "complete.obs")
  cat("\nCorrelation between Matches Played & Runs Scored:\n")
  print(cor_value)
  
  
  