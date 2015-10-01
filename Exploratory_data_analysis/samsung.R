# samsung data
setwd("/Users/daili/Desktop/personal folder/git/Data_Science/Exploratory_data_analysis")
load("data/samsungData.rda")
names(samsungData)[1:12]
table(samsungData$activity)

# plooting average acceleration for first subject
# average acceleration
par(mfrow = c(1,2), mar = c(5,4,1,1))
samsungData <- transform(samsungData, activity = factor(activity))
sub1 <- subset(samsungData, subject == 1)
plot(sub1[, 1], col = sub1$activity, ylab = names(sub1)[1])
plot(sub1[, 2], col = sub1$activity, ylab = names(sub1)[2])
legend("bottomright", legend = unique(sub1$activity), col = unique(sub1$activity), pch = 1)

#hierarachical clustering
par(mfrow = c(1,1))
source("myplcluster.R")
distanceMatrix <- dist(sub1[, 1:3])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))

########## max accleration ########
par(mfrow = c(1,2), mar = c(5,4,1,1))
plot(sub1[, 10], col = sub1$activity, ylab = names(sub1)[10])
plot(sub1[, 11], col = sub1$activity, ylab = names(sub1)[11])
legend("bottomright", legend = unique(sub1$activity), col = unique(sub1$activity), pch = 1)

par(mfrow = c(1,1))
source("myplcluster.R")
distanceMatrix <- dist(sub1[, 10:12])
hclustering <- hclust(distanceMatrix)
myplclust(hclustering, lab.col = unclass(sub1$activity))


##### SVD
svd1 = svd(scale(sub1[, -c(562, 563)]))
par(mfrow = c(1, 2))
plot(svd1$u[, 1], col = sub1$activity, pch = 19) #1st singular vector
plot(svd1$u[, 2], col = sub1$activity, pch = 19) #2nd singular vector

plot(svd1$v[, 1], pch = 19)
plot(svd1$v[, 2], pch = 19)
p
maxContrib <- which.max(svd1$v[, 2])
distanceMatrix <- dist(sub1[, c(10:12, maxContrib)])
hcluster <- hclust(distanceMatrix)
myplclust(hcluster, lab.col = unclass(sub1$activity))

names(samsungData)[maxContrib] # applied Fast Fourier Transfer

# K-Means Clustering (nstart = 1, first try)
kClust <- kmeans( sub1[, -c(562, 563)], centers = 6, nstart = 100)
table(kClust$cluster, sub1$activity)

plot(kClust$center[2, 1:10], pch = 19, ylab = "cluster center", xlab = "")
plot(kClust$center[4, 1:10], pch = 19, ylab = "cluster center", xlab = "")

# plot pca
pca1 <- prcomp(sub1[, -c(562, 563)], scale = TRUE)
plot(svd1$v[,1], svd1$v[,2], col = kClust$cluster)
plot(pca1[1], pca1[2], col = sub1$activity)
