# subsetting
# vector
x <- c("a","b","c",'c','d','a')
x[1]
x[1:4]

x[x > 'a']
u <- x > 'A'
u
x[u]

##### 
# [ always return object of the same class
# [[ is used to extract elements of a list or a data frame

# list
x <- list(foo = 1:4, bar = 0:6)
x[1] # single bracket returns a list of the same class
x[[1]] # double bracket always return a vector
x["foo"]

x$bar
x[["bar"]]
x["bar"]

x <- list(foo = 1:4, bar = 0.6, baz = 'hello')
x[c(1,2)]
x[c('foo','bar')]

name <- "foo"
x[[name]] ## computed index for 'foo'
x$name ## element 'name" doesn't exist
x$foo

#### SUBSETTING MATRIX
x <- matrix(1:6, nrow = 2)
x[1,]
x[,2]

# when selecting a single element of a matrix, it returns a vector of length 1 by default
x[1, 2]
x[1, 2, drop = FALSE] # drop! 

#similarily, for row or columns
x[1,]
x[1, , drop = FALSE]

# subsetting with names
# Partial Matching
x <- list(aardvark = 1:5)
x$a # partial matching
x[["a"]] # it looks for exact match
x[["a", exact = FALSE]]

# removing missing values
##### complete.cases(), very useful function
x <- c(1, 2, NA, 4, NA, 5)
bad <- is.na(x)
x[!bad]

y <- c('a','b',NA, 'd', NA, 'f') 
good <- complete.cases(x, y) # complete.cases very useful
x[good]
y[good, drop = FALSE]
y[good]

# removing NA values
airquality[1:6,]
good <- complete.cases(airquality)
airquality[good,][1:6,]


#### vectorized operations
x <- 1:4
y <- 6:9
x + y
x * y

x <- matrix(1:4, 2, 2)
y <- matrix(rep(10,4), 2, 2)
x
y
x * y
x / y
x %*% y # true matrix multiplication

#swirl development
# "statistial with interactive R learning"