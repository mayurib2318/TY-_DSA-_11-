# INSTALL AND LOAD NECESSARY PACKAGES
# Install if needed: install.packages(c("rpart", "rpart.plot", "pROC"))
library(rpart)
library(rpart.plot)
library(pROC)

# --- LOGISTIC REGRESSION (Q1 & Q4) ---

# 1. Build a logistic regression model predicting 'am' (automatic/manual) in mtcars using hp and wt.
model_logreg <- glm(am ~ hp + wt, data = mtcars, family = "binomial")
summary(model_logreg)

# 4. Plot the ROC curve for the logistic regression model in Q1.
# Get predicted probabilities
mtcars$prob_am <- predict(model_logreg, type = "response")
# Generate ROC object
roc_obj <- roc(mtcars$am, mtcars$prob_am)
# Plot the curve and print AUC
plot(roc_obj, main="ROC Curve for am Prediction")
auc(roc_obj)

# --- DECISION TREE (Q2 & Q3) ---

# 2. Construct a decision tree to classify Species in the full iris dataset.
model_tree <- rpart(Species ~ ., data = iris, method = "class")
rpart.plot(model_tree) # Optional: Plot the tree

# 3. Calculate confusion matrix and accuracy for Q2.
# Get predictions
iris$pred_species <- predict(model_tree, type = "class")
# Create confusion matrix (table of actual vs. predicted)
conf_matrix <- table(Actual = iris$Species, Predicted = iris$pred_species)
print(conf_matrix)
# Calculate Accuracy
accuracy <- sum(diag(conf_matrix)) / sum(conf_matrix)
print(paste("Accuracy:", accuracy))