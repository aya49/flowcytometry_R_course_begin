## example R code (intro to R): if/else conditions, loops, functions, plotting
## author: alice yue

## if condition ####
x1 <- 10

if (x1 < 10) {
    print("x1 is less than 10")
}

if (x1 <= 10) {
    print("x1 is less than or equal to 10")
}
if (x1 != 10) {
    print("x1 is not 10")
}
if (x1 == 10) {
    print("x1 is 10")
}
if (x1 >= 10) {
    print("x1 is greater than or equal to 10")
}
if (x1 > 10) {
    print("x1 is greater than 10")
}

if (x1 < 10) {
    print("x1 is less than 10")
} else {
    print("x1 is not less than 10")
}

if (x1 < 10) {
    print("x1 is less than 10")
} else if (x1 == 10) {
    print("x1 is 10")
} else {
    print("x1 is greater than 10")
}

if (x1 > 5 & x1 < 15) {
    print("x1 is greater than 5 and less than 15")
}
if (x1 > 25 | x1 < 15) {
    print("x1 is either greater than 25 or less than 15")
}


## loops: for, while ####
j <- 1
for (i in seq_len(10)) {
    print(i)
    print(j)
    j <- j + i
}
print(j)

for (i in c(3:10)) {
    print(i)
}

i <- 3
while (i <= 10) {
    print(i)
    i <- i + 1
}
print(i)


## functions, a set of pre-written code ####
## to see a description of the function, type "?" in front of it
?print
?length
?matrix
?dim
?ncol
?nrow
?colnames
?rownames

# why do we need functions?
# imagine we need to write a piece of code over and over again:
p1 <- 2
p2 <- 4
p3 <- p1 * p2
print(p3)

p1 <- 3
p2 <- 5
p3 <- p1 * p2
print(p3)

p1 <- 6
p2 <- 7
p3 <- p1 * p2
print(p3)

# you can create your own function to make this code shorter!
myfunction <- function(p1, p2) {
    p3 <- p1 * p2
    return(p3)
}

# same code but shorter
p3 <- myfunction(2, 4)
print(p3)

p3 <- myfunction(3, 5)
print(p3)

p3 <- myfunction(6, 7)
print(p3)

# functions are encapsulated: 
# everything that happens in a function stays in the function.
p1 <- 3
p2 <- 5
p3 <- 7
r1 <- myfunction(6, 8)

p1
p2
p3
r1

# if you write many functions, you can bundle these functions into a "package"
# and share it with the community :)


## plotting ####
m2 <- matrix(c(1:10), ncol=2, nrow=5)
m2
colnames(m2) <- c("x", "y")
plot(m2)
lines(m2)
abline(h=7)
abline(v=2)
abline(h=c(8,9))
abline(v=c(2,3), lty="dashed", col="red")
graphics.off() # close plot

# we can also change the size and colour of our points
plot(m2, cex=0.1)
plot(m2, cex=0.5)
plot(m2, cex=1)

plot(m2, col="red")
plot(m2, cex=2, col="red")

# we can also customize the size for each row
plot(m2, cex=c(0.1, 0.5, 1, 2, 3)) 
plot(m2, cex=c(0.1, 0.5, 1, 2, 3), col=c("red", "blue", "green", "black", "yellow")) 

# since size and colours are vectors, we can use condition indexing!
colours <- rep("red", 5)
colours
m2i <- m2[,"x"] < 2 & m2[,"y"] < 8
colours[m2i] <- "blue"
colours
plot(m2, cex=0.5, col=colours)

# add a title with main!
plot(m2, cex=0.5, col=colours, main="my first plot!")


## TRY: practice problems ####

# 1. Fill in the blank (replace "..."):
a <- 10
if (...) {
    print("a is less than 5.")
} else {
    print("a is more than or equal to 5.")
}

# 2. Fill in the blank (replace "...") such that the loop stops when a reaches 0:
a <- 10
for (...) {
    print(a)
    a <- a - 1
}
print(a)

# 3. Rewrite the code in the previous question using a while loop, such that you get the same results.


## TRY: practice problems (challenge) ####

