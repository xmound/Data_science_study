#Dendrogram

set.seed(1234)
par(mar = c(2,2,2,2))
x <- rnorm(12, mean = rep(1:3, each = 4), sd = 0.2)
y <- rnorm(12, mean = rep(c(1,2,1), each = 4), sd = 0.2)
plot(x, y, col = 'blue', pch = 19, cex = 2)
text( x + 0.05, y + 0.05, labels = as.character(1:12))

dataFrame <- data.frame( x= x, y=y)
distxy <- dist(dataFrame)

hClustering <- hclust(distxy)
plot(hClustering)

#### 
dataMatrix <- as.matrix( dataFrame)
heatMap <- heatmap(dataMatrix)


######### k - means ####
kmeansObj <- kmeans(dataFrame, centers = 3)
kmeansObj$cluster

plot(x , y, col = kmeansObj$cluster, pch = 20, cex = 1.5)
points( kmeansObj$centers, col = 1:3, pch = 5)
