# INSTALL AND LOAD NECESSARY PACKAGES
# Install if needed: install.packages(c("factoextra", "cluster"))
library(factoextra)
library(cluster)

# Prepare data: Clustering requires only numeric features.
# Exclude the 'Species' column from iris (column 5) for clustering.
iris_num <- iris[, -5]
mtcars_sub <- mtcars[, c("mpg", "hp", "wt")]

# 1. Perform K-means clustering with K=4 on iris dataset and compare with species labels.
set.seed(42) # Set seed for reproducible results
kmeans_k4 <- kmeans(iris_num, centers = 4)
# Compare the cluster assignment (kmeans_k4$cluster) to the true labels (iris$Species)
table(Cluster = kmeans_k4$cluster, Actual = iris$Species)

# 2. Apply clustering on mtcars using mpg, hp, and wt. Interpret clusters.
# Scaling is generally good practice before clustering
mtcars_scaled <- scale(mtcars_sub)
kmeans_mtcars <- kmeans(mtcars_scaled, centers = 3) # Using 3 as a reasonable guess
# View the means of the original variables for each cluster to interpret
aggregate(mtcars_sub, by=list(Cluster=kmeans_mtcars$cluster), FUN=mean)

# 3. Use the elbow method to find optimal number of clusters for iris.
fviz_nbclust(iris_num, kmeans, method = "wss")

# 4. Visualize clusters using PCA-based scatterplot in factoextra. (Uses result from Q1)
fviz_cluster(kmeans_k4, data = iris_num,
             geom = "point",
             ellipse.type = "convex",
             palette = "jco",
             main = "K-means Clusters (K=4) on Iris")

# 5. Create a subset of iris with only Sepal.Length and Sepal.Width and cluster it.
iris_subset <- iris[, c("Sepal.Length", "Sepal.Width")]
set.seed(42)
kmeans_subset <- kmeans(iris_subset, centers = 3)
plot(iris_subset, col = kmeans_subset$cluster) # Visualize the result