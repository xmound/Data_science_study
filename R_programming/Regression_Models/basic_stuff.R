install.packages("UsingR")

library(UsingR)
data(galton)
par(mfrow = c(1, 2))

hist(galton$child, col = "blue", breaks = 100)
hist(galton$parent, col = "blue", breaks = 100)

# findding the 'middle' height - it means a height that minimizes the distance

library(manipulate)
myHist <- function(mu) {
    hist(galton$child, col = "blue", breaks = 100)
    lines(c(mu, mu), c(0, 150), col = "red", lwd = 5)
    mse <- mean((galton$child - mu) ^ 2)
    text(63, 150, paste("mu = ", mu))
    text(63, 140, paste("MSE = ", round(mse, 2)))
}
manipulate(myHist(mu), mu = slider(62, 75, step = 0.5))
# it is actual the mathmatical mean

plot(galton$parent, galton$children, size)
