
?xtabs
?ftable
# ftable(xtabs(measuring ~ factor1 + factor2))
?object.size
?cut
?dplyr
?mutate
?melt
?dcast
?ddply
?merge

exp(1)^10

created <- h5createFile('example.h5')
create <- h5createGroup('example.h5', 'foo')
create <- h5createGroup('example.h5', 'bar')
create <- h5createGroup('example.h5', 'foo/foobar')
h5ls('example.h5')

myDb <- dbConnect(MySQL(),
                  user = 'phpmyadmin',
                  password = 'admin',
                  dbname= 'infoDB',
                  host = 'localhost',
                  port = 3306
                  )
result <- dbGetQuery(myDb, 'show databases;')
result

allTables <- dbListTables(myDb)
dbListFields(myDb, 'submission')

tableData <- dbReadTable(myDb, 'submission')
tail(tableData)

query <- dbSendQuery(myDb, 'SELECT * FROM submission WHERE 1')
submissionData <- fetch(query)
numeric_data <- as.numeric(submissionData$Status)
# numeric_data <- numeric_data[!is.na(numeric_data)]
tapply(numeric_data, numeric_data, length)
dbClearResult(query)
dim(submissionData)
dbDisconnect(myDb)

getwd()
setwd('./data')
fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx'
download.file(fileURL, destfile = 'clean_data_quiz1-2.xlsx')
fileLocal <- 'clean_data_quiz1-2.csv'
my_data <- read.csv(fileLocal)
head(my_data$VAL, 100)
class(my_data$V1)
colnames(my_data)
length(my_data$VAL[my_data$VAL == 24 & !is.na(my_data$VAL)])

fileURL4 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml'
localFile4 <- 'clean_data_quiz1-4.xml'
download.file(fileURL4, destfile = localFile4)

doc <- xmlTreeParse(localFile4, useInternalNodes = T)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
xmlSApply(rootNode, xmlValue)
zipcodes <- xpathSApply(rootNode, '//zipcode', xmlValue)
length(zipcodes[zipcodes == 21231])

fileURL5 <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv'
my_data_5 <- fread(fileURL5)

f1 <- function () {
  tapply(my_data_5$pwgtp15, my_data_5$SEX, mean)
}

system.time(f1())

f2 <- function () {
  mean(my_data_5$pwgtp15, by = my_data_5$SEX)
}
system.time(f2())

f3 <- function () {
  sapply(split(my_data_5$pwgtp15, my_data_5$SEX), mean)
}
system.time(f3())

f4 <- function () {
  my_data_5[,mean(pwgtp15), by = SEX]
}
system.time(f4())

f5 <- function () {
  mean(my_data_5[my_data_5$SEX==1,]$pwgtp15)
  mean(my_data_5[my_data_5$SEX==2,]$pwgtp15)
}
system.time(f5())

f6 <- function () {
  rowMeans(my_data_5)[my_data_5$SEX==1]
  rowMeans(my_data_5)[my_data_5$SEX==2]
}
system.time(f6())



random_matrix <- function (rows = 0, cols = 0) {
    m <- matrix(0, nrow = rows, ncol = cols)
    nr <- nrow(m)
    indices <- cbind(1:nr, sample(ncol(m), nr, TRUE))
    print(indices)
    m[indices] <- 1
    
    all(rowSums(m) == 1)
    
    m
}

my_random_matrix <- random_matrix(3, 3)
my_random_matrix
det(my_random_matrix)

x <- 5
y <- if(x < 3) {
  NA
} else {
  10
}
y

x <- Sys.time()
x
p <- as.POSIXlt(x)
p
unclass(p)
names(unclass(p))

addFunc <- function (x, y) {
  x + y
}
addFunc(7, 8)

pow <- function (n) {
  f <- function(x) {
    x^n
  }
  f
}
cube <- pow(3)
square <- pow(2)
cube(2)
square(2)
ls(environment(cube))
get('n', environment(cube))
get('f', environment(cube))

print("Hello R")

x <- 0:5
x
x[2:4]
x[x > 1]
u <- (x >= 3)
u
x[u]
as.logical(x)
x

y <- 2/0
y
y <- c('a', 'b', NA, 'c', NA)
bad <- is.na(y)
bad
y
y[!bad]
y2 <- c(1,  NA,  2,   3,  NA)
y3 <- c(2,  NA,  5,   4,  8)
y4 <- c(1, 2, 3)
good <- complete.cases(y, y2, y3)
good
y[good]
y2[good]
y2[good] / y3[good]
y2[good] / y4
as.numeric(y)
y

xym <- cbind(x, y)
xym
xym <- rbind(y, x)
xym

z <- 1L # Integer
z
z <- list(foo = 1:5, 'a', TRUE, FALSE, 1 + 4i)
z
z[1]
z[[1]]
z$fo
z['fo']
z['foo']
z[['fo']]
z[c(1, 3)]
z[[c(1, 3)]]
z[[1]][2]

t <- 0/0
t

vec1 <- c(0.5, 0.6)
vec1

vec2 <- vector(mode="logical", length=5L)
vec2

m <- matrix(1:24, nrow = 2, ncol = 2)
m
dim(m)
attributes(m)
dimnames(m) <- list(c('a', 'b'), c('c', 'd'))
m

m <- 1:24
m
dim(m) <- c(4, 6)
m
dim(m) <- c(12, 2)
m
m[2, 2]
m[, 2]
m[2, 2, drop = FALSE]
m[, 2, drop = FALSE]

fac <- factor(c('no', 'yes', 'yesandno', 'noandyes', 'no'),
              levels = c('yes', 'no', 'noandyes', 'yesandno'))
fac
table(fac)

is.na(fac)

fra <- data.frame(foo = 1:4, bar = c(T, T, F, F))
fra
nrow(fra)
ncol(fra)
dput(fra)
dput(fra, file = "fra.R")
new.y <- dget("fra.R")
new.y

str <- "foo"
dump(c("fra", "str"), file = "data.R")
rm(fra, str)
fra
source("data.R")
fra

name_example <- 1:3
names(name_example)
names(name_example) <- c('foo', 'bar')
name_example
names(name_example)

name_list <- list(a = '1', b = 2, c = 3 + 0i)
name_list
names(name_list)


str(file)

b <- c(4, TRUE)
class(b)

xxx <- c(1)
yyy <- c(2)
zzz <- cbind(xxx, yyy)
zzz
ttt <- list(2, 'a')
class(ttt[[2]])