# 1. write a function called "function1" that does the following when called:

function1(2, 3, 6)
# output printed (print()) to console:
# [1] 2
# [1] 6
# [1] 18
# [1] 54
# [1] 162
# [1] 486

# 2. write a function called "function2" that, when given two vectors,
#    return() TRUE if the two vectors are identicle, and FALSE otherwise:

function2(c(1,2,3), c(2,3,4))
# [1] FALSE
function2(c(1,1,2), c(1,1))
# [1] FALSE
function2(c(2,3), c(2,3))
# [1] TRUE

# 3. write a function called "function3" that rbind() all the matrices
#    that have the same number of columns in a list given by the user.
#    return() a list that contains all the rbind()-ed matrices.
#    hint: try using the function unique(), (use ?unique to read about it!)

list3 <- list(
    matrix(0, nrow=2, ncol=4),
    matrix(1, nrow=3, ncol=5),
    matrix(2, nrow=4, ncol=4),
    matrix(3, nrow=2, ncol=5),
    matrix(4, nrow=5, ncol=3)
)
function3(list3)
# returns a list with 3 elements:
# 
# [[1]]
# [,1] [,2] [,3] [,4]
# [1,]    0    0    0    0
# [2,]    0    0    0    0
# [3,]    2    2    2    2
# [4,]    2    2    2    2
# [5,]    2    2    2    2
# [6,]    2    2    2    2
# 
# [[2]]
# [,1] [,2] [,3] [,4] [,5]
# [1,]    1    1    1    1    1
# [2,]    1    1    1    1    1
# [3,]    1    1    1    1    1
# [4,]    3    3    3    3    3
# [5,]    3    3    3    3    3
# 
# [[3]]
# [,1] [,2] [,3]
# [1,]    4    4    4
# [2,]    4    4    4
# [3,]    4    4    4
# [4,]    4    4    4
# [5,]    4    4    4


## practice problem solutions ####

# 1.
function1 <- function(a, b, c) {
    for (i in c(1:c)) {
        print(a)
        a <- a*b
    }
}


# 2.
function2 <- function(a, b) {
    if (length(a) != length(b)) {
        return(FALSE)
    }
    for (i in c(1:length(a))) {
        if (a[i] != b[i]) {
            return(FALSE)
        }
    }
    return(TRUE)
}

function2 <- function(x, y) {
    if (length(x) == length(y)) {
        # two vectors have same length
        i <- 1
        while (i <= length(x)) {
            if (x[i] != y[i]) {
                return(FALSE)
            }
            i <- i + 1
        }
        return(TRUE)
    } else {
        return(FALSE)
    }
}


# 3.
function3 <- function(list3) {
    ncol_n <- rep(0, length(list3))
    for (l3i in c(1:length(list3))) {
        ncol_n[l3i] <- ncol(list3[[l3i]])
    }
    ncol_u <- unique(ncol_n)
    listr <- list()
    for (nui in c(1:length(ncol_u))) {
        l3d <- list3[ncol_n==ncol_u[nui]]
        l3m <- l3d[[1]]
        if (length(l3d) > 1) {
            for (l3m_ in l3d[-1]) {
                l3m <- rbind(l3m, l3m_)
            }
        }
        listr[[nui]] <- l3m
    }
    return(listr)
}

funtion3 <- function(l3) {
    # rbind() all matrices in l3 with the same number of columns
    if (length(l3) <= 1) {
        return(l3)
    }
    # sapply(l3, ncol)
    
    # find the number of columns for each matrix
    ncolumns <- rep(0, length(l3))
    for (i in c(1:length(l3))) {
        ncolumns[i] <- ncol(l3[[i]])
    }
    uc <- unique(ncolumns)
    l3_new <- l3
    l3_new <- list()
    for (i in uc) {
        a <- matrix(0, nrow=0, ncol=0)
        for (j in c(1:l3)) {
            if (i==ncolumns[j]) {
                if (ncol(a)!=i) {
                    a <- l3[[j]]
                } else {
                    a <- rbind(a, l3[[j]])
                }
                
            }
        }
        l3_new <- append(l3_new, a)
    }
}
