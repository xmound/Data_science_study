library(RColorBrewer)
cols <- brewer.pal(3, 'BuGn')
cols

pal <- colorRampPalette(cols)

image(volcano, col = pal(50))

##### smoothScatter function
par(mfrow = c(1,1))
x <- rnorm(10000)
y <- rnorm(10000)

# see 
plot(x,y)
# vs.
smoothScatter(x, y)


#### transparency
#### rgb

plot( x, y, col = rgb(0.5, 0.5, 0.5, 0.25), pch = 20)
