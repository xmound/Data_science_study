##### READING DATA
read.table()
read.csv()

parameter: colClasses: a vector indicating the class of each column
comment.char: what is the comment character
stringAsFactor - character variables be coded as factors?

# reading lines of text file
readLines()

# read R source code
source()

# read r codes deparsed
dget()

# reading binary objects
load()
unserialize() for reading single R objects in binary form

#### WRITING data, corresponds to read ones 
write.table()
writeLines()
dump
dump
dput
save
serialize()


#### READING LARGE DATASET
# make a rough calculation of the memory required
# set comment.char = "" if there are no commented lines in your file

initial <- read.table(file, nrows = 100)
classes <- sapply(initial, class)
tabALL <- read.table("datatable.txt", colClasses = classes)


# rough calculations of mems

#1.5M rows and 120 columns, everything is numeric
#  (8 bytes / numeric)
1500000 * 120 * 8 / (2^20) so about 1.34 GB
# overhead stuff takes a bout 2 times of memory, so about 2.6GB memories required


############ TEXUAL FORMATS ######
#dumping and dputing
# dputing
y <- data.frame( a = 1, b = 'A')
y
dput(y)
dput(y, file = "y.R")
new.y <- dget("y.R")

# dumping R objects, multiple objects
x <- "foo"
y <-  data.frame( a = 1, b = 'A')
dump(c("x","y"), file = "data.R")
rm(x,y)
source("data.R")
y
x

####### INTERFACES TO THE OUTSIDE WORLD #####
file, opens a connection to a file
gzfile, opens a connection to a file compressed with gzip
bzfile - bzip2
url, opens a connection to a webpage

file, open arguments ,r = reading, w = writing, a = appending, rb reading binary etc

# read the 1st 10 lines of a text file
con <- gzfile("asdf.gz")
x <- readLines(con, 10)
x
# similarily, use writeLines() to write

con <- url("http://www.jhsph.edu","r")
x <- readLines(con)
head(x)
