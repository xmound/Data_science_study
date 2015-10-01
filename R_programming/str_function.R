# the str function
# a diagnostic function and an alternative to summary()
# well suited to compactly display contents
# roughly one line per basic object

str(str)
str()
str(lm)
str(ls)
x <- rnorm(100, 2, 4)
summary(x)
str(x)
f <- gl(40, 10)
str(f)
summary(f)

str(airquality)

m <- matrix(rnorm(100),10,10)
str(m)
m[,1]

s <- split(airquality, airquality$Month)
str(s) # a list contains 5 data frames
