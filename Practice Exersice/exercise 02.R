
library(readxl)
library(dplyr)


 #(Facebook dataset)
facebook <- read.csv(file.choose(), header = TRUE) 

#Lung Capacity dataset
lungcap <- read_excel(file.choose()) 

#Titanic dataset
titanic <- read.csv(file.choose(), header = TRUE) 
# 2. 
head(facebook, 10)
head(lungcap, 10)
head(titanic, 10)

# 3
str(titanic)

# 4. 
titanic_survived <- titanic %>% filter(Survived == 1)
write.csv(titanic_survived, "Titanic_Survived.csv", row.names = FALSE)


# Titanic dataset
titanic_sel <- titanic %>% select(Name, Sex, Age, Survived)
titanic_sel

titanic_age50 <- titanic %>% filter(Age > 50)
titanic_age50

titanic_pclass_surv <- table(titanic$Pclass, titanic$Survived)
titanic_pclass_surv

# Facebook dataset
facebook_max_likes <- facebook[which.max(facebook$Likes), ]
facebook_max_likes

avg_shares <- mean(facebook$Shares, na.rm = TRUE)
avg_shares

facebook <- facebook %>%
  mutate(Engagement = Likes + Comments + Shares)

# Lung Capacity dataset
lung_kids <- lungcap %>% filter(Age < 12)
lung_kids

lung_gender_avg <- lungcap %>% group_by(Gender) %>%
  summarise(avg_lungcap = mean(LungCap, na.rm = TRUE))
lung_gender_avg

max_lungcap <- lungcap[which.max(lungcap$LungCap), ]
max_lungcap

# 1. 
names(titanic) <- tolower(names(titanic))
names(titanic)

# 2
titanic_sorted <- titanic %>% arrange(desc(age))
head(titanic_sorted)

# 3
titanic <- titanic %>%
  mutate(agegroup = case_when(
    age < 12 ~ "Child",
    age >= 12 & age <= 18 ~ "Teen",
    age >= 19 & age <= 59 ~ "Adult",
    age >= 60 ~ "Senior",
    TRUE ~ "Unknown"
  ))

# 4
titanic_fare_mean <- titanic %>%
  group_by(pclass, survived) %>%
  summarise(mean_fare = mean(fare, na.rm = TRUE))
titanic_fare_mean

# 5
facebook_avg_likes <- facebook %>% group_by(Type) %>%
  summarise(avg_likes = mean(Likes, na.rm = TRUE))
facebook_avg_likes
. Identif

# 1
colSums(is.na(titanic))

# 2
titanic$age[is.na(titanic$age)] <- median(titanic$age, na.rm = TRUE)

# 3
titanic <- titanic[!is.na(titanic$embarked), ]

# 4
lungcap$LungCap[is.na(lungcap$LungCap)] <- mean(lungcap$LungCap, na.rm = TRUE)

# 5
cat("Listwise deletion: Removes entire row with any missing value\n")
cat("Pairwise deletion: Uses available values for each analysis\n")
cat("Mean/median imputation: Replaces missing with central values\n")


# Titanic Age Histogram
hist(titanic$age, main="Age Distribution", xlab="Age")

# Bar chart of Pclass
barplot(table(titanic$pclass), main="Passenger Class")

# LungCap boxplot by Gender
boxplot(LungCap ~ Gender, data=lungcap, main="Lung Capacity by Gender")

# Facebook Scatter Likes vs Comments
plot(facebook$Likes, facebook$Comments, xlab="Likes", ylab="Comments", main="Likes vs Comments")

# Facebook histogram of Shares
hist(facebook$Shares, main="Shares Distribution", xlab="Shares")

# Titanic Pie chart Survivors vs Non-Survivors
pie(table(titanic$survived), labels=c("Not Survived","Survived"), main="Survival Rate")

# Boxplot: Titanic Fare
boxplot(titanic$fare, main="Fare Boxplot")

# Boxplot Age by Survived
boxplot(age ~ survived, data=titanic, main="Age by Survival")

# 
Q1 <- quantile(titanic$fare, 0.25, na.rm=TRUE)
Q3 <- quantile(titanic$fare, 0.75, na.rm=TRUE)
IQR_val <- IQR(titanic$fare, na.rm=TRUE)
lower <- Q1 - 1.5*IQR_val
upper <- Q3 + 1.5*IQR_val
sum(titanic$fare < lower | titanic$fare > upper, na.rm=TRUE)

# IQR Method Age + Capping
Q1_age <- quantile(titanic$age, 0.25, na.rm=TRUE)
Q3_age <- quantile(titanic$age, 0.75, na.rm=TRUE)
iqr_age <- IQR(titanic$age, na.rm=TRUE)
low_age <- Q1_age - 1.5*iqr_age
up_age <- Q3_age + 1.5*iqr_age
sum(titanic$age < low_age | titanic$age > up_age)

titanic$age <- ifelse(titanic$age < low_age, low_age,
                      ifelse(titanic$age > up_age, up_age, titanic$age))

# LungCap Outlier Removal
Q1_l <- quantile(lungcap$LungCap, 0.25, na.rm=TRUE)
Q3_l <- quantile(lungcap$LungCap, 0.75, na.rm=TRUE)
iqr_l <- IQR(lungcap$LungCap, na.rm=TRUE)
low_l <- Q1_l - 1.5*iqr_l
up_l <- Q3_l + 1.5*iqr_l

before_avg <- mean(lungcap$LungCap, na.rm=TRUE)
lungcap_clean <- lungcap %>%
  filter(LungCap >= low_l & LungCap <= up_l)
after_avg <- mean(lungcap_clean$LungCap, na.rm=TRUE)

before_avg
after_avg

cat("Boxplot detects visually\nIQR gives exact numerical limits\nRemove outliers if errors; cap if still valid\n")
