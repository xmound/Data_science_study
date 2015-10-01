add2 <- function(x,y) {
  x + y
}

above10 <- function(x) {
  use <- x > 10
  x[use]
}

above <- function(x, n = 10) { # n = 10 is the default value
  use <- x > n
  x[use]
}

#default remove NAs per column
columnmean <- function(m, removeNA = TRUE) {
  nc <- ncol(m)
  means <- numeric(nc) # empty facot, initialized = 0
  for ( i in 1:nc) {
    means[i] <- mean(m[,i], na.rm = removeNA)
  }
  return(means)
}


##### ARGUMENT MATCHING ####
formals(lm)
args(lm)
# the following two calls are equivalent

lm(data = mydata, y~x, model = FALSE, 1:100)
lm( y ~x, mydata, 1:100, model = FALSE)

# functions have lazy evaluations

f <- function(a, b) {
  print(a)
  print(b)
}

f(45)

# "..." argument
# indicate a variable number of arguments that are usually passed on to other functions


myplot <- function(x ,y, type = 'l', ...) {
  plot(x, y, type = type, ...)
}

#generic functions, extra arguments can be passed to methods
mean

args(paste)
args(cat)

#arguments coming after ... can not be partially matched or positionally matched

paste("a", "b", sep = ":")
paste('A',"b",":")

# scoping
# search()
search()
# global environment is always the first to be searched for
# ordered by their order of being loaded


######## SCOPING #####

#lexical scoping: the value of free variables are searched for in he environment in which the function was defined
# environment: a collection of symbol and value pairs, symbol: x, value: 3.14
# every environment has a parent environment; it is possible for an environment to have multiple children
# the only environment without a parent is the empy environment
# a function + an environment = a closure


# in R, you can define a function in another function
# so that a function can return a function

make.power <- function(n) {
  pow <- function(x) {
    x^n
  }
  pow
}

cube <- make.power(3)
square <- make.power(2)
cube
cube(3)
square(3)


# explring a function closure
ls(environment(cube))
get("n", environment(cube))

ls(environment(square))
get("n", environment(square))


###### lexical vs dynamic scoping
y <- 10

f <- function(x) {
  y <- 2
  y^2 + g(x)
}

g <- function(x) {
  x*y
}

f(3)

#with lexical scoping, the value of y in the function g is lookedup in the envionment in which the funtion was defined, so y = 10
# with dynamic scoping, the value of y is looked up in the environment from which the function was called, so y= 2
g <- function(x) {
  a <- 3
  x+a+y
}
g(2)
y <- 3
g(2)


#### OTHER Languages that support lexical scoping
Scheme
Perl
Python
Common Lisp (all languages converges to Lisp)

# in R, all objects must be stored in memory
# all functions must carry a pointer to their respective defining environments, which could be anywhere


