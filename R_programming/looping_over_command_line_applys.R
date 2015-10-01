# looping over command line

# lapply, sapply, apply, tapply, mapply, split

#lapply: Loop over a list and evaluate a function on each element
#sapply: Same as lapply but try to simplify the result
#apply: Apply a function over the margins of an array
#tapply: Apply a function over subsets of a vector
#mapply: Multivariate version of lapply

# lapply
x <- list(a = 1:5, b = rnorm(100))
x
lapply(x, mean)

x <- 1:4 # it's not a list, so it will be coerced to a list using as.list
lapply(x, FUN = runif)
lapply(x, FUN = runif, min = 0, max = 10) #passing ... arguments of min and max

x <- list(a = matrix(1:4, 2, 2),
          b = matrix(1:6, 3, 2))
lapply(x, function(elt) elt[,1])

## sapply
# will try to simplify the result of lapply if possible
x <- list(a = 1:4, b = rnorm(10), c = rnorm(20, 1))
x
mean(x)
sapply(x, FUN = mean)
lapply(x, FUN = mean)

## apply
x <- matrix(rnorm(200), 20, 10)
apply(x, 2, mean) # 2nd dimension - columns
apply(x, 1, sum) # 1st dimension - rows, perserve the rows, collapse the columns
#shortcuts
rowSums - apply(x, 1, sum)
rowMeans - apply(x, 1, mean)
colSums - apply(x, 2, sum)
colMeans - apply(x, 2, mean)

apply( x, 1, quantile, probs = c(0.25, 0.75))
apply( x , 2, quantile)

#average matrix in an array
a <- array(rnorm(2*2*10), c(2,2,10))
a
apply(a, c(1,2), mean) # perserve the 1st and 2nd dimension
rowMeans(a, dims = 2)


## mapply

list(rep(1,4),rep(2,3), rep(3,2), rep(4,1))
mapply(rep, 1:4, 4:1) # pass 2 sets of arguments to the function

noise <- function(n, mean, sd) {
    rnorm(n, mean, sd)
}
noise(5, 1, 2)

noise(1:5, 1:5, 2)
# vectorize the noise function
mapply(noise, 1:5, 1:5, 2)
# same as the below:
list(noise(1,1,2), noise(2,2,2)...)

## tapply
# apply a function over a subset of a vector
str(tapply)
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10)

tapply(x, f, mean)
tapply(x, f, mean, simplify = FALSE)
tapply(x, f, range)


## split
str(split)
x <- c(rnorm(10), runif(10), rnorm(10,1))
f <- gl(3, 10)
split(x, f)
lapply(split(x, f), mean) # the same as tapply( x, f, mean)

library(datasets)
head(airquality)
s <- split(airquality, airquality$Month)
lapply( s, function(x) colMeans(x[,c('Ozone','Solar.R','Wind')], na.rm = TRUE))
# or use sapply
sapply(s, function(x) colMeans(x[, c('Ozone','Solar.R','Wind')], na.rm = TRUE))


# splitting on more than one level
x <- rnorm(10)
f1 <- gl(2, 5)
f2 <- gl(5, 2)
f1
f2
interaction(f1, f2)
str(split(x, list(f1, f2)))
str(split(x, interaction(f1, f2)))
str(split(x, interaction(f1, f2), drop = TRUE))
