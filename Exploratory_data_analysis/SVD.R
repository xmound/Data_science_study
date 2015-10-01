set.seed(12345)
par(mar = rep(1,1))
dataMatrix <- matrix(rnorm(400), nrow = 40)
image(1:10, 1:40, t(dataMatrix)[, nrow(dataMatrix):1])
heatmap(dataMatrix)
# add pattern
# add some patterns to both x and y
set.seed(678910)
for ( i in 1:40) {
  # flip a coin
  coinFlip1 <- rbinom(1, size = 1, prob = 0.5)
  # if coin is heads add a common pattern to that row
  if (coinFlip1) {
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0,5), each = 5)
  }
}
heatmap(dataMatrix)


# discovery pattern
hh <- hclust(dist(dataMatrix)) #hierarcial clustering
dataMatrixOrdered <- dataMatrix[hh$order, ]
par(mfrow = c( 1, 3))
image( t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(rowMeans(dataMatrixOrdered), 40:1, , xlab = "row mean", ylab = 'row')
plot(colMeans(dataMatrixOrdered), xlab = "col", ylab = 'col_mean')

# svd
svd1 <- svd(scale(dataMatrixOrdered))
par(mfrow = c( 1, 3))
image( t(dataMatrixOrdered)[, nrow(dataMatrixOrdered):1])
plot(svd1$u[,1], 40:1, , xlab = 'row', ylab = 'first left singular vector' )
plot(svd1$v[,1], xlab= 'column', ylab = 'first right singular vector')

# variances explained
par(mfrow = c(1,2))
plot(svd1$d, xlab = "col", ylab = 'singular value')
plot(svd1$d^2 / sum(svd1$d^2), xlab = "col", ylab = 'prob. of variance explained')

#pca vs. svd
svd1 <- svd(scale(dataMatrixOrdered))
pca1 <- prcomp(dataMatrixOrdered, scale = TRUE)
# pca1$rotation[,1] is the same as svd1$v[,1]

############ multiple dimension patterns ########
# add some patterns to both x and y
set.seed(678910)
for ( i in 1:40) {
  # flip a coin
  coinFlip1 <- rbinom(1, size = 1, prob = 0.5)
  coinFlip2 <- rbinom(1, size = 1, prob = 0.5)
  # if coin is heads add a common pattern to that row
  if (coinFlip1) {
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0,5), each = 5)
  }
  if (coinFlip2) {
    dataMatrix[i, ] <- dataMatrix[i, ] + rep(c(0,5), each = 5)
  }
}
heatmap(dataMatrix)

# svd and explain pattern

svd2 <- svd(scale(dataMatrixOrdered))
par( mfrow = c(1,3))
plot(svd2$v[,1])
plot(svd2$v[,2])
par(mfrow = c(1,2))

plot(svd2$d, xlab = "col", ylab = 'singular value')
plot(svd2$d^2 / sum(svd1$d^2), xlab = "col", ylab = 'prob. of variance explained')

####### missing values ######
dataMatrix2 <- dataMatrixOrdered
dataMatrix2[sample(1:100, size = 40, replace = FALSE)] <- NA
svd1 <- svd(scale(dataMatrix2))

# need to impute the data of the missing rows 
# inpute package available from http://bioconductor.org

# to compute approximation
approx <- svd1$u[,1:5] %*% diag(svd1$d[1:5] %*% t(svd1$v[,1:5])

