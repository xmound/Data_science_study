# simulations in R

# generating random numbers
rnorm() # generate rando normal variats with given paramets
dnorm() # evaluate the norm probabiity density at a point
pnorm() # evaluate cumulative distribution for a normal distribution
rpois() # generate random poisson ..

d for density
r for random number generation
p for cumulative distribution
q for quantile function

##
dnorm(x, mean = 0, sd = 1, log = FALSE)
pnorm(0, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
qnorm(0.9, mean = 0, sd = 1, lower.tail = TRUE, log.p = FALSE)
rnorm(n, mean = 0, sd = 1)

## remember to set seed
set.seed(1)

rpois(10,1)
rpois(10,2)
rpois(10,20)
ppois(2,2)
ppois(4,2)
ppois(6,2)
ppois(1000,2)
qpois(0.5,2)

##### Simulation a linear model
set.seed(20)
x <- rnorm(100)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x,y)

# x is binary
set.seed(10)
x <- rbinom(100, 1, 0.5)
e <- rnorm(100, 0, 2)
y <- 0.5 + 2 * x + e
summary(y)
plot(x,y)

# suppose we want to simulate a poisson model
set.seed(1)
x <- rnorm(100)
log.mu <- 0.5 + 0.3 * x
y <- rpois(100, exp(log.mu))
summary(y)
plot(x, y)


##### random sampling

set.seed(1)
sample(1:10, 4, replace = FALSE)
sample(letters, 5)
letters
sample(1:10) #### permutation
sample(1:10)
sample(1:10, replace = TRUE)
