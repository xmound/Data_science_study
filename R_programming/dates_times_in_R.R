# dates and times in R

# Datas are represented by the Data class
# Times are represented by the POSIXct or POSIXl class

# Datas are stored inernally as the number of days since 1970-01-01
# Times are stored internally as the number of sconds since 1970-01-01

x <- as.Date("1970-01-01")
x
unclass(x)

y <- as.Date(0)
y

####### Times
POSIXct: very large integer under the hood, it use a useful class when you want t store times in something like a data frame
POSIXlt is a list underneath, stores a bunch of other info like day of week, etc

weekdays: give the day of the week
months: give the month name
quarters: give the quarter number ("Q1", "Q2")

x <- Sys.time()
x
unclass(x) # underlying is integer

p <- as.POSIXlt(x)
p
names(unclass(p))
unclass(p) # underlying is a list
p$sec 

####### strptime, for conversion of data times in other formats

datestring <- c("january 10, 10:40 1989", "December 9, 9:10 2011")

x <- strptime(datestring, "%B %d, %H:%M %Y ")
x
class(x)

#check ?strptime for details of the parameters


########## Operations on Dates and Times
x <- as.Date("2012-01-01")
y <- strptime("january 10, 2012 10:40","%B %d, %Y %H:%M")
x - y

as.POSIXlt(x) - y
as.POSIXct(x) - as.POSIXct(y)

###### 
z  <- as.POSIXct(x, tz = "GMT")
z
