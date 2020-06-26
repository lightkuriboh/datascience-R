
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
