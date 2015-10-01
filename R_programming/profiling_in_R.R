# profiling in R
# profiling is a systematic way to examine how much time is spend in different parts of a program

# when optimizing your code
1. design first, then optimize
2. "premature optimization is the root of all evil"
3. Measure (collect data), don't guess'

##### system.time() function
# user time: time charged to the CPU(s) for this expression
# elapsed time: "wall clock" time

system.time(rnorm(100,1,2))
# elapsted time may be smaller than the user time if multiple core processing is used
# multi-threaded BLAS libraries 
# parallel processing via the 'parallel' package

# elapsed time > user time
system.time(readLines("http://www.jhsph.edu"))
# most time waiting for network

# elapsed time < user time
hilbert <- function(n) {
    i <- 1:n
    1 / outer(i -1, i, "+")
}
x <- hilbert(1000)
system.time(svd(x))

#### R Profiler #####
?Rprof()
?summaryRprof() # summarize the output from Rprof()

DO NOT USE system.time() and Rprof() together!

Rprof() keeps track of the function call stack at regular sampled intervals
default sampling interval is 0.02 seconds

lm(y ~ x)
sample.interval = 10000

Rprof(lm(y~x))
summaryRprof()
# normalizing "by total" or "by self"
x <- rnorm(100)
y <- rnorm(100)

Rprof('/Users/daili/Downloads/foo.txt')
example(glm)
Rprof()
summaryRprof('/Users/daili/Downloads/foo.txt')

require(profr)
require(ggplot2)
x = profr(example(glm))
ggplot(x)

