########## data TYPES ########
# objects
a <- vector()
b <- list()

# Inf : infinity
# NaN : undefined, 0/0


#### attributes() of an object

# creating vectors
c <- vector("numeric",10)

# a single vector can only contain elements of the same object
y <- c(1.7, "a")
y <- c(TRUE,2)
y <- c("a",TRUE)

# explicit coercion
x <- 0:6
class(x)

as.numeric(x)
as.logical(x)
as.character(x)

x <- c("a","b","c")
as.numeric(x)
x <- 0:6
as.complex(x)

############ data types ##############

### ists
# lists cancontain elements of different types
x <- list(1, "a", TRUE, 1+4i)
x

x[[1]][1]

### matrices
## creating matrrices
m <- matrix(nrow = 2, ncol = 3)
m

dim(m)
attributes(m)

m <- matrix(1:6, nrow = 2, ncol = 3)
m
# or
m <- 1:10
dim(m) <- c(2,5)
m

x <- 1:3
y <- 10:12
cbind(x,y)
rbind(x,y)

#### FACTORS
x <- factor(c("yes","no"))
x
table(x)
unclass(x)
attr(x,"levels")

#ordering of levels matters, cuz in linear modeling first level is reference level
x <- factor(c("yes","no","no"), levels = c("yes","no"))

#### MISSING VALUES
# missing values : NA
# undefined mathematical operations: NaN
is.na()
is.nan()

x <- c(1, 2, NA, 10, 3)
is.na(x)
is.nan(x)

# nan is also treated as missing value
x <- c(1,2, 0/0, NA, 4)
is.na(x)
is.nan(x)


### DATA FRAMES
x <- data.frame( foo = 1:4, bar = c(T,T,F,F))
x
nrow(x)
ncol(x)

### NAMES
x <- c('foo','bar')
names(x) <- c('ffffff','bbbbbb')
x
m <- matrix(1:4, nrow =2)
dimnames(m) <- list(c("a","b"), c("c","d"))
names(m)
m
