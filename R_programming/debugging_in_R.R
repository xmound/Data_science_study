#dbugging

# warning
log(-1)

printmessage <- function(x ) {
    if(x > 0)
        print('x is great than 0')
    else
        print('x is less than or equal to zero')
    invisible(x)
}

printmessage(-2)
printmessage(1)
printmessage(NA)
printmessage('asdf')

printmessage <- function(x ) {
    if(is.na(x))
        print('x is a missing value!')
    else if(x > 0)
        print('x is great than 0')
    else
        print('x is less than or equal to zero')
    invisible(x)
}
printmessage(-1)
printmessage(NA)
x <- log(-1)
printmessage(x)


# debugging tools in R
# traceback
# debug
# brwoser
# trace
# recover

mean(x)
traceback()

lm( y ~ x)
traceback()

debug(lm)
lm(y ~ x)

options(error = recover)
read.csv("nosuchfile")

# make sure you can reproduce
# state your expectations
# how the output differs
